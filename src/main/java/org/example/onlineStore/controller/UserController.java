package org.example.onlineStore.controller;

import org.example.onlineStore.domain.Basket;
import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.Role;
import org.example.onlineStore.domain.User;
import org.example.onlineStore.repos.BasketRepo;
import org.example.onlineStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    BasketRepo basketRepo;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        Iterable<User> users = userService.findAll();

        if (filter != null && !filter.isEmpty()){
            users = userService.findAllByEmailContaining(filter);
        }

        model.addAttribute("basketRepo", basketRepo);
        model.addAttribute("filter", filter);
        model.addAttribute("users", users);

        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        model.addAttribute("basketRepo", basketRepo);

        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ){
        userService.saveUser(user, form);

        return "redirect:/user";
    }

    @GetMapping("/profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user){
        model.addAttribute("basketRepo", basketRepo);
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(
            @RequestParam String username,
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String email,
            Model model
    ){
        if (!userService.updateProfile(user, password, email, username)){
            model.addAttribute("message", "Не удалось изменить email, пользователь с таким email уже существует");
            return "profile";
        }

        return "redirect:/user/profile";
    }

    @PostMapping("/addToFavorites")
    @ResponseBody
    public String addToFavorites(@RequestParam ("productId") Product product, @AuthenticationPrincipal User user){
        Optional<User> optionalUser = userService.findById(user.getId());

        if (optionalUser.isEmpty()){
            return "telephoneList";
        }

        User userFromBd = optionalUser.get();

        if (!(userFromBd.getFavoritesProducts().containsKey(product.getId())) || !(userFromBd.getFavoritesProducts().containsValue(product.getType().name()))){
            userFromBd.getFavoritesProducts().put(product.getId(), product.getType().name());
        } else {
            userFromBd.getFavoritesProducts().remove(product.getId(), product.getType().name());
        }

        userService.saveUser(userFromBd);
        return "telephoneList";
    }

    @PostMapping("/addOneToBasket")
    @ResponseBody
    public String addOneToBasket(@RequestParam ("productId") Product product, @AuthenticationPrincipal User user){
        Basket basketFromDb = basketRepo.findByUserAndProductId(user, product.getId());

        if (basketFromDb == null){
            Basket newBasket = new Basket();
            newBasket.setCount((long) 1);
            newBasket.setProductId(product.getId());
            newBasket.setProductType(product.getType());
            newBasket.setUser(user);
            newBasket.setPrice(product.getPrice());
            basketRepo.save(newBasket);
            return "telephoneList";
        }

        basketFromDb.setCount(basketFromDb.getCount() + 1);
        basketRepo.save(basketFromDb);

        return "telephoneList";
    }

    @PostMapping("/deleteOneFromBasket")
    @ResponseBody
    public String deleteOneFromBasket(@RequestParam ("productId") Product product, @AuthenticationPrincipal User user){
        Basket basketFromDb = basketRepo.findByUserAndProductId(user, product.getId());

        if (basketFromDb.getCount() - 1 <= 0){
            basketRepo.delete(basketFromDb);
            return "telephoneList";
        }

        basketFromDb.setCount(basketFromDb.getCount() - 1);
        basketRepo.save(basketFromDb);

        return "telephoneList";
    }

    @PostMapping("/deleteAllFromBasket")
    @ResponseBody
    public String deleteAllFromBasket(@RequestParam ("productId") Product product, @AuthenticationPrincipal User user){
        Basket basketFromDb = basketRepo.findByUserAndProductId(user, product.getId());

        basketRepo.delete(basketFromDb);

        return "telephoneList";
    }

}
