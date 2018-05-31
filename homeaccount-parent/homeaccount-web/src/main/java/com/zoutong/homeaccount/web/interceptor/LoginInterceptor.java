package com.zoutong.homeaccount.web.interceptor;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.entity.User;
public class LoginInterceptor extends MethodFilterInterceptor {
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		Manager manager = (Manager) ActionContext.getContext().getSession().get("currentManager");
		if(user!=null||manager!=null){
			System.out.println("=========自定义struts拦截器===========");
			return invocation.invoke();
		}
		return "toLogin";
	}

}
