package service;

import entity.AfterSale;

/**
 * Created by Liangying on 2018/5/26.
 */
public interface AfterSaleService {
    int add(AfterSale afterSale);
    int get(int id);
    int getByOid(int oid);
    int update(AfterSale afterSale);
}
