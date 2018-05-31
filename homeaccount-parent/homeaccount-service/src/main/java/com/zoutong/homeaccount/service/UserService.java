package com.zoutong.homeaccount.service;

import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.utils.PageBean;

public interface UserService {

	/**
	 * 用户登录方法
	 */
	public User getUserByName(User user);

	/**
	 * 用户注册方法
	 */
	public void saveUser(User user)throws Exception;
	/**
	 * 修改个人资料
	 * @param user
	 */
	public void update(User user);

	public void save(User currentUser);

	public void persistUser(User user);

	public boolean findByUserName(String user_name);

	public User findUserByKeyWord(String keyword);

	public void updatepwd(User user);

	public boolean findUserByEmail(String email);

	public void pageQuery(PageBean pb);

	public void stop(String user_ids);

	public void open(String user_ids);

	public void editLevel(User user);

}
