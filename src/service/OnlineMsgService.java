package service;

import entity.OnlineMsg;

import java.util.List;

/**
 * Created by Liangying on 2018/5/3.
 */
public interface OnlineMsgService {
    int add(OnlineMsg onlineMsg);
    public int delete(int id);
    public OnlineMsg get(int id);
    public OnlineMsg getOnlineMsg(int id);
    public OnlineMsg getOnlineMsgByUid(int id);
    public int update(OnlineMsg onlineMsg);
    public List<OnlineMsg> list();
    public List<OnlineMsg> listOnlineMsg();
}
