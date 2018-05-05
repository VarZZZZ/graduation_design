package dao;

import entity.CategoryB;


import java.util.List;

/**
 * Created by Liangying on 2018/4/25.
 */
public interface CategoryBMapper {
    public int add(CategoryB categoryB);
    public int delete(int id);
    public CategoryB get(int id);
    CategoryB getByName(String name);
    public int update(CategoryB categoryB);
    public List<CategoryB> list();
    public List<CategoryB> listName(String name);
    public List<CategoryB> listByName(String name);
    public CategoryB listProducts(int id);
}
