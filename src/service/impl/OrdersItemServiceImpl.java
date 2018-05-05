package service.impl;

import dao.OrdersItemMapper;
import entity.OrdersItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrdersItemService;

import java.util.List;

@Service
public class OrdersItemServiceImpl implements OrdersItemService {

	@Autowired
    OrdersItemMapper ordersItemMapper;
	
	@Override
	public int add(OrdersItem ordersItem) {
		return ordersItemMapper.add(ordersItem);
	}

	@Override
	public int delete(int id) {
		return ordersItemMapper.delete(id);
	}

	@Override
	public OrdersItem get(int id) {
		return ordersItemMapper.get(id);
	}

	@Override
	public int update(OrdersItem ordersItem) {
		return ordersItemMapper.update(ordersItem);
	}

	@Override
	public List<OrdersItem> list() {
		return ordersItemMapper.list();
	}

	@Override
	public OrdersItem getByProductOrders(int pid, int cid) {
		return ordersItemMapper.getByProductOrders(pid, cid);
	}

}
