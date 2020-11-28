package org.example.onlineStore.service;

import org.example.onlineStore.domain.*;
import org.example.onlineStore.repos.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    OrderRepo orderRepo;

    @Autowired
    BasketService basketService;

    @Autowired
    UserService userService;

    @Autowired
    MailSender mailSender;

    @Autowired
    ProductService productService;

    public boolean checkout(Order order, User user){

        List<Basket> baskets = basketService.findAllByUser(user);
        List<OrderProduct> tempOrderProducts = new ArrayList<>();
        int sum = 0;

        if (baskets.isEmpty()){
            return false;
        }

        for (Basket basket : baskets) {
            Optional<Product> optionalProduct = productService.findById(basket.getProductId());

            if (optionalProduct.isEmpty()){
                continue;
            }

            Product product = optionalProduct.get();

            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setId(product.getId());
            orderProduct.setBrand(product.getBrand());
            orderProduct.setColor(product.getColor());
            orderProduct.setCountry(product.getCountry());
            orderProduct.setPrice(product.getPrice());
            orderProduct.setDescription(product.getDescription());
            orderProduct.setName(product.getName());
            orderProduct.setType(product.getType());
            orderProduct.setCount(basket.getCount());

            tempOrderProducts.add(orderProduct);

            sum += basket.getCount() * basket.getPrice();
        }


        order.setStatus(OrderStatus.ACCEPTED);
        order.setProducts(tempOrderProducts);
        order.setCost(sum);


        if (!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Здравствуйте, %s \n" + "Для подтверждения заказа посетите следующую ссылку: http://localhost:8080/order/confirm/%s",
                    order.getUserName(),
                    order.getActivationCode()
            );

            mailSender.send(order.getEmail(), "Подтвердите заказ", message);
        }

        orderRepo.save(order);

        return true;
    }

    public boolean confirmOrder(String code, User user) {
        Order order = orderRepo.findByActivationCode(code);

        if (order == null) {
            return false;
        }

        reduceProductCountAndRemoveNotRelevantBaskets(order.getId());

        List<Basket> userBaskets = basketService.findAllByUser(user);

        if (!userBaskets.isEmpty()){
            basketService.deleteAll(userBaskets);
        }

        order.setStatus(OrderStatus.ACTIVE);
        order.setActivationCode(null);
        orderRepo.save(order);

        return true;
    }

    public void reduceProductCountAndRemoveNotRelevantBaskets(String orderId){
        Optional <Order> optionalOrder = orderRepo.findById(orderId);

        if (optionalOrder.isEmpty()) {
            return;
        }

        Order order = optionalOrder.get();

        for (OrderProduct productFromOrder : order.getProducts()) {

            Optional<Product> optionalProduct = productService.findById(productFromOrder.getId());

            if (optionalProduct.isEmpty()){
                continue;
            }

            Product product = optionalProduct.get();
            product.setCount(product.getCount() - productFromOrder.getCount());
            productService.save(product);


            for (Basket basketToDelete : basketService.findAllByProductId(productFromOrder.getId())) {
                if (product.getCount() < basketToDelete.getCount()){
                    basketService.delete(basketToDelete);
                }
            }
        }

    }

    public void increaseProductCount(String orderId) {

        Optional <Order> optionalOrder = orderRepo.findById(orderId);


        if (optionalOrder.isEmpty()) {
            return;
        }

        Order order = optionalOrder.get();


        for (OrderProduct productFromOrder : order.getProducts()) {

            Optional<Product> optionalProduct = productService.findById(productFromOrder.getId());

            if (optionalProduct.isEmpty()){
                continue;
            }

            Product product = optionalProduct.get();
            product.setCount(product.getCount() + productFromOrder.getCount());
            productService.save(product);

        }



    }
    

    public List<Order> findAll() {
        return orderRepo.findAll();
    }

    public List<Order> findAllByUser(User user){
        return orderRepo.findAllByUser(user);
    }

    public List<Order> findAllByUserAndStatus(User user, OrderStatus status) {
        return orderRepo.findAllByUserAndStatus(user, status);
    }

    public List<Order> findAllByStatus(OrderStatus status) {
        return orderRepo.findAllByStatus(status);
    }

    public Optional<Order> findById(String orderId) {
        return orderRepo.findById(orderId);
    }

    public void save(Order order) {
        orderRepo.save(order);
    }

    public void sendMailAboutOrderIsDelivered(Order order) {
        if (!StringUtils.isEmpty(order.getEmail())){
            String message = String.format(
                    "Здравствуйте, %s \n" + "Ваш заказ успешно доставлен, спасибо что пользуетесь нашим интернет магазином!\n" + "С уважением, TechPort!",
                    order.getUserName()
            );

            mailSender.send(order.getEmail(), "Заказ доставлен", message);
        }
    }

    public void sendMailAboutOrderIsCanceled(Order order, String reason) {
        if (!StringUtils.isEmpty(order.getEmail())){
            String message = String.format(

                    "Здравствуйте, %s \n" + "Ваш заказ был отменен модератором, по причине: \n" + reason + "\nДля уточнения интересующих моментов можете связаться с оператором.\n" + "С уважением, TechPort!",
                    order.getUserName()
            );

            mailSender.send(order.getEmail(), "Заказ отменён", message);
        }
    }

    public void sendMailAboutOrderIsActive(Order order) {
        if (!StringUtils.isEmpty(order.getEmail())){
            String message = String.format(
                    "Здравствуйте, %s \n" + "Ваш заказ снова активен.\n" + "С уважением, TechPort!",
                    order.getUserName()
            );

            mailSender.send(order.getEmail(), "Заказ активен", message);
        }
    }
}
