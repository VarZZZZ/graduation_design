package dao;

import entity.OrdersItem;

import java.util.List;

public interface OrdersItemMapper {
	public int add(OrdersItem ordersItem);
	public int delete(int id);
	public OrdersItem get(int id);
	public int update(OrdersItem ordersItem);
	public List<OrdersItem> list();
	public OrdersItem getByProductOrders(int pid, int cid);
}
