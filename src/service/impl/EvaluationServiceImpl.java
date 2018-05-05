package service.impl;

import dao.EvaluationMapper;
import dao.OrdersMapper;
import entity.Customization;
import entity.Evaluation;
import entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.CustomizationService;
import service.EvaluationService;
import service.OrdersService;
import utils.OrderStatus;

import java.util.List;

/**
 * Created by Liangying on 2017/11/20.
 */
@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Autowired(required = false)
    EvaluationMapper evaluationMapper;

    @Autowired(required = false)
    OrdersMapper ordersMapper;

    @Autowired
    CustomizationService customizationService;
    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int add(Evaluation evaluation) {
        int rel = evaluationMapper.add(evaluation);
        String code = evaluation.getId();
        Orders o = ordersMapper.getOrdersByCode(code);
        o.setStatus(OrderStatus.ORDER_OK);
        rel=ordersMapper.update(o);
        return rel;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int cudAdd(Evaluation evaluation) {
        int rel = evaluationMapper.add(evaluation);
        int id = Integer.parseInt(evaluation.getId());
        Customization cus = customizationService.get(id);
        cus.setStatus(OrderStatus.ORDER_OK);
        rel = customizationService.update(cus);
        return rel;
    }

    @Override
    public int delete(String id) {
        return evaluationMapper.delete(id);
    }

    @Override
    public int update(Evaluation evaluation) {
        return evaluationMapper.update(evaluation);
    }

    @Override
    public Evaluation get(String id) {
        return evaluationMapper.get(id);
    }

    @Override
    public List<Evaluation> list() {
        return evaluationMapper.list();
    }
}
