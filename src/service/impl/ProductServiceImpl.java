package service.impl;

import dao.ProductMapper;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ProductService;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
    ProductMapper productMapper;
	
	@Override
	public int add(Product product) {
		return productMapper.add(product);
	}

	@Override
	public int delete(int id) {
		return productMapper.delete(id);
	}

	@Override
	public int update(Product product) {
		Product ps=get(product.getId());

		List<Product> products=list();
		for(Product p:products) {
			if(product.getCode().equals(p.getCode())) {
				if(!product.getCode().equals(ps.getCode())) {
					return 2;
				}
			}
		}
		return productMapper.update(product);
	}

	@Override
	public Product get(int id) {
		return productMapper.get(id);
	}

	@Override
	public Product getByName(String name) {
		return productMapper.getByName(name);
	}

	@Override
	public List<Product> list() {
		return productMapper.list();
	}

	@Override
	public List<Product> listByName(String name) {
		return productMapper.listByName(name);
	}
	
	@Override
	public List<Product> listCode(String code) {
		return productMapper.listCode(code);
	}
}
