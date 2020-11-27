package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Product;
import org.example.onlineStore.domain.StateProduct;
import org.example.onlineStore.domain.TypeProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepo extends JpaRepository<Product, String> {
    List<Product> findAllByNameAndBrandAndCountryAndType(String name, String brand, String country, TypeProduct type);
    List<Product> findAllByNameContaining(String name);

    Optional<Product> findById(String id);

    List<Product> findAllByType(TypeProduct type);

    List<Product> findAllByNameContainingAndType(String filter, TypeProduct type);

    List<Product> findAllByTypeAndName(TypeProduct type, String name);

    List<Product> findAllByState(StateProduct state);

    List<Product> findAllByNameAndColor(String name, String color);

    List<Product> findAllByNameAndType(String name, TypeProduct type);
}
