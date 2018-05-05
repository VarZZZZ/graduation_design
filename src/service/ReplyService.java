package service;

import entity.Reply;

import java.util.List;

/**
 * Created by Liangying on 2017/11/28.
 */
public interface ReplyService {
    int add(Reply reply);
    int delete(Reply reply);
    int update(Reply reply);
    Reply get(int id);
    List<Reply> list();
    Reply getByCode(String code);
}
