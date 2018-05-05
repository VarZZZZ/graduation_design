package dao;

import entity.AdminUser;

import java.util.List;

public interface AdminUserMapper {
	public int add(AdminUser adminUser);
	public int delete(int id);
	public AdminUser get(int id);
	public int update(AdminUser adminUser);
	public List<AdminUser> list();
	public AdminUser getByCodePassword(String code, String password);
}
