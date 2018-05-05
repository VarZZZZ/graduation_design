package service.impl;

import dao.OnlineReplyMapper;
import entity.OnlineReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OnlineReplyService;

import java.util.List;

/**
 * Created by Liangying on 2018/5/3.
 */
@Service
public class OnlineReplyServiceImpl implements OnlineReplyService {
    @Autowired
    OnlineReplyMapper onlineReplyMapper;
    @Override
    public int add(OnlineReply onlineReply) {
        return onlineReplyMapper.add(onlineReply);
    }

    @Override
    public int delete(int id) {
        return onlineReplyMapper.delete(id);
    }

    @Override
    public OnlineReply get(int id) {
        return onlineReplyMapper.get(id);
    }

    @Override
    public int update(OnlineReply onlineReply) {
        return onlineReplyMapper.update(onlineReply);
    }

    @Override
    public List<OnlineReply> list() {
        return onlineReplyMapper.list();
    }
}
