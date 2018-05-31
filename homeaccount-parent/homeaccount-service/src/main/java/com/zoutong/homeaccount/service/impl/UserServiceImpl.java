package com.zoutong.homeaccount.service.impl;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.zoutong.homeaccount.dao.UserDao;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.UserService;
import com.zoutong.homeaccount.utils.CryptographyUtil;
import com.zoutong.homeaccount.utils.DateFormateUtil;
import com.zoutong.homeaccount.utils.PageBean;
@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	public User getUserByName(User user) {
		user= userDao.getUserByName(user.getUser_name());
		Date date=new Date();
		String now = DateFormateUtil.transferNotTime(date);
		if(user!=null){
			String old = DateFormateUtil.transferNotTime(user.getLoginDate());
			if(!now.equals(old)){
				//每日登录加5积分
				user.setScore(user.getScore()+5);
				user.setLoginDate(date);
			}
		}
		return user;
	}
	public void save(User user) {
		userDao.merge(user);
	}
	public void saveUser(User user) throws Exception {
		String md5PWD =  CryptographyUtil.md5(user.getUser_password(), CryptographyUtil.md5("www.javazt.top", user.getUser_name()));
		user.setUser_password(md5PWD);
		user.setState('0');
		//注册赠送20积分
		user.setScore(20);
		user.setRegister_date(new Date());
		user.setLevel(0);
		userDao.merge(user);
	}
	
	public void update(User user) {
		userDao.update(user);
		
	}

	public void persistUser(User user) {
		userDao.persistUser(user);
	}
	@Override
	public boolean findByUserName(String user_name) {
		User user=userDao.findByUserName(user_name);
		if(user!=null){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public User findUserByKeyWord(String keyword) {
		return userDao.getUserByName(keyword);
	}
	//修改密码
	@Override
	public void updatepwd(User user) {
		User user2 = userDao.load(user.getUser_id());
		String newpwd = CryptographyUtil.md5(user.getUser_password(), CryptographyUtil.md5("www.javazt.top", user2.getUser_name()));
		userDao.executeUpdate("user.update",newpwd, user.getUser_id());
		
	}
	//检查email
	@Override
	public boolean findUserByEmail(String email) {
		User user=userDao.findUserByEmail(email);
		if(user!=null) return true;
		return false;
	}
	@Override
	public void pageQuery(PageBean pb) {
		userDao.pageQuery(pb);
	}
	
	//封禁用户
	@Override
	public void stop(String user_ids) {
		String[] userIds = user_ids.split(",");
		for (String user_id: userIds) {
			userDao.executeUpdate("user.stop", Long.parseLong(user_id));
		}
	}
	//解封用户
	@Override
	public void open(String user_ids) {
		String[] userIds = user_ids.split(",");
		for (String user_id: userIds) {
			userDao.executeUpdate("user.open", Long.parseLong(user_id));
		}
	}
	//修改用户等级
	@Override
	public void editLevel(User user) {
		userDao.executeUpdate("user.editlevel", user.getLevel(),user.getUser_id());
	}
	
/*public static void main(String[] args) {
    Date date1 = new Date();
    String time1 = new SimpleDateFormat("yyyy-MM-dd").format(date1);
    String time2 = "2017-03-17";
 
    if(time1.equals(time2)){
    System.out.println("是相同的一天");
    }else{
    System.out.println("不是相同的一天");
    }
}*/
}
