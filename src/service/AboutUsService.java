package service;

import entity.AboutUs;

import java.util.List;

/**
 * Created by Liangying on 2018/4/10.
 */
public interface AboutUsService {
    int add(AboutUs aboutUs);
    int delete(int id);
    int update(AboutUs aboutUs);
    AboutUs get(int id);
    List<AboutUs> list();
}
