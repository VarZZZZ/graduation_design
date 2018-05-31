package service;

import entity.AfterSale;

import java.util.List;

/**
 * Created by Liangying on 2018/5/26.
 */
public interface AfterSaleService {
    int add(AfterSale afterSale);
    AfterSale get(int id);
    AfterSale getByOid(int oid);
    int update(AfterSale afterSale);
    List<AfterSale> list();
}
