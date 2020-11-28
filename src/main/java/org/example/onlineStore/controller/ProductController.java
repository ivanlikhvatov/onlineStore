package org.example.onlineStore.controller;

import org.example.onlineStore.domain.*;
import org.example.onlineStore.insideClasses.MyFile;
import org.example.onlineStore.repos.AttributeRepo;
import org.example.onlineStore.service.BasketService;
import org.example.onlineStore.service.ProductService;
import org.example.onlineStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private BasketService basketService;

    @Autowired
    private AttributeRepo attributeRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    MyFile myFile;

    @GetMapping("/fullInformation/{product}")
    public String fullInformationAboutProduct(@PathVariable Product product, Model model, @AuthenticationPrincipal User user){

        User userFromBd = null;

        Map<String, Product> productVariationsByColor = new HashMap<>();
        Map<String, Product> productVariationsByMemory = new HashMap<>();

        if (product.getType().equals(TypeProduct.TELEPHONE) && product.getState().equals(StateProduct.ACTIVE)){

            for (Product tempProduct : productService.findAllByNameAndType(product.getName(), product.getType())){

                if (tempProduct.getState().equals(StateProduct.DELETED)){
                    continue;
                }

                if (!attributeRepo.findByNameAndProduct("internalMemory", product).getValue().equals(attributeRepo.findByNameAndProduct("internalMemory", tempProduct).getValue())){
                    continue;
                }

                String tempColorVariation = tempProduct.getColor();

                if (!productVariationsByColor.containsKey(tempColorVariation)){
                    productVariationsByColor.put(tempColorVariation, tempProduct);
                }
                

            }


            for (Product tempProduct : productService.findAllByNameAndType(product.getName(), product.getType())){

                if (tempProduct.getState().equals(StateProduct.DELETED)){
                    continue;
                }

                if (!product.getColor().equals(tempProduct.getColor())){
                    continue;
                }

                String tempMemoryVariation = attributeRepo.findByNameAndProduct("internalMemory", tempProduct).getValue();

                if (!productVariationsByMemory.containsKey(tempMemoryVariation)){
                    productVariationsByMemory.put(tempMemoryVariation, tempProduct);
                }


            }

        }

        if (product.getType().equals(TypeProduct.NOTEBOOK) && product.getState().equals(StateProduct.ACTIVE)){

            for (Product tempProduct : productService.findAllByNameAndBrandAndCountryAndType(product.getName(), product.getBrand(), product.getCountry(), product.getType())){

                boolean isProductEquals = true;

                List<Attribute> tempProductAttributes = attributeRepo.findAllByProduct(tempProduct);
                tempProductAttributes.sort(Attribute.AttributeNameComparator);

                List<Attribute> productAttributes = attributeRepo.findAllByProduct(product);
                productAttributes.sort(Attribute.AttributeNameComparator);

                if (tempProductAttributes.size() != productAttributes.size()){
                    continue;
                }

                for (int i = 0; i < productAttributes.size(); i++){

                    if (!productAttributes.get(i).getValue().toLowerCase().replaceAll(" ", "").equals(tempProductAttributes.get(i).getValue().toLowerCase().replaceAll(" ", "")) || !productAttributes.get(i).getName().equals(tempProductAttributes.get(i).getName())){

                        isProductEquals = false;

                        break;
                    }

                }

                if (isProductEquals && !productVariationsByColor.containsKey(tempProduct.getColor())) {
                    productVariationsByColor.put(tempProduct.getColor(), tempProduct);
                }

            }
        }

        if (productVariationsByColor.isEmpty()){
            productVariationsByColor.put(product.getColor(), product);
        }

        if (productVariationsByMemory.isEmpty()){
            productVariationsByMemory.put(attributeRepo.findByNameAndProduct("internalMemory", product).getValue(), product);
        }

        if (user != null){
            Optional<User> optionalUserFromBd = userService.findById(user.getId());

            if (optionalUserFromBd.isEmpty()){
                return "greeting";
            }

            userFromBd = optionalUserFromBd.get();
        }

        model.addAttribute("product", product);
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("productService", productService);
        model.addAttribute("userFromBd", userFromBd);

        model.addAttribute("productVariationsByColor", productVariationsByColor);
        model.addAttribute("productVariationsByMemory", productVariationsByMemory);


        return "product";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/add/{type}")
    public String product(Model model, @PathVariable String type){
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("type", type);
        return "productAdd";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/add")
    public String addProduct(Product product,
                             @RequestParam Map<String, String> allAttributes,
                             @RequestParam ("type") String type,
                             @RequestParam("file") List<MultipartFile> files,
                             Model model
                             ) throws IOException {
        model.addAttribute("basketRepo", basketService);
        product.setId(UUID.randomUUID().toString());
        product.setFilesNames(myFile.loadFilesAndGetFileNames(files));
        product.setType(TypeProduct.valueOf(type));
        product.setState(StateProduct.ACTIVE);


        if (!productService.addProduct(product, allAttributes)){
            model.addAttribute("message", "Product already exists!");
            return "productAdd";
        }

        return "redirect:/listProductForAdd";
    }

    @GetMapping("/{type}/list")
    public String productList(@RequestParam(required = false, defaultValue = "") String filter, Model model, @AuthenticationPrincipal User user, @PathVariable String type){
        User userFromBd = null;

        if (user != null){
            Optional<User> optionalUserFromBd = userService.findById(user.getId());

            if (optionalUserFromBd.isEmpty()){
                return "greeting";
            }

            userFromBd = optionalUserFromBd.get();
        }



        model.addAttribute("type", type);
        model.addAttribute("productService", productService);
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("userFromBd", userFromBd);
        model.addAttribute("filter", filter);


        if (type.equals("deleted")){
            List<Product> products = productService.findAllByState(StateProduct.DELETED);

            if (filter != null && !filter.isEmpty() && !products.isEmpty()){
                products.retainAll(productService.findAllByName(filter));
            }

            model.addAttribute("products", products);

            return "productList";
        }

        if (type.equals("all")){
            Iterable<Product> products = productService.findAll();

            if (filter != null && !filter.isEmpty()){
                products = productService.findAllByName(filter);
            }

            model.addAttribute("products", products);

            return "productList";
        }

        if (type.equals("TELEPHONE")){
            Iterable<Product> tels = productService.findAllByType(TypeProduct.TELEPHONE);

            if (filter != null && !filter.isEmpty()){
                tels = productService.findAllByNameContainingAndType(filter, TypeProduct.TELEPHONE);
            }

            model.addAttribute("products", tels);

            return "productList";
        }

        if (type.equals("COMPUTER")){
            Iterable<Product> computers = productService.findAllByType(TypeProduct.COMPUTER);

            if (filter != null && !filter.isEmpty()){
                computers = productService.findAllByNameContainingAndType(filter, TypeProduct.COMPUTER);
            }

            model.addAttribute("products", computers);

            return "productList";
        }

        if (type.equals("NOTEBOOK")){
            Iterable<Product> notebooks = productService.findAllByType(TypeProduct.NOTEBOOK);

            if (filter != null && !filter.isEmpty()){
                notebooks = productService.findAllByNameContainingAndType(filter, TypeProduct.NOTEBOOK);
            }

            model.addAttribute("products", notebooks);

            return "productList";
        }

        if (type.equals("TV")){
            Iterable<Product> tv = productService.findAllByType(TypeProduct.TV);

            if (filter != null && !filter.isEmpty()){
                tv = productService.findAllByNameContainingAndType(filter, TypeProduct.TV);
            }

            model.addAttribute("products", tv);

            return "productList";
        }

        if (!StringUtils.isEmpty(type)){
            List<Product> products = productService.findAllByTypeAndName(TypeProduct.TELEPHONE, type);

            if (products.isEmpty()){
                products = productService.findAllByTypeAndName(TypeProduct.COMPUTER, type);
            }

            if (products.isEmpty()){
                products = productService.findAllByTypeAndName(TypeProduct.TV, type);
            }

            if (products.isEmpty()){
                products = productService.findAllByTypeAndName(TypeProduct.NOTEBOOK, type);
            }

            model.addAttribute("products", products);

        }else {
            List<Product> products = new ArrayList<>();
            model.addAttribute("products", products);
        }

        return "productList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{product}")
    public String productEditForm(@PathVariable Product product, Model model){
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("product", product);
        model.addAttribute("productService", productService);

        return "productEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("{productId}")
    public String productUpdate(
            Product newProduct,
            @RequestParam Map<String, String> newAttributes,
            @RequestParam("productId") Product oldProduct,
            @RequestParam("file") List<MultipartFile> files,
            @PathVariable String productId) throws IOException {

        newProduct.setType(oldProduct.getType());
        newProduct.setId(oldProduct.getId());

        List<String> newFilenames = myFile.reloadingFilesAndGetFileNames(files, oldProduct);

        if (!newFilenames.isEmpty()){
            oldProduct.setFilesNames(newFilenames);
        }

        productService.updateProduct(newAttributes, newProduct, oldProduct);

        return "redirect:/product/" + oldProduct.getType() + "/list";
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/deleteProduct")
    @ResponseBody
    public String productDelete(@RequestParam ("productId") Product product){

        List<Basket> baskets = basketService.findAllByProductId(product.getId());

        if (!baskets.isEmpty()){
            basketService.deleteAll(baskets);
        }

        userService.deleteUsersFavoriteProduct(product.getId());

        product.setState(StateProduct.DELETED);
        productService.save(product);

        return "product deleted";

    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/activateProduct")
    @ResponseBody
    public String productActivate(@RequestParam ("productId") Product product){

        product.setState(StateProduct.ACTIVE);
        productService.save(product);

        return "product activated";

    }
}
