package service.impl;

import dao.CategoryAMapper;
import entity.CategoryA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CategoryAService;

import java.util.List;

/**
 * Created by Liangying on 2018/4/29.
 */
@Service
public class CategoryAServiceImpl implements CategoryAService {
    @Autowired
    CategoryAMapper categoryAMapper;

    @Override
    public int add(CategoryA categoryA) {
        return categoryAMapper.add(categoryA);
    }

    @Override
    public int delete(int id) {
        CategoryA categoryA=listProducts(id);

        if(categoryA!=null) {
            return 2;
        }else {
            return categoryAMapper.delete(id);
        }
    }

    @Override
    public int update(CategoryA categoryA) {
        List<CategoryA> cs=listName(categoryA.getName());
        if(cs.size()==0){
            return categoryAMapper.update(categoryA);
        }else {
            return 2;
        }
    }

    @Override
    public CategoryA get(int id) {
        return categoryAMapper.get(id);
    }

    @Override
    public CategoryA getByName(String name) {
        return categoryAMapper.getByName(name);
    }

    @Override
    public List<CategoryA> listCategoryB() {
        return categoryAMapper.listCategoryB();
    }

    @Override
    public List<CategoryA> list() {
        return categoryAMapper.list();
    }

    @Override
    public List<CategoryA> listName(String name) {
        return categoryAMapper.listName(name);
    }

    @Override
    public List<CategoryA> listByName(String name) {
        return categoryAMapper.listByName(name);
    }

    @Override
    public CategoryA listProducts(int id) {
        return categoryAMapper.listProducts(id);
    }

}
