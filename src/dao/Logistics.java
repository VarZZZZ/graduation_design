package dao;

/**
 * Created by Liangying on 2018/5/6.
 */
public interface Logistics {
    int orderAdd(Logistics logistics);
    int customizedAdd(Logistics logistics);
    Logistics orderGet(int oid);
    Logistics customizedGet(int cusid);


}
