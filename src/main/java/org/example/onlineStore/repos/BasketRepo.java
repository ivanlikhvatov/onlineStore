package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Basket;
import org.example.onlineStore.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BasketRepo extends JpaRepository<Basket, Long> {
    Basket findByUserAndProductId(User user, String productId);
    List<Basket> findAllByUser(User user);
    List<Basket> findAllByProductId(String Id);
}
