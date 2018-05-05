package service.impl;

import dao.OrdersMapper;
import dao.SendMapper;
import entity.Customization;
import entity.Orders;
import entity.Send;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.CustomizationService;
import service.SendService;
import utils.OrderStatus;

import java.util.List;

/**
 * Created by Liangying on 2017/11/16.
 */
@Service
public class SendServiceImpl implements SendService {
    @Autowired(required = false)
    SendMapper sendMapper;

    @Autowired(required = false)
    OrdersMapper ordersMapper;
    @Autowired
    CustomizationService customizationService;
    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int add(Send send) {
        int rel =sendMapper.add(send);
        String code=send.getId();
        Orders orders=ordersMapper.getOrdersByCode(code);
        orders.setStatus(OrderStatus.ORDER_NOT_CONFIRM);
        rel=ordersMapper.update(orders);
        return rel;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int addCus(Send send) {
        int rel = sendMapper.add(send);
        int id = Integer.parseInt(send.getId());
        Customization cus = customizationService.get(id);
        cus.setStatus(OrderStatus.ORDER_NOT_CONFIRM);
        rel = customizationService.update(cus);
        return rel;
    }

    @Override
    public int delete(String id) {
        return sendMapper.delete(id);
    }

    @Override
    public int update(Send send) {
        return sendMapper.update(send);
    }

    @Override
    public Send get(String id) {
        return sendMapper.get(id);
    }

    @Override
    public List<Send> list() {
        return sendMapper.list();
    }
}
