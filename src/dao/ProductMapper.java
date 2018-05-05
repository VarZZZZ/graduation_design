package dao;

import entity.Product;

import java.util.List;

public interface ProductMapper {
	public int add(Product product);
	public int delete(int id);
	public Product get(int id);
	public int update(Product product);
	public List<Product> list();
	public List<Product> listCode(String code);
	public List<Product> listByName(String name);
}
