package org.example.onlineStore.controller;

import org.example.onlineStore.domain.Order;
import org.example.onlineStore.domain.OrderStatus;
import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.User;
import org.example.onlineStore.service.BasketService;
import org.example.onlineStore.service.OrderService;
import org.example.onlineStore.service.ProductService;
import org.example.onlineStore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    BasketService basketService;

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @GetMapping("/checkout")
    public String checkoutPage(@AuthenticationPrincipal User user, Model model){
        List<Product> products = basketService.getProductsFromUserBaskets(user);

        model.addAttribute("products", products);
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("productService", productService);
        model.addAttribute("user", user);
        return "checkoutPage";
    }

    @PostMapping("/checkout")
    public String checkout(
            @RequestParam(name = "phoneNumber") String phoneNumber,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "userName") String userName,
            @RequestParam(name = "typePay") String typePay,
            @RequestParam(name = "address") String address,
            Model model,
            @AuthenticationPrincipal User user){

        Pattern emailPattern = Pattern.compile("(([A-Za-z0-9]+[A-Za-z0-9_.\\-]+[A-Za-z0-9]+)|([A-Za-z0-9]+))@([A-Za-z0-9]{2,}[.])+(ru|com|org|net)");

        model.addAttribute("basketRepo", basketService);
        model.addAttribute("productService", productService);



        if ((email.length() > 255) || (StringUtils.isEmpty(email))
                || (phoneNumber.length() > 255) || (StringUtils.isEmpty(phoneNumber))
                || (userName.length() > 255) || (StringUtils.isEmpty(userName))){
            model.addAttribute("message", "Неккоректные данные");
            return "checkoutPage";
        }


        if (!Pattern.matches(emailPattern.toString(), email)){
            model.addAttribute("message", "Неккоректные данные");
            return "checkoutPage";
        }

        Order order = new Order();

        order.setId(UUID.randomUUID().toString());
        order.setActivationCode(UUID.randomUUID().toString());
        order.setEmail(email);
        order.setPhoneNumber(phoneNumber);
        order.setUserName(userName);
        order.setUser(user);
        order.setTypePay(typePay);
        order.setAddress(address);
        order.setDispatchDate(new Date().toString());


        if (!orderService.checkout(order, user)){
            model.addAttribute("message", "Что-то пошло не так");
            return "checkoutPage";
        }

        return "redirect:/order/number/" + order.getId();
    }

    @GetMapping("/number/{orderId}")
    public String orderNumber(Model model, @PathVariable String orderId){

        System.out.println("id заказа: "+orderId);

        model.addAttribute("orderId", orderId);
        model.addAttribute("basketRepo", basketService);

        Optional<Order> optionalOrder = orderService.findById(orderId);

        if (optionalOrder.isEmpty()){
            return "orderNumber";
        }

        model.addAttribute("username", optionalOrder.get().getUserName());

        return "orderNumber";
    }

    @GetMapping("/confirm/{code}")
    public String  confirm(Model model, @PathVariable String code, @AuthenticationPrincipal User user){
        boolean isConfirm = orderService.confirmOrder(code, user);
        model.addAttribute("basketRepo", basketService);


        if (isConfirm){
            model.addAttribute("message", "заказ успешно подтвержден.");
        } else {
            model.addAttribute("message", "заказ не подвержден, так как код активации не найден!");
        }

        return "orderConfirmed";
    }

    @GetMapping("/list/{status}")
    public String orderList(@RequestParam(required = false, defaultValue = "") String filter,
                            Model model,
                            @AuthenticationPrincipal User user,
                            @PathVariable String status)
    {
        List<Order> orders = new ArrayList<>();

        if (user.isAdmin()){

            if (status.equals("all")){
                orders = orderService.findAll();

                if (filter != null && !filter.isEmpty() && !orders.isEmpty()){
                    orders = orderService.findAllByUser(userService.findByEmail(filter));
                }
            }

            if (status.equals("ACCEPTED")){
                orders = orderService.findAllByStatus(OrderStatus.ACCEPTED);

                if (filter != null && !filter.isEmpty() && !orders.isEmpty()){
                    orders = orderService.findAllByUserAndStatus(userService.findByEmail(filter), OrderStatus.ACCEPTED);
                }
            }

            if (status.equals("ACTIVE")){
                orders = orderService.findAllByStatus(OrderStatus.ACTIVE);

                if (filter != null && !filter.isEmpty() && !orders.isEmpty()){
                    orders = orderService.findAllByUserAndStatus(userService.findByEmail(filter), OrderStatus.ACTIVE);
                }
            }

            if (status.equals("DELIVERED")){
                orders = orderService.findAllByStatus(OrderStatus.DELIVERED);

                if (filter != null && !filter.isEmpty() && !orders.isEmpty()){
                    orders = orderService.findAllByUserAndStatus(userService.findByEmail(filter), OrderStatus.DELIVERED);
                }
            }

            if (status.equals("CANCELED")){
                orders = orderService.findAllByStatus(OrderStatus.CANCELED);

                if (filter != null && !filter.isEmpty() && !orders.isEmpty()){
                    orders = orderService.findAllByUserAndStatus(userService.findByEmail(filter), OrderStatus.CANCELED);
                }
            }


        } else {

            if (status.equals("all")){
                orders = orderService.findAllByUser(user);
            }

            if (status.equals("ACCEPTED")){
                orders = orderService.findAllByUserAndStatus(user, OrderStatus.ACCEPTED);
            }

            if (status.equals("ACTIVE")){
                orders = orderService.findAllByUserAndStatus(user, OrderStatus.ACTIVE);
            }

            if (status.equals("DELIVERED")){
                orders = orderService.findAllByUserAndStatus(user, OrderStatus.DELIVERED);
            }

        }




        model.addAttribute("orders", orders);
        model.addAttribute("user", user);
        model.addAttribute("filter", filter);
        model.addAttribute("orderService", orderService);
        model.addAttribute("productService", productService);
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("productsId");


        return "orderList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/doActive")
    @ResponseBody
    public String doActive(@RequestParam (name = "orderId") String orderId){

        Optional<Order> optionalOrder = orderService.findById(orderId);

        if (optionalOrder.isEmpty()){
            return "order is no active";
        }

        Order order = optionalOrder.get();

        if (order.getStatus().equals(OrderStatus.ACTIVE)){
            return "order is active";
        }

        order.setStatus(OrderStatus.ACTIVE);
        orderService.save(order);
        orderService.reduceProductCountAndRemoveNotRelevantBaskets(orderId);

        orderService.sendMailAboutOrderIsActive(order);

        return "order is active";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/doDelivered")
    @ResponseBody
    public String doDelivered(@RequestParam (name = "orderId") String orderId){
        Optional<Order> optionalOrder = orderService.findById(orderId);

        if (optionalOrder.isEmpty()){
            return "order is no delivered";
        }

        Order order = optionalOrder.get();

        if (order.getStatus().equals(OrderStatus.DELIVERED)){
            return "order is delivered";
        }

        order.setStatus(OrderStatus.DELIVERED);
        order.setDeliveredDate(new Date().toString());

        orderService.save(order);

        orderService.sendMailAboutOrderIsDelivered(order);

        return "order is delivered";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/reasonToCanceled/{orderId}")
    public String reasonToCanceled(@PathVariable String orderId, Model model){
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("orderId", orderId);
        return "reasonToDeleteOrder";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/reasonToCanceled")
    public String doCanceled(@RequestParam (name = "orderId") String orderId, Model model, @RequestParam (name = "reason") String reason){
        model.addAttribute("basketRepo", basketService);

        if (StringUtils.isEmpty(reason)){
            model.addAttribute("message", "Заполните причину удаления заказа!");
            return "reasonToDeleteOrder";
        }

        Optional<Order> optionalOrder = orderService.findById(orderId);

        if (optionalOrder.isEmpty()){
            model.addAttribute("message", "Заказа не существует!");
            return "redirect:/order/list/all";
        }

        Order order = optionalOrder.get();

        if (order.getStatus().equals(OrderStatus.CANCELED)){
            model.addAttribute("message", "Заказ уже отменен!");

            return "redirect:/order/list/all";
        }

        order.setStatus(OrderStatus.CANCELED);
        orderService.save(order);
        orderService.increaseProductCount(orderId);

        orderService.sendMailAboutOrderIsCanceled(order, reason);

        return "redirect:/order/list/all";
    }

}
