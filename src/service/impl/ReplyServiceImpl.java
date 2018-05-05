package service.impl;

import dao.ReplyMapper;
import entity.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ReplyService;

import java.util.List;

/**
 * Created by Liangying on 2017/11/28.
 */
@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired(required = false)
    ReplyMapper replyMapper;
    @Override
    public int add(Reply reply) {
        return replyMapper.add(reply);
    }

    @Override
    public int delete(Reply reply) {
        return replyMapper.delete(reply);
    }

    @Override
    public int update(Reply reply) {
        return replyMapper.update(reply);
    }

    @Override
    public Reply get(int id) {
        return replyMapper.get(id);
    }

    @Override
    public List<Reply> list() {
        return replyMapper.list();
    }

    @Override
    public Reply getByCode(String code) {
        return replyMapper.getByCode(code);
    }
}
