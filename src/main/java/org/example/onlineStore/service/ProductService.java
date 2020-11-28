package org.example.onlineStore.service;

import org.example.onlineStore.domain.*;
import org.example.onlineStore.repos.AttributeRepo;
import org.example.onlineStore.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class ProductService {
    @Autowired
    ProductRepo productRepo;

    @Autowired
    AttributeRepo attributeRepo;

    @Autowired
    BasketService basketService;

    public boolean addProduct(Product product, Map<String, String> allAttributes){

        List<Attribute> attributes = new ArrayList<>();


        if (product.getType().equals(ProductType.TELEPHONE)){
            Attribute screenResolution = new Attribute(UUID.randomUUID().toString(), product, "screenResolution", allAttributes.get("screenResolution"));
            Attribute screenDiagonal = new Attribute(UUID.randomUUID().toString(), product, "screenDiagonal", allAttributes.get("screenDiagonal"));
            Attribute platform = new Attribute(UUID.randomUUID().toString(), product, "platform", allAttributes.get("platform"));
            Attribute mainCamera = new Attribute(UUID.randomUUID().toString(), product, "mainCamera", allAttributes.get("mainCamera"));
            Attribute frontCamera = new Attribute(UUID.randomUUID().toString(), product, "frontCamera", allAttributes.get("frontCamera"));
            Attribute internalMemory = new Attribute(UUID.randomUUID().toString(), product, "internalMemory", allAttributes.get("internalMemory"));

            attributes.addAll(Arrays.asList(screenResolution, screenDiagonal, platform, mainCamera, frontCamera, internalMemory));
        }

        if (product.getType().equals(ProductType.COMPUTER) || product.getType().equals(ProductType.NOTEBOOK)){
            Attribute screenResolution = new Attribute(UUID.randomUUID().toString(), product, "screenResolution", allAttributes.get("screenResolution"));
            Attribute screenDiagonal = new Attribute(UUID.randomUUID().toString(), product, "screenDiagonal", allAttributes.get("screenDiagonal"));
            Attribute internalMemory = new Attribute(UUID.randomUUID().toString(), product, "internalMemory", allAttributes.get("internalMemory"));
            Attribute ram = new Attribute(UUID.randomUUID().toString(), product, "ram", allAttributes.get("ram"));
            Attribute cpu = new Attribute(UUID.randomUUID().toString(), product, "cpu", allAttributes.get("cpu"));
            Attribute cpuFrequency = new Attribute(UUID.randomUUID().toString(), product, "cpuFrequency", allAttributes.get("cpuFrequency"));
            Attribute countOfCores = new Attribute(UUID.randomUUID().toString(), product, "countOfCores", allAttributes.get("countOfCores"));
            Attribute graphicsProcessor = new Attribute(UUID.randomUUID().toString(), product, "graphicsProcessor", allAttributes.get("graphicsProcessor"));
            Attribute yearRelease = new Attribute(UUID.randomUUID().toString(), product, "yearRelease", allAttributes.get("yearRelease"));

            attributes.addAll(Arrays.asList(screenResolution, screenDiagonal, internalMemory, ram, cpu, cpuFrequency, countOfCores, graphicsProcessor, yearRelease));
        }

        if (product.getType().equals(ProductType.TV)){
            Attribute screenResolution = new Attribute(UUID.randomUUID().toString(), product, "screenResolution", allAttributes.get("screenResolution"));
            Attribute screenDiagonal = new Attribute(UUID.randomUUID().toString(), product, "screenDiagonal", allAttributes.get("screenDiagonal"));
            Attribute yearRelease = new Attribute(UUID.randomUUID().toString(), product, "yearRelease", allAttributes.get("yearRelease"));
            Attribute platform = new Attribute(UUID.randomUUID().toString(), product, "platform", allAttributes.get("platform"));
            Attribute smartTV = new Attribute(UUID.randomUUID().toString(), product, "smartTV", allAttributes.get("smartTV"));
            Attribute sleepTimer = new Attribute(UUID.randomUUID().toString(), product, "sleepTimer", allAttributes.get("sleepTimer"));
            Attribute sound = new Attribute(UUID.randomUUID().toString(), product, "sound", allAttributes.get("sound"));
            Attribute typeOfRemoteControl = new Attribute(UUID.randomUUID().toString(), product, "typeOfRemoteControl", allAttributes.get("typeOfRemoteControl"));
            Attribute size = new Attribute(UUID.randomUUID().toString(), product, "size", allAttributes.get("size"));
            Attribute weight = new Attribute(UUID.randomUUID().toString(), product, "weight", allAttributes.get("weight"));
            Attribute countOfHdmiPorts = new Attribute(UUID.randomUUID().toString(), product, "countOfHdmiPorts", allAttributes.get("countOfHdmiPorts"));

            attributes.addAll(Arrays.asList(screenResolution, screenDiagonal, yearRelease, platform, smartTV, sleepTimer, sound, typeOfRemoteControl, size, weight, countOfHdmiPorts));
        }

        productRepo.save(product);
        attributeRepo.saveAll(attributes);

        return true;
    }

    public List<Product> findAll() {
        return productRepo.findAll();
    }

    public List<Product> findAllByName(String filter) {
        return productRepo.findAllByNameContaining(filter);
    }


    public void updateProduct(Map<String, String> newAttributes,
                              Product newProduct,
                              Product oldProduct
    ) {


        if (!StringUtils.isEmpty(newProduct.getBrand())){
            oldProduct.setBrand(newProduct.getBrand());
        }

        if (!StringUtils.isEmpty(newProduct.getColor())){
            oldProduct.setColor(newProduct.getColor());
        }

        if (!StringUtils.isEmpty(newProduct.getCountry())){
            oldProduct.setCountry(newProduct.getCountry());
        }

        if (!StringUtils.isEmpty(newProduct.getName())){
            oldProduct.setName(newProduct.getName());
        }

        if (!StringUtils.isEmpty(newProduct.getCount())){
            oldProduct.setCount(newProduct.getCount());
        }

        if (!StringUtils.isEmpty(newProduct.getPrice())){
            oldProduct.setPrice(newProduct.getPrice());
        }

        if (!StringUtils.isEmpty(newProduct.getDescription())){
            oldProduct.setDescription(newProduct.getDescription());
        }


        if (oldProduct.getType().equals(ProductType.TELEPHONE)){

            if (!StringUtils.isEmpty(newAttributes.get("screenResolution"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("screenResolution", oldProduct);
                oldAttribute.setValue(newAttributes.get("screenResolution"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("screenDiagonal"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("screenDiagonal", oldProduct);
                oldAttribute.setValue(newAttributes.get("screenDiagonal"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("platform"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("platform", oldProduct);
                oldAttribute.setValue(newAttributes.get("platform"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("mainCamera"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("mainCamera", oldProduct);
                oldAttribute.setValue(newAttributes.get("mainCamera"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("frontCamera"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("frontCamera", oldProduct);
                oldAttribute.setValue(newAttributes.get("frontCamera"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("internalMemory"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("internalMemory", oldProduct);
                oldAttribute.setValue(newAttributes.get("internalMemory"));
                attributeRepo.save(oldAttribute);
            }
        }

        if (oldProduct.getType().equals(ProductType.COMPUTER) || oldProduct.getType().equals(ProductType.NOTEBOOK)){
            if (!StringUtils.isEmpty(newAttributes.get("screenResolution"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("screenResolution", oldProduct);
                oldAttribute.setValue(newAttributes.get("screenResolution"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("screenDiagonal"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("screenDiagonal", oldProduct);
                oldAttribute.setValue(newAttributes.get("screenDiagonal"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("internalMemory"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("internalMemory", oldProduct);
                oldAttribute.setValue(newAttributes.get("internalMemory"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("ram"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("ram", oldProduct);
                oldAttribute.setValue(newAttributes.get("ram"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("cpu"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("cpu", oldProduct);
                oldAttribute.setValue(newAttributes.get("cpu"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("cpuFrequency"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("cpuFrequency", oldProduct);
                oldAttribute.setValue(newAttributes.get("cpuFrequency"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("countOfCores"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("countOfCores", oldProduct);
                oldAttribute.setValue(newAttributes.get("countOfCores"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("graphicsProcessor"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("graphicsProcessor", oldProduct);
                oldAttribute.setValue(newAttributes.get("graphicsProcessor"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("yearRelease"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("yearRelease", oldProduct);
                oldAttribute.setValue(newAttributes.get("yearRelease"));
                attributeRepo.save(oldAttribute);
            }

        }

        if (oldProduct.getType().equals(ProductType.TV)){
            if (!StringUtils.isEmpty(newAttributes.get("screenResolution"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("screenResolution", oldProduct);
                oldAttribute.setValue(newAttributes.get("screenResolution"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("screenDiagonal"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("screenDiagonal", oldProduct);
                oldAttribute.setValue(newAttributes.get("screenDiagonal"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("yearRelease"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("yearRelease", oldProduct);
                oldAttribute.setValue(newAttributes.get("yearRelease"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("platform"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("platform", oldProduct);
                oldAttribute.setValue(newAttributes.get("platform"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("smartTV"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("smartTV", oldProduct);
                oldAttribute.setValue(newAttributes.get("smartTV"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("sleepTimer"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("sleepTimer", oldProduct);
                oldAttribute.setValue(newAttributes.get("sleepTimer"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("sound"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("sound", oldProduct);
                oldAttribute.setValue(newAttributes.get("sound"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("typeOfRemoteControl"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("typeOfRemoteControl", oldProduct);
                oldAttribute.setValue(newAttributes.get("typeOfRemoteControl"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("size"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("size", oldProduct);
                oldAttribute.setValue(newAttributes.get("size"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("weight"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("weight", oldProduct);
                oldAttribute.setValue(newAttributes.get("weight"));
                attributeRepo.save(oldAttribute);
            }

            if (!StringUtils.isEmpty(newAttributes.get("countOfHdmiPorts"))){
                Attribute oldAttribute = attributeRepo.findByNameAndProduct("countOfHdmiPorts", oldProduct);
                oldAttribute.setValue(newAttributes.get("countOfHdmiPorts"));
                attributeRepo.save(oldAttribute);
            }
        }

        for (Basket basket : basketService.findAllByProductId(oldProduct.getId())) {
            if (oldProduct.getCount() < basket.getCount()){
                basketService.delete(basket);
            }

            if (basket.getPrice() != oldProduct.getPrice()){
                basket.setPrice(oldProduct.getPrice());
                basketService.save(basket);
            }
        }


        productRepo.save(oldProduct);
    }




    public Optional<Product> findById(String productId) {
        return productRepo.findById(productId);
    }

    public List<Product> findAllByType(ProductType type) {
        return productRepo.findAllByType(type);
    }

    public List<Product> findAllByNameContainingAndType(String filter, ProductType type) {
        return productRepo.findAllByNameContainingAndType(filter, type);
    }

    public Attribute findByNameAndValue(String name, String value){
        return attributeRepo.findByNameAndValue(name, value);
    }

    public Attribute findByNameAndProduct(String name, Product product){
        return attributeRepo.findByNameAndProduct(name, product);
    }

    public List<Attribute> findAllByProduct(Product product){
        return attributeRepo.findAllByProduct(product);
    }

    public void delete(Product product) {
        List<Attribute> attributes = attributeRepo.findAllByProduct(product);
        attributeRepo.deleteAll(attributes);
        productRepo.delete(product);
    }

    public void save(Product product) {
        productRepo.save(product);
    }

    public List<Product> findAllByTypeAndName(ProductType type, String name) {
        return productRepo.findAllByTypeAndName(type, name);
    }

    public List<Product> findAllByState(ProductState state) {
        return productRepo.findAllByState(state);
    }

    public List<Product> findAllById(Set<String> id) {
        return productRepo.findAllById(id);
    }

    public List<Product> findAllByNameAndColor(String name, String color) {
        return productRepo.findAllByNameAndColor(name, color);
    }

    public  List<Product> findAllByNameAndBrandAndCountryAndType(String name, String brand, String country, ProductType type) {
        return productRepo.findAllByNameAndBrandAndCountryAndType(name, brand, country, type);
    }

    public Product findPhoneByNameAndColorAndInternalMemory(String name, String color, String internalMemory){

        for (Product product : productRepo.findAllByNameAndColor(name, color)) {
            if (attributeRepo.findByProductAndNameAndValue(product, "internalMemory", internalMemory) != null){
                if (!product.getType().equals(ProductType.TELEPHONE)){
                    continue;
                }
                return product;
            }
        }

        return productRepo.findAllByNameAndColor(name, color).get(0);
    }

    public List<Product> findAllByNameAndType(String name, ProductType type) {
        return productRepo.findAllByNameAndType(name, type);
    }
}
