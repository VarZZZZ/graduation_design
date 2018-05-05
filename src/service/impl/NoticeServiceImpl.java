package service.impl;

import dao.NoticeMapper;
import entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.NoticeService;

import java.util.List;

/**
 * Created by Liangying on 2017/11/22.
 */
@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    NoticeMapper noticeMapper;

    @Override
    public int add(Notice notice) {
        return noticeMapper.add(notice);
    }

    @Override
    public int delete(int id) {
        return noticeMapper.delete(id);
    }

    @Override
    public int update(Notice notice) {
        return noticeMapper.update(notice);
    }

    @Override
    public Notice get(int id) {
        return noticeMapper.get(id);
    }

    @Override
    public List<Notice> list() {
        return noticeMapper.list();
    }
}
