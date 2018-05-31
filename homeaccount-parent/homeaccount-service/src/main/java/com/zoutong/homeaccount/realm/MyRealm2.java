package com.zoutong.homeaccount.realm;


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
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.UserService;
/**
 * 自定义realm
 * @author zoutong
 *
 */
public class MyRealm2 extends AuthorizingRealm{
	@Autowired
	private UserService userService;
	/**
	 * 认证方法
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("=========自定义realm2===========");
		UsernamePasswordToken passwordToken = (UsernamePasswordToken)token;
		//获得页面输入的用户名
		String username = passwordToken.getUsername();
		//根据用户名查询数据库中的密码
		User model=new User();
		model.setUser_name(username);
		User user=userService.getUserByName(model);
		if(user==null){
			return null;
		}
		System.out.println("==========mima======"+user.getUser_password()+"=======================");
		//简单认证信息对象
		AuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getUser_password(),this.getName());
		//框架负责比对数据库中的密码和页面输入的密码是否一致
		return info;
	}
	
	/**
	 * 授权方法
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
		
		return info;
	}


}
