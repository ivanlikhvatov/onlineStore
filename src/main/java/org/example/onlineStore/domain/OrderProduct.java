package org.example.onlineStore.domain;

import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.util.Objects;

@Embeddable
public class OrderProduct {
    private String id;
    private Long count;
    @Enumerated(EnumType.STRING)
    private ProductType type;

    private String name;
    private double price;
    private String brand;
    private String country;
    private String color;

    private String description;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderProduct that = (OrderProduct) o;
        return Double.compare(that.price, price) == 0 &&
                id.equals(that.id) &&
                count.equals(that.count) &&
                type == that.type &&
                name.equals(that.name) &&
                brand.equals(that.brand) &&
                country.equals(that.country) &&
                color.equals(that.color) &&
                description.equals(that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, count, type, name, price, brand, country, color, description);
    }
}
