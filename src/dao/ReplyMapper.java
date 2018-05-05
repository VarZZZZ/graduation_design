package dao;

import entity.Reply;

import java.util.List;

/**
 * Created by Liangying on 2017/11/28.
 */
public interface ReplyMapper {
    public int add(Reply reply);
    public int delete(Reply reply);
    public Reply get(int id);
    public int update(Reply reply);
    public List<Reply> list();
    Reply getByCode(String code);
}
