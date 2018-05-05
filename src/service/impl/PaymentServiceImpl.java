package service.impl;

import dao.OrdersMapper;
import dao.PaymentMapper;
import entity.Customization;
import entity.Orders;
import entity.Payment;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.CustomizationService;
import service.PaymentService;
import utils.OrderStatus;

import java.util.List;

/**
 * Created by Liangying on 2017/11/16.
 */
@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired(required = false)
    PaymentMapper paymentMapper;

    @Autowired(required = false)
    OrdersMapper ordersMapper;
    @Autowired
    CustomizationService customizationService;
    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int add(Payment payment) {
        int rel = paymentMapper.add(payment);
        String code = payment.getId();
        Orders orders = ordersMapper.getOrdersByCode(code);
        orders.setStatus(OrderStatus.ORDER_NOT_SEND);
        rel = ordersMapper.update(orders);
        return rel;
    }

    @Override
    public int delete(String id) {

        return paymentMapper.delete(id);
    }

    @Override
    public int update(Payment payment) {
        return paymentMapper.update(payment);
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int addCusPayment(Payment payment) {
        int rel = paymentMapper.add(payment);
        int id = Integer.parseInt(payment.getId());
        Customization c = customizationService.get(id);
        c.setStatus(OrderStatus.ORDER_NOT_SEND);
        rel = customizationService.update(c);
        return rel;
    }

    @Override
    public Payment get(String id) {
        return paymentMapper.get(id);
    }

    @Override
    public List<Payment> list() {
        return paymentMapper.list();
    }
}
