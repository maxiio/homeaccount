package com.zoutong.homeaccount.service;

import java.util.List;

import com.zoutong.homeaccount.entity.Function;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.utils.PageBean;

public interface FunctionService {

	public void pageQuery(PageBean pb);

	public List<Function> findAll();

	public void save(Function function);

	public List<Function> findajax();

	public Function findById(String id);

	public void update(Function function);

	public List<Function> findByRole(String role_id);

	public List<Function> findMenu(Manager model);

}
