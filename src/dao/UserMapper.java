package dao;

import entity.User;

import java.util.List;

/**
 * Created by Liangying on 2018/1/10.
 */
public interface UserMapper {
    int add(User user);
    int delete(int id);
    User get(int id);
    int update(User user);
    List<User> list();
    User getByMobilePassword(String mobile,String password);
    User getByMobile(String mobile);
}
