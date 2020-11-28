package org.example.onlineStore.controller;

import org.example.onlineStore.domain.User;
import org.example.onlineStore.repos.BasketRepo;
import org.example.onlineStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;
import java.util.regex.Pattern;

@Controller
public class RegistrationController {
    @Autowired
    UserService userService;

    @Autowired
    BasketRepo basketRepo;

    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("basketRepo", basketRepo);
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        model.put("basketRepo", basketRepo);

        if ((user.getEmail().length() > 255) || (StringUtils.isEmpty(user.getEmail()))
                || (user.getPassword().length() > 255) || (StringUtils.isEmpty(user.getPassword()))
                || (user.getUsername().length() > 255) || (StringUtils.isEmpty(user.getUsername()))){
            model.put("message", "Неккоректные данные");
            return "registration";
        }

        Pattern emailPattern = Pattern.compile("(([A-Za-z0-9]+[A-Za-z0-9_.\\-]+[A-Za-z0-9]+)|([A-Za-z0-9]+))@([A-Za-z0-9]{2,}[.])+(ru|com|org|net)");

        if (!Pattern.matches(emailPattern.toString(), user.getEmail())){
            model.put("message", "Неккоректные данные");
            return "registration";
        }

        if (!userService.addUser(user)){
            model.put("message", "Пользователь с таким E-mail уже существует");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("loginError")
    public String loginError(Model model){
        model.addAttribute("basketRepo", basketRepo);
        model.addAttribute("message", "Неверный E-mail или пароль, попробуйте ещё раз");
        return "login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
        boolean isActivate = userService.activateUser(code);
        model.addAttribute("basketRepo", basketRepo);

        if (isActivate){
            model.addAttribute("message", "Вы успешно зарегистрировались");
        } else {
            model.addAttribute("message", "Код активации не найден!");
        }

        return "login";
    }
}