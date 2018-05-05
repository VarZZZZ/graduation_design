package entity;

import java.util.List;

/**
 * Created by Liangying on 2018/4/23.
 */
public class CategoryA {
    private int id;
    private String name;
    private List<CategoryB> categoryBs;
    private List<Product> products;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<CategoryB> getCategoryBs() {
        return categoryBs;
    }

    public void setCategoryBs(List<CategoryB> categoryBs) {
        this.categoryBs = categoryBs;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
