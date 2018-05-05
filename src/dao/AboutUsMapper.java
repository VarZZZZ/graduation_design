package dao;

import entity.AboutUs;

import java.util.List;

/**
 * Created by Liangying on 2018/4/10.
 */
public interface AboutUsMapper {

    public int add(AboutUs aboutUs);

    public int delete(int id);

    public AboutUs get(int id);

    public int update(AboutUs aboutUs);

    public List<AboutUs> list();

}
