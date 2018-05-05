package service;

import entity.OnlineReply;

import java.util.List;

/**
 * Created by Liangying on 2018/5/3.
 */
public interface OnlineReplyService {
    public int add(OnlineReply onlineReply);
    public int delete(int id);
    public OnlineReply get(int id);
    public int update(OnlineReply onlineReply);
    public List<OnlineReply> list();
}
