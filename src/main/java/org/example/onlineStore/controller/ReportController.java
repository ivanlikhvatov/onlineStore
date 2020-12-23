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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String getPieChart(Model model,
                              @RequestParam(required = false, defaultValue = "") String start,
                              @RequestParam(required = false, defaultValue = "") String end
    ) {
        Map<String, Integer> currentYearMoneyProfit = new LinkedHashMap<>();
        Map<String, Integer> currentYearCountProfit = new LinkedHashMap<>();
        Map<String, Double> currentYearProductMoneyProfit = new LinkedHashMap<>();
        Map<String, Long> currentYearProductCountProfit = new LinkedHashMap<>();
        LocalDateTime dateStart = null;
        LocalDateTime dateEnd = null;
        double productPrice;
        int orderCost;



        if (!StringUtils.isEmpty(start)){
            dateStart = LocalDateTime.of(
                    Integer.parseInt(start.split("-")[0]),
                    Integer.parseInt(start.split("-")[1]),
                    Integer.parseInt(start.split("-")[2]), 0, 0
            );
        }

        if (!StringUtils.isEmpty(end)){
            dateEnd = LocalDateTime.of(
                    Integer.parseInt(end.split("-")[0]),
                    Integer.parseInt(end.split("-")[1]),
                    Integer.parseInt(end.split("-")[2]), 0, 0
            );
        }

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (dateStart == null && dateEnd == null){
                if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                    continue;
                }
            }

            if (dateStart != null){
                if (order.getDeliveredDate().isBefore(dateStart)){
                    continue;
                }
            }

            if (dateEnd != null){
                if (order.getDeliveredDate().isAfter(dateEnd)){
                    continue;
                }
            }

            if (currentYearMoneyProfit.get(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear()) == null){
                currentYearMoneyProfit.put(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear(), order.getCost());
            } else {
                orderCost = currentYearMoneyProfit.get(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear());
                orderCost += order.getCost();
                currentYearMoneyProfit.put(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear(), orderCost);
            }
        }

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (dateStart == null && dateEnd == null){
                if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                    continue;
                }
            }

            if (dateStart != null){
                if (order.getDeliveredDate().isBefore(dateStart)){
                    continue;
                }
            }

            if (dateEnd != null){
                if (order.getDeliveredDate().isAfter(dateEnd)){
                    continue;
                }
            }

            if (currentYearCountProfit.get(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear()) == null){
                int count = 0;

                for (OrderProduct product: order.getProducts()) {
                    count += product.getCount();
                }

                currentYearCountProfit.put(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear(), count);
            } else {
                int count = currentYearCountProfit.get(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear());

                for (OrderProduct product: order.getProducts()) {
                    count += product.getCount();
                }

                currentYearCountProfit.put(order.getDeliveredDate().getMonth().toString() + " " + order.getDeliveredDate().getYear(), count);
            }
        }

        for (Order order : orderService.findAllByStatus(OrderStatus.DELIVERED)) {
            if (dateStart == null && dateEnd == null){
                if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                    continue;
                }
            }

            if (dateStart != null){
                if (order.getDeliveredDate().isBefore(dateStart)){
                    continue;
                }
            }

            if (dateEnd != null){
                if (order.getDeliveredDate().isAfter(dateEnd)){
                    continue;
                }
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
            if (dateStart == null && dateEnd == null){
                if (order.getDeliveredDate().getYear() != LocalDateTime.now().getYear()){
                    continue;
                }
            }

            if (dateStart != null){
                if (order.getDeliveredDate().isBefore(dateStart)){
                    continue;
                }
            }

            if (dateEnd != null){
                if (order.getDeliveredDate().isAfter(dateEnd)){
                    continue;
                }
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
        model.addAttribute("start", start);
        model.addAttribute("end", end);

        return "report";
    }
}
