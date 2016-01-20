package com.structuredproducts.persistence.entities.instrument;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="PRODUCT_TYPE", schema = "INSTRUMENT")
public class Currency implements Serializable {
    @Id
    @GeneratedValue
    private int id;
    @Column(unique = true)
    private String name;

    public Currency() {
    }

    public Currency(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
