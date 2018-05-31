package com.zoutong.homeaccount.service;

import java.util.List;

import com.zoutong.homeaccount.entity.Role;
import com.zoutong.homeaccount.utils.PageBean;

public interface RoleService {

	public void save(Role role, String functionIds);

	public void pageQuery(PageBean pb);

	public List<Role> findAll();

	public Role findById(String role_id);

	public void update(Role role, String functionIds);
}
