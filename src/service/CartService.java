package service;

import entity.Cart;

import java.util.List;

public interface CartService {
	public int add(Cart cart);
	public int delete(int id);
	public Cart get(int id);
	public Cart getCart(int id);
	public Cart getCartByUid(int id);
	public int update(Cart cart);
	public List<Cart> list();
	public List<Cart> listCart();
	public float getTotal(int id);
}
