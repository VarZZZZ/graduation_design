package entity;

import java.util.List;

/**
 * Created by Liangying on 2018/4/23.
 */
public class CategoryB {
    private int id;
    private int caid;
    private String name;
    private CategoryA categoryA;
    private List<Product> products;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCaid() {
        return caid;
    }

    public void setCaid(int caid) {
        this.caid = caid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public CategoryA getCategoryA() {
        return categoryA;
    }

    public void setCategoryA(CategoryA categoryA) {
        this.categoryA = categoryA;
    }
}
