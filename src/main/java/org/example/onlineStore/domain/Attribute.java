package org.example.onlineStore.domain;

import javax.persistence.*;
import java.util.Comparator;

@Entity
@Table(name = "attributes")
public class Attribute implements Comparable<Attribute>{
    @Id
    private String id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Product product;
    private String name;
    private String value;

    public Attribute() {
    }

    public Attribute(String id, Product product, String name, String value) {
        this.id = id;
        this.product = product;
        this.name = name;
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "Attribute{" +
                "id='" + id + '\'' +
                ", product=" + product +
                ", name='" + name + '\'' +
                ", value='" + value + '\'' +
                '}';
    }

    @Override
    public int compareTo(Attribute attribute) {
        return 0;
    }

    public static Comparator<Attribute> AttributeNameComparator
            = new Comparator<Attribute>() {

        public int compare(Attribute attribute1, Attribute attribute2) {

            String attributeName1 = attribute1.getName().toUpperCase();
            String attributeName2 = attribute2.getName().toUpperCase();

            return  attributeName1.compareTo(attributeName2);
        }

    };
}
