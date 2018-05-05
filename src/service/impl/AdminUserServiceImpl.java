package service.impl;

import dao.AdminUserMapper;
import entity.AdminUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdminUserService;

import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
    AdminUserMapper adminUserMapper;
	
	@Override
	public int add(AdminUser adminUser) {
		return adminUserMapper.add(adminUser);
	}

	@Override
	public int delete(int id) {
		return adminUserMapper.delete(id);
	}

	@Override
	public int update(AdminUser adminUser) {
		return adminUserMapper.update(adminUser);
	}

	@Override
	public AdminUser get(int id) {
		return adminUserMapper.get(id);
	}

	@Override
	public List<AdminUser> list() {
		return adminUserMapper.list();
	}

	@Override
	public AdminUser login(String code, String password) {
		return adminUserMapper.getByCodePassword(code, password);
	}

}
