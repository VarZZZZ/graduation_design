package service;

import entity.Product;

import java.util.List;

/**
 * Created by Liangying on 2018/4/25.
 */
public interface ProductService {
    int add(Product product);
    int delete(int id);
    int update(Product product);
    Product get(int id);
    Product getByName(String name);
    List<Product> list();
    List<Product> listCode(String code);
    List<Product> listByName(String name);
}
