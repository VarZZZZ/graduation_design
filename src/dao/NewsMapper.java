package dao;

import entity.News;

import java.util.List;

/**
 * Created by Liangying on 2018/5/2.
 */
public interface NewsMapper {
    public int add(News news);

    public int delete(int id);

    public News get(int id);

    public int update(News news);

    public List<News> list();
    List<News> listByTitle(String title);
}
