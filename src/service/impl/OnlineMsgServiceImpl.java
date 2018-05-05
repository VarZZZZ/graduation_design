package service.impl;

import dao.OnlineMsgMapper;
import entity.OnlineMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OnlineMsgService;

import java.util.List;

/**
 * Created by Liangying on 2018/5/3.
 */
@Service
public class OnlineMsgServiceImpl implements OnlineMsgService {
    @Autowired
    OnlineMsgMapper onlineMsgMapper;
    @Override
    public int add(OnlineMsg onlineMsg) {
        return onlineMsgMapper.add(onlineMsg);
    }

    @Override
    public int delete(int id) {
        return onlineMsgMapper.delete(id);
    }

    @Override
    public OnlineMsg get(int id) {
        return onlineMsgMapper.get(id);
    }

    @Override
    public OnlineMsg getOnlineMsg(int id) {
        return onlineMsgMapper.getOnlineMsg(id);
    }

    @Override
    public OnlineMsg getOnlineMsgByUid(int id) {
        return onlineMsgMapper.getOnlineMsgByUid(id);
    }

    @Override
    public int update(OnlineMsg onlineMsg) {
        return onlineMsgMapper.update(onlineMsg);
    }

    @Override
    public List<OnlineMsg> list() {
        return onlineMsgMapper.list();
    }

    @Override
    public List<OnlineMsg> listOnlineMsg() {
        return onlineMsgMapper.listOnlineMsg();
    }
}
