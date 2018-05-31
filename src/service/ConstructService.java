package service;

import entity.Construct;

import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
public interface ConstructService {
    int add(Construct construct);
    Construct get(int id);
    Construct getByOid(int oid);
    List<Construct> list();
}
