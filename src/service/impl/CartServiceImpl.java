package service.impl;

import dao.CartItemMapper;
import dao.CartMapper;
import dao.ProductMapper;
import entity.Cart;
import entity.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CartService;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
    CartMapper cartMapper;
	
	@Autowired
    CartItemMapper cartItemMapper;
	
	@Autowired
    ProductMapper productMapper;
	
	@Override
	public int add(Cart cart) {
		return cartMapper.add(cart);
	}

	@Override
	public int delete(int id) {
		return cartMapper.delete(id);
	}

	@Override
	public Cart get(int id) {
		return cartMapper.get(id);
	}

	@Override
	public Cart getCart(int id) {
		return cartMapper.getCart(id);
	}

	@Override
	public Cart getCartByUid(int id) {
		return cartMapper.getCartByUid(id);
	}

	@Override
	public int update(Cart cart) {
		return cartMapper.update(cart);
	}

	@Override
	public List<Cart> list() {
		return cartMapper.list();
	}

	@Override
	public List<Cart> listCart() {
		return cartMapper.listCart();
	}

	@Override
	public float getTotal(int id) {
		float total=0;
		Cart cart=cartMapper.getCart(id);
		for(CartItem ci:cart.getCartItems()) {
			float sum=0;
			sum=sum+ci.getNumber()*ci.getProduct().getPrice();
			total=total+sum;
		}
		return total;
	}

}
