package org.example.onlineStore.controller;

import org.example.onlineStore.domain.User;
import org.example.onlineStore.repos.BasketRepo;
import org.example.onlineStore.service.ProductService;
import org.example.onlineStore.service.SliderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller()
public class MainController {
    @Autowired
    BasketRepo basketRepo;

    @Autowired
    ProductService productService;

    @Autowired
    SliderService sliderService;

    @GetMapping("/")
    public String greeting (Model model){
        model.addAttribute("basketRepo", basketRepo);
        model.addAttribute("productService", productService);
        model.addAttribute("mainSlider", sliderService.findByName("mainSlider"));
        return "greeting";
    }

    @GetMapping
    public String navbar(Model model, @AuthenticationPrincipal User user){
        model.addAttribute("basketRepo", basketRepo);
        model.addAttribute("user", user);
        return "parts/navbar";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("listProductForAdd")
    public String productAdd(Model model){
        model.addAttribute("basketRepo", basketRepo);
        return "listProductForAdd";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/listProductForEdit")
    public String productEdit(Model model){
        model.addAttribute("basketRepo", basketRepo);
        return "listProductForEdit";
    }
}
