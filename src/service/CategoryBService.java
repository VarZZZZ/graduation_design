package service;

import entity.CategoryB;

import java.util.List;

/**
 * Created by Liangying on 2018/4/25.
 */
public interface CategoryBService {
    int add(CategoryB categoryB);
    int delete(int id);
    int update(CategoryB categoryB);
    CategoryB get(int id);
    List<CategoryB> list();
    List<CategoryB> listName(String name);
    List<CategoryB> listByName(String name);
    CategoryB listProducts(int id);
    CategoryB getByName(String name);
}
