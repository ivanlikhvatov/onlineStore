package org.example.onlineStore.controller;

import org.example.onlineStore.domain.Basket;
import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.User;
import org.example.onlineStore.service.BasketService;
import org.example.onlineStore.service.ProductService;
import org.example.onlineStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class BasketController {
    @Autowired
    BasketService basketService;

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @GetMapping("/basket")
    public String basketList(@RequestParam(required = false, defaultValue = "") String filter,
                         Model model,
                         @AuthenticationPrincipal User user)
    {
        List<Product> products = basketService.getProductsFromUserBaskets(user);
        List<Basket> userBaskets = basketService.findAllByUser(user);




        if (filter != null && !filter.isEmpty() && !userBaskets.isEmpty()){
            products.retainAll(productService.findAllByName(filter));
        }



        Optional<User> optionalUserFromBd = userService.findById(user.getId());

        if (optionalUserFromBd.isEmpty()){
            return "greeting";
        }


        User userFromBd = optionalUserFromBd.get();


        model.addAttribute("products", products);
        model.addAttribute("userFromBd", userFromBd);
        model.addAttribute("filter", filter);
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("productService", productService);

        return "basketList";
    }
}
