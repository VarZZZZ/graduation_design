package service.impl;

import dao.CartItemMapper;
import entity.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CartItemService;

import java.util.List;

@Service
public class CartItemServiceImpl implements CartItemService {
	@Autowired
    CartItemMapper cartItemMapper;
	
	@Override
	public int add(CartItem cartItem) {
		return cartItemMapper.add(cartItem);
	}

	@Override
	public int delete(int id) {
		return cartItemMapper.delete(id);
	}

	@Override
	public CartItem get(int id) {
		return cartItemMapper.get(id);
	}

	@Override
	public int update(CartItem cartItem) {
		return cartItemMapper.update(cartItem);
	}

	@Override
	public List<CartItem> list() {
		return cartItemMapper.list();
	}

	@Override
	public CartItem getByProductCart(int pid, int cid) {
		return cartItemMapper.getByProductCart(pid, cid);
	}

}
