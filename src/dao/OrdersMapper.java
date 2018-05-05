package dao;

import entity.Orders;

import java.util.List;

public interface OrdersMapper {
	public int add(Orders orders);
	public int delete(int id);
	public Orders get(int id);
	public Orders getOrders(int id);
	public List<Orders> getOrdersByUid(int id);
	public Orders getOrdersByCode(String code);
	public int update(Orders orders);
	public List<Orders> list();
	public List<Orders> listOrder();

}
