package org.example.onlineStore.controller;

import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.User;
import org.example.onlineStore.repos.BasketRepo;
import org.example.onlineStore.service.ProductService;
import org.example.onlineStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import java.util.Optional;

@Controller

@RequestMapping("/favorites/list")
public class FavoritesController {
    @Autowired
    ProductService productService;

    @Autowired
    BasketRepo basketRepo;

    @Autowired
    UserService userService;

    @GetMapping
    public String favList(@RequestParam(required = false, defaultValue = "") String filter, Model model, @AuthenticationPrincipal
    User user){

        Optional<User> optionalUserFromBd = userService.findById(user.getId());

        if (optionalUserFromBd.isEmpty()){
            return "greeting";
        }

        User userFromBd = optionalUserFromBd.get();

        List<Product> products = productService.findAllById(userFromBd.getFavoritesProducts().keySet());

        if (filter != null && !filter.isEmpty() && !products.isEmpty()){
            products.retainAll(productService.findAllByName(filter));
        }

        model.addAttribute("productService", productService);
        model.addAttribute("basketRepo", basketRepo);
        model.addAttribute("userFromBd", userFromBd);
        model.addAttribute("filter", filter);
        model.addAttribute("products", products);

        return "favoritesList";
    }
}
