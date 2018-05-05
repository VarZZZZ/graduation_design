package dao;

import entity.CategoryA;

import java.util.List;

/**
 * Created by Liangying on 2018/4/23.
 */
public interface CategoryAMapper {
    public int add(CategoryA categoryA);
    public int delete(int id);
    public CategoryA get(int id);
    CategoryA getByName(String name);
    public int update(CategoryA categoryA);
    public List<CategoryA> list();
    public List<CategoryA> listName(String name);
    public List<CategoryA> listByName(String name);
    public List<CategoryA> listCategoryB();
    public CategoryA listProducts(int id);
}
