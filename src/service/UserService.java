package service;

import entity.User;

import java.util.List;

/**
 * Created by Liangying on 2018/3/31.
 */
public interface UserService {
    int add(User User);
    int delete(int id);
    int update(User User);
    User get(int id);
    List<User> list();
    User login(String mobile, String password);
    public User getByMobile(String mobile);
}
