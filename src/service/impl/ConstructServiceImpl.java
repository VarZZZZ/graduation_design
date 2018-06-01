package service.impl;

import dao.ConstructMapper;
import entity.Construct;
import entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ConstructService;
import service.OrdersService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
@Service
public class ConstructServiceImpl implements ConstructService {
    @Autowired
    ConstructMapper constructMapper;
    @Autowired
    OrdersService ordersService;
    @Override
    public int add(Construct construct) {
        return constructMapper.add(construct);
    }

    @Override
    public Construct get(int id) {
        Construct construct = constructMapper.get(id);
        Orders orders = ordersService.getOrders(construct.getOid());
        construct.setOrders(orders);
        return construct;
    }

    @Override
    public Construct getByOid(int oid) {
        Construct construct = constructMapper.getByOid(oid);
        Orders orders;
        if(construct!=null) {
            orders = ordersService.getOrders(construct.getOid());
            construct.setOrders(orders);
        }
        return construct;
    }

    @Override
    public List<Construct> list() {
        List<Construct> constructs = constructMapper.list();
        List<Construct> constructList = new ArrayList<>();
        for(Construct c: constructs){
            Orders o = ordersService.getOrders(c.getOid());
            c.setOrders(o);
            constructList.add(c);
        }
        return constructList;
    }

    @Override
    public int update(Construct construct) {
        return constructMapper.update(construct);
    }


}
