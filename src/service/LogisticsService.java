package service;

import dao.LogisticsMapper;
import entity.Logistics;

/**
 * Created by Liangying on 2018/5/6.
 */
public interface LogisticsService {
    int orderAdd(Logistics logistics);
    int customizedAdd(Logistics logistics);
    Logistics orderGet(int oid);
    Logistics customizedGet(int cusid);
}
