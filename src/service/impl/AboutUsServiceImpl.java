package service.impl;

import dao.AboutUsMapper;
import entity.AboutUs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AboutUsService;

import java.util.List;

/**
 * Created by Liangying on 2018/4/10.
 */
@Service
public class AboutUsServiceImpl implements AboutUsService {
    @Autowired
    AboutUsMapper aboutUsMapper;

    @Override
    public int add(AboutUs aboutUs) {
        return aboutUsMapper.add(aboutUs);
    }

    @Override
    public int delete(int id) {
        return aboutUsMapper.delete(id);
    }

    @Override
    public int update(AboutUs aboutUs) {
        return aboutUsMapper.update(aboutUs);
    }

    @Override
    public AboutUs get(int id) {
        return aboutUsMapper.get(id);
    }

    @Override
    public List<AboutUs> list() {
        return aboutUsMapper.list();
    }
}
