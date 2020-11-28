package org.example.onlineStore.service;

import org.example.onlineStore.domain.Basket;
import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.User;
import org.example.onlineStore.repos.BasketRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BasketService {
    @Autowired
    BasketRepo basketRepo;

    @Autowired
    ProductService productService;

    public List<Basket> findAllByUser(User user) {
        return basketRepo.findAllByUser(user);
    }

    public Basket findByUserAndProductId(User user, String productId){
        return basketRepo.findByUserAndProductId(user, productId);
    }

    public List<Basket> findAllByProductId(String Id){
        return basketRepo.findAllByProductId(Id);
    }

    public void deleteAll(List<Basket> baskets) {
        basketRepo.deleteAll(baskets);
    }

    public List<Basket> findAll() {
        return basketRepo.findAll();
    }

    public void delete(Basket basket) {
        basketRepo.delete(basket);
    }

    public void save(Basket basket) {
        basketRepo.save(basket);
    }

    public List<Product> getProductsFromUserBaskets(User user){
        List<Product> products = new ArrayList<>();

        List<Basket> userBaskets = basketRepo.findAllByUser(user);
        if (!userBaskets.isEmpty()){
            for (Basket basket: userBaskets) {
                Optional<Product> optionalProduct = productService.findById(basket.getProductId());

                if (optionalProduct.isEmpty()){
                    continue;
                }

                products.add(optionalProduct.get());
            }
        }

        return products;
    }
}
