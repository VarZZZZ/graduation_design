package service.impl;

import dao.NewsMapper;
import entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.NewsService;

import java.util.List;

/**
 * Created by Liangying on 2018/5/2.
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsMapper newsMapper;
    @Override
    public int add(News news) {
        return newsMapper.add(news);
    }

    @Override
    public int delete(int id) {
        return newsMapper.delete(id);
    }

    @Override
    public int update(News news) {
        return newsMapper.update(news);
    }

    @Override
    public News get(int id) {
        return newsMapper.get(id);
    }

    @Override
    public List<News> list() {
        return newsMapper.list();
    }

    @Override
    public List<News> listByTitle(String title) {
        return newsMapper.listByTitle(title);
    }
}
