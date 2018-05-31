package com.zoutong.homeaccount.realm;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.zoutong.homeaccount.dao.FunctionDao;
import com.zoutong.homeaccount.dao.ManagerDao;
import com.zoutong.homeaccount.dao.UserDao;
import com.zoutong.homeaccount.entity.Function;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.entity.User;
/**
 * 自定义realm
 * @author zoutong
 *
 */
public class MyRealm extends AuthorizingRealm{
	@Autowired
	private UserDao userDao;
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private FunctionDao functionDao;
	/**
	 * 认证方法
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("=========自定义realm===========");
		UsernamePasswordToken passwordToken = (UsernamePasswordToken)token;
		//获得页面输入的用户名
		String username = passwordToken.getUsername();
		//根据用户名查询数据库中的密码
		Manager manager=managerDao.findManagerByName(username);
		User user=userDao.findByUserName(username);
		if(user!=null){
			AuthenticationInfo info = new SimpleAuthenticationInfo(user,"123", this.getName());
			return info;
		}
		if(manager == null){
			//页面输入的用户名不存在
			return null;
		}
		//简单认证信息对象
		AuthenticationInfo info = new SimpleAuthenticationInfo(manager, manager.getManager_pwd(), this.getName());
		//框架负责比对数据库中的密码和页面输入的密码是否一致
		return info;
	}
	
	/**
	 * 授权方法
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
		Manager manager = (Manager) SecurityUtils.getSubject().getPrincipal();
		List<Function> list =null;
		if(manager.getManager_name().equals("admin")){
			list = functionDao.findAll();
		}else{
			list=functionDao.findByManagerId(manager.getManager_id());
		}
		//授权
		for (Function function : list) {
			info.addStringPermission(function.getCode());
		}
		return info;
	}


}
