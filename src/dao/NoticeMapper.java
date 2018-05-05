package dao;

import entity.Notice;

import java.util.List;

/**
 * Created by Liangying on 2017/11/22.
 */
public interface NoticeMapper {

    public int add(Notice notice);

    public int delete(int id);

    public Notice get(int id);

    public int update(Notice notice);

    public List<Notice> list();

}
