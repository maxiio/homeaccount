package com.zoutong.homeaccount.dao;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.User;

public interface UserDao extends BaseDao<User> {

	/**
	 * 根据用户名查找用户
	 */
	public User getUserByName(String user_name);


	public void persistUser(User user);

	public User findByUserName(String user_name);

	public User findUserByEmail(String email);

}
