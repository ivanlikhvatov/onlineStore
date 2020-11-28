package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.ProductState;
import org.example.onlineStore.domain.ProductType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepo extends JpaRepository<Product, String> {
    List<Product> findAllByNameAndBrandAndCountryAndType(String name, String brand, String country, ProductType type);
    List<Product> findAllByNameContaining(String name);

    Optional<Product> findById(String id);

    List<Product> findAllByType(ProductType type);

    List<Product> findAllByNameContainingAndType(String filter, ProductType type);

    List<Product> findAllByTypeAndName(ProductType type, String name);

    List<Product> findAllByState(ProductState state);

    List<Product> findAllByNameAndColor(String name, String color);

    List<Product> findAllByNameAndType(String name, ProductType type);
}
