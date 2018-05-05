package service;

import entity.CategoryA;

import java.util.List;

/**
 * Created by Liangying on 2018/4/29.
 */
public interface CategoryAService {
    int add(CategoryA categoryA);
    int delete(int id);
    int update(CategoryA categoryA);
    CategoryA get(int id);
    CategoryA getByName(String name);
    List<CategoryA> listCategoryB();
    List<CategoryA> list();
    List<CategoryA> listName(String name);
    List<CategoryA> listByName(String name);
    CategoryA listProducts(int id);
}
