package service;

import entity.Notice;

import java.util.List;

/**
 * Created by Liangying on 2017/11/22.
 */
public interface NoticeService {
    int add(Notice notice);
    int delete(int id);
    int update(Notice notice);
    Notice get(int id);
    List<Notice> list();
}
