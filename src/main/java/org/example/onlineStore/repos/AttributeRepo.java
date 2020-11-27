package org.example.onlineStore.repos;

import org.example.onlineStore.domain.Attribute;
import org.example.onlineStore.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface AttributeRepo extends JpaRepository<Attribute, String> {
    Attribute findByNameAndValue(String name, String value);
    Attribute findByNameAndProduct(String name, Product product);
    List<Attribute> findAllByProduct(Product product);

    Attribute findByProductAndNameAndValue(Product product, String name, String value);
}
