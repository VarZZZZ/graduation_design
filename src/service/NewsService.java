package service;

import entity.News;

import java.util.List;

/**
 * Created by Liangying on 2018/5/2.
 */
public interface NewsService {
    int add(News news);
    int delete(int id);
    int update(News news);
    News get(int id);
    List<News> list();
    List<News> listByTitle(String title);
}
