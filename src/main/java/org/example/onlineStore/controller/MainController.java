package org.example.onlineStore.controller;

import org.example.onlineStore.domain.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller()
public class MainController {

    @GetMapping("/")
    public String greeting (Model model){
        return "greeting";
    }

    @GetMapping
    public String navbar(Model model, @AuthenticationPrincipal User user){
        model.addAttribute("user", user);
        return "parts/navbar";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("listProductForAdd")
    public String productAdd(Model model){
        return "listProductForAdd";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/listProductForEdit")
    public String productEdit(Model model){
        return "listProductForEdit";
    }
}
