package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Order;
import org.example.onlineStore.domain.OrderStatus;
import org.example.onlineStore.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepo extends JpaRepository<Order, String> {
    List<Order> findAllByUser(User user);

    List<Order> findAllByUserAndStatus(User user, OrderStatus status);

    List<Order> findAllByStatus(OrderStatus status);

    Order findByActivationCode(String activationCode);
}
