package service;

import entity.CartItem;

import java.util.List;

public interface CartItemService {
	public int add(CartItem cartItem);
	public int delete(int id);
	public CartItem get(int id);
	public int update(CartItem cartItem);
	public List<CartItem> list();
	public CartItem getByProductCart(int pid, int cid);
}
