package service;

import entity.Orders;

import java.util.List;

public interface OrdersService {
	public int add(Orders orders);
	public int delete(int id);
	public Orders get(int id);
	public Orders getOrders(int id);
	public List<Orders> getOrdersByUid(int id);
	public int update(Orders orders);
	public List<Orders> list();
	public List<Orders> listOrder();
	public float getTotal(int id);
	public int addToOrders(int uid);
	Orders getByCode(String code);

}
