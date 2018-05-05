package dao;

import entity.Payment;

import java.util.List;

/**
 * Created by Liangying on 2017/11/16.
 */
public interface PaymentMapper {
    public int add(Payment payment);
    public int delete(String id);
    public Payment get(String id);
    public int update(Payment payment);
    public List<Payment> list();
}
