package service.impl;

import dao.UserMapper;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

/**
 * Created by Liangying on 2018/3/31.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public int add(User user) {
        return userMapper.add(user);
    }

    @Override
    public int delete(int id) {
        return userMapper.delete(id);
    }

    @Override
    public int update(User user) {
        return userMapper.update(user);
    }

    @Override
    public User get(int id) {
        return userMapper.get(id);
    }

    @Override
    public List<User> list() {
        return userMapper.list();
    }

    @Override
    public User login(String mobile, String password) {
        return userMapper.getByMobilePassword(mobile,password);
    }

    @Override
    public User getByMobile(String mobile) {
        return userMapper.getByMobile(mobile);
    }
}
