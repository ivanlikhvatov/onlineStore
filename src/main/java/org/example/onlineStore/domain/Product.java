package org.example.onlineStore.domain;

import org.example.onlineStore.insideClasses.LoadableFiles;
import org.hibernate.annotations.Type;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product")
public class Product implements LoadableFiles {
    @Id
    private String id;
    private Long count;
    @Enumerated(EnumType.STRING)
    private ProductType type;

    private String name;
    private double price;
    private String brand;
    private String country;
    private String color;
    @Enumerated(EnumType.STRING)
    private ProductState state;

    @Type(type = "text")
    private String description;

    @ElementCollection
    @CollectionTable (name = "pathsToProductImages", joinColumns = @JoinColumn (name = "product_id"))
    @Column (name = "path")
    private List<String> filesNames;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public ProductType getType() {
        return type;
    }

    public void setType(ProductType type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getFilesNames() {
        return filesNames;
    }

    public void setFilesNames(List<String> filesNames) {
        this.filesNames = filesNames;
    }

    public ProductState getState() {
        return state;
    }

    public void setState(ProductState state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", count=" + count +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", brand='" + brand + '\'' +
                ", country='" + country + '\'' +
                ", color='" + color + '\'' +
                ", description='" + description + '\'' +
                ", filesNames=" + filesNames +
                '}';
    }
}
