package org.example.onlineStore.controller;

import org.example.onlineStore.domain.User;
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
}
