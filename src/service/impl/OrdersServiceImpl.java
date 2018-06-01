package service.impl;

import dao.*;
import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.ConstructService;
import service.OrdersService;
import utils.CodeUtil;
import utils.OrderStatus;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
    OrdersMapper ordersMapper;
	
	@Autowired
    OrdersItemMapper ordersItemMapper;
	
	@Autowired
    ProductMapper productMapper;
	
	@Autowired
    CartMapper cartMapper;
	
	@Autowired
    CartItemMapper cartItemMapper;

	@Autowired
	ConstructService constructService;
	
	@Override
	public int add(Orders orders) {
		return ordersMapper.add(orders);
	}

	@Override
	public int delete(int id) {
		return ordersMapper.delete(id);
	}

	@Override
	public Orders get(int id) {
		return ordersMapper.get(id);
	}

	@Override
	public Orders getOrders(int id) {
		return ordersMapper.getOrders(id);
	}

	@Override
	public List<Orders> getOrdersByUid(int id) {
	    List<Orders> ordersList = ordersMapper.getOrdersByUid(id);
	    List<Orders> orders = new ArrayList<>();
	    for(Orders o:ordersList){
	        Construct c = constructService.getByOid(o.getId());
	        if(c!=null){
	            o.setConstruct(c);
            }
            orders.add(o);
        }
		return orders;
	}

	@Override
	public int update(Orders orders) {
		String code = orders.getCode();
		Orders o = ordersMapper.getOrdersByCode(code);
		o.setStatus(OrderStatus.ORDER_NOT_EVALUATION);
		return ordersMapper.update(o);
	}

	@Override
	public List<Orders> list() {
		return ordersMapper.list();
	}

	@Override
	public List<Orders> listOrder() {
		return ordersMapper.listOrder();
	}

	@Override
	public float getTotal(int id) {
		float total=0;
		Orders orders=ordersMapper.getOrders(id);
		for(OrdersItem ci:orders.getOrdersItems()) {
			float sum=0;
			sum=sum+ci.getNumber()*ci.getProduct().getPrice();
			total=total+sum;
		}
		return total;
	}

	@Override
	@Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
	public String addToOrders(int uid) {
		Orders orders=new Orders();
		CodeUtil codeUtil=new CodeUtil();
		String code=codeUtil.AutoOrdersCode();
		orders.setCode(code);
		orders.setUid(uid);
		orders.setStatus(OrderStatus.ORDER_NOT_PAY);
		ordersMapper.add(orders);
		
		Orders or=ordersMapper.getOrdersByCode(code);
		
		Cart cart=cartMapper.getCartByUid(uid);
		for(CartItem ci:cart.getCartItems()) {
			OrdersItem ordersItem=new OrdersItem();
			ordersItem.setNumber(ci.getNumber());
			Product product=ci.getProduct();
			ordersItem.setProduct(product);
			ordersItem.setOrders(or);
			ordersItemMapper.add(ordersItem);
			cartItemMapper.delete(ci.getId());
		}
		float total = getTotal(or.getId());
		Orders newOrders = ordersMapper.get(or.getId());
		newOrders.setTotal(total);
		ordersMapper.update(newOrders);
		return code;
	}

	@Override
	public Orders getByCode(String code) {
		return ordersMapper.getOrdersByCode(code);
	}

}
