package service;

import entity.Payment;

import java.util.List;

/**
 * Created by Liangying on 2017/11/16.
 */
public interface PaymentService {
    int add(Payment payment);
    int delete(String id);
    int update(Payment payment);
    int addCusPayment(Payment payment);
    Payment get(String id);
    List<Payment> list();
}
