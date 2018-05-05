package dao;

import entity.Cart;

import java.util.List;

/**
 * Created by Liangying on 2018/5/1.
 */
public interface CartMapper {
    public int add(Cart cart);
    public int delete(int id);
    public Cart get(int id);
    public Cart getCart(int id);
    public Cart getCartByUid(int id);
    public int update(Cart cart);
    public List<Cart> list();
    public List<Cart> listCart();
}
