package service;

import entity.Send;

import java.util.List;

/**
 * Created by Liangying on 2017/11/16.
 */
public interface SendService {
    int add(Send send);
    int addCus(Send send);
    int delete(String id);
    int update(Send send);
    Send get(String id);
    List<Send> list();
}
