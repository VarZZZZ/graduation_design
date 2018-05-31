package service.impl;

import dao.AfterSaleMapper;
import entity.AfterSale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AfterSaleService;
import utils.AfterSaleStatus;
import utils.OrderStatus;

import java.util.List;

/**
 * Created by Liangying on 2018/5/26.
 */
@Service
public class AfterSaleServiceImpl implements AfterSaleService {
    @Autowired
    AfterSaleMapper afterSaleMapper;
    @Override
    public int add(AfterSale afterSale) {
        return afterSaleMapper.add(afterSale);
    }

    @Override
    public AfterSale get(int id) {
        return afterSaleMapper.get(id);
    }

    @Override
    public AfterSale getByOid(int oid) {
        return afterSaleMapper.getByOid(oid);
    }

    @Override
    public int update(AfterSale afterSale) {
        return afterSaleMapper.update(afterSale);
    }

    @Override
    public List<AfterSale> list() {
        return afterSaleMapper.list();
    }
}
