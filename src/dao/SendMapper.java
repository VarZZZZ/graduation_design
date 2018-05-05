package dao;

import entity.Send;

import java.util.List;

/**
 * Created by Liangying on 2017/11/16.
 */
public interface SendMapper {
    public int add(Send send);
    public int delete(String id);
    public Send get(String id);
    public int update(Send sender);
    public List<Send> list();
}
