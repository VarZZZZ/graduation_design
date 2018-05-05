package service;

import entity.AdminUser;

import java.util.List;

public interface AdminUserService {
	int add(AdminUser adminUser);
	int delete(int id);
	int update(AdminUser adminUser);
	AdminUser get(int id);
	List<AdminUser> list();
	public AdminUser login(String code, String password);
}
