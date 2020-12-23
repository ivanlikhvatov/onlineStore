package org.example.onlineStore.controller;

import org.example.onlineStore.domain.Order;
import org.example.onlineStore.domain.OrderProduct;
import org.example.onlineStore.domain.OrderStatus;
import org.example.onlineStore.service.BasketService;
import org.example.onlineStore.service.OrderService;
import org.example.onlineStore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.time.LocalDateTime;
import java.util.*;

@PreAuthorize("hasAuthority('ADMIN')")
@Controller
@RequestMapping("/report")
public class ReportController {
    @Autowired
    OrderService orderService;

    @Autowired
    ProductService productService;

    @Autowired
    BasketService basketService;


    @GetMapping
    public String getPieChart(Model model) {
        Map<String, Integer> currentYearMoneyProfit = new TreeMap<>();
        Map<String, Integer> currentYearCountProfit = new TreeMap<>();
        Map<String, Double> currentYearProductMoneyProfit = new TreeMap<>();
        Map<String, Long> currentYearProductCountProfit = new TreeMap<>();
        int orderCost;
        double productPrice;

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                continue;
            }

            if (currentYearMoneyProfit.get(order.getDeliveredDate().getMonth().toString()) == null){
                currentYearMoneyProfit.put(order.getDeliveredDate().getMonth().toString(), order.getCost());
            } else {
                orderCost = currentYearMoneyProfit.get(order.getDeliveredDate().getMonth().toString());
                orderCost += order.getCost();
                currentYearMoneyProfit.put(order.getDeliveredDate().getMonth().toString(), orderCost);
            }
        }

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                continue;
            }

            if (currentYearCountProfit.get(order.getDeliveredDate().getMonth().toString()) == null){
                int count = 0;

                for (OrderProduct product: order.getProducts()) {
                    count += product.getCount();
                }

                currentYearCountProfit.put(order.getDeliveredDate().getMonth().toString(), count);
            } else {
                int count = currentYearCountProfit.get(order.getDeliveredDate().getMonth().toString());

                for (OrderProduct product: order.getProducts()) {
                    count += product.getCount();
                }

                currentYearCountProfit.put(order.getDeliveredDate().getMonth().toString(), count);
            }
        }

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                continue;
            }

            for (OrderProduct product: order.getProducts()) {
                if (currentYearProductMoneyProfit.get(product.getId()) == null){
                    currentYearProductMoneyProfit.put(product.getId(), (product.getPrice() * product.getCount()));
                } else {
                    productPrice = currentYearProductMoneyProfit.get(product.getId());
                    productPrice += (product.getPrice() * product.getCount());
                    currentYearProductMoneyProfit.put(product.getId(), productPrice);
                }
            }
        }

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                continue;
            }

            for (OrderProduct product: order.getProducts()) {
                if (currentYearProductCountProfit.get(product.getId()) == null){
                    currentYearProductCountProfit.put(product.getId(), product.getCount());
                } else {
                    long count = currentYearProductCountProfit.get(product.getId());
                    count += product.getCount();
                    currentYearProductCountProfit.put(product.getId(), count);
                }
            }
        }

        model.addAttribute("currentYearCountProfit", currentYearCountProfit);
        model.addAttribute("currentYearMoneyProfit", currentYearMoneyProfit);
        model.addAttribute("currentYearProductMoneyProfit", currentYearProductMoneyProfit);
        model.addAttribute("currentYearProductCountProfit", currentYearProductCountProfit);
        model.addAttribute("orderService", orderService);
        model.addAttribute("basketRepo", basketService);
        model.addAttribute("productService", productService);

        return "report";
    }
}
