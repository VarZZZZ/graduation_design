package dao;

import entity.Construct;

import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
public interface ConstructMapper {
    int add(Construct construct);
    Construct get(int id);
    Construct getByOid(int oid);
    List<Construct> list();
    int update(Construct construct);
}
