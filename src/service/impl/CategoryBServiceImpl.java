package service.impl;


import dao.CategoryBMapper;
import entity.CategoryB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CategoryBService;

import java.util.List;

@Service
public class CategoryBServiceImpl implements CategoryBService {
	@Autowired(required = false)
	CategoryBMapper categoryBMapper;
	
	@Override
	public int add(CategoryB categoryB) {
		return categoryBMapper.add(categoryB);
	}

	@Override
	public int delete(int id) {
		CategoryB categoryB=listProducts(id);

        if(categoryB!=null) {
        	return 2;
        }else {
        	return categoryBMapper.delete(id);
        }
	}

	@Override
	public int update(CategoryB categoryB) {
		List<CategoryB> cs=listName(categoryB.getName());
		if(cs.size()==0){
			return categoryBMapper.update(categoryB);
		}else {
			return 2;
		}
	}

	@Override
	public CategoryB get(int id) {
		return categoryBMapper.get(id);
	}

	@Override
	public List<CategoryB> list() {
		return categoryBMapper.list();
	}

	@Override
	public List<CategoryB> listName(String name) {
		return categoryBMapper.listName(name);
	}

	@Override
	public List<CategoryB> listByName(String name) {
		return categoryBMapper.listByName(name);
	}

	@Override
	public CategoryB listProducts(int id) {
		return categoryBMapper.listProducts(id);
	}

	@Override
	public CategoryB getByName(String name) {
		return categoryBMapper.getByName(name);

	}

}
