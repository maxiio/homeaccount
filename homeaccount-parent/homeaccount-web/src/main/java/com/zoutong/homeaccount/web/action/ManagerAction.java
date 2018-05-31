package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.ManagerService;
import com.zoutong.homeaccount.service.UserService;
import com.zoutong.homeaccount.utils.CryptographyUtil;
import com.zoutong.homeaccount.utils.PageBean;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class ManagerAction extends ActionSupport implements ModelDriven<Manager>{
	@Autowired
	private ManagerService managerService;
	private Manager manager =new Manager();
	private String checkcode;
	private String[] roleIds;
	private Integer page;
	private Integer rows;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String[] getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String[] roleIds) {
		this.roleIds = roleIds;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	/**
	 * 	Manager currentManager=managerService.findManagerByName(manager.getManager_name());
			if(currentManager!=null){
				if(CryptographyUtil.md5(manager.getManager_pwd(), CryptographyUtil.md5("www.javazt.top", "homeaccount")).equals(currentManager.getManager_pwd())){
						ActionContext.getContext().getSession().put("currentManager", currentManager);
						return "home";
				}else{
					this.addActionError("密码输入错误！");
					return "toLogin";
				}
			}else{
				this.addActionError("用户名输入有误！");
				return "toLogin";
			}
	 */
	private static final long serialVersionUID = 1L;
	
	public String login(){
		Map<String, Object> map = ActionContext.getContext().getSession();
		//获取session中的验证码
		String validatecode = (String) map.get("key");
		//判断输入的验证码和用户名
		if(StringUtils.isNotBlank(checkcode)&&checkcode.equals(validatecode)&&StringUtils.isNotBlank(manager.getManager_name())){
			Subject subject = SecurityUtils.getSubject();
			//输入多的用户名和密码比对shiro框架中动态查询的的用户名和密码
			AuthenticationToken token=new UsernamePasswordToken(manager.getManager_name(), CryptographyUtil.md5(manager.getManager_pwd(), CryptographyUtil.md5("www.javazt.top", "homeaccount")));
			try {
				//认证通过
				subject.login(token);
				Manager currentManager= (Manager) subject.getPrincipal();
				ActionContext.getContext().getSession().put("currentManager", currentManager);
				return "home";
			} catch (Exception e) {
				e.printStackTrace();
				this.addActionError("认证失败，请检查输入！");
				return "toLogin";
			}
		}else{
			this.addActionError("输入的验证码有误！");
			return "toLogin";
		}
	}
	//修改密码
	public String editPwd(){
		Manager model = (Manager) ActionContext.getContext().getSession().get("currentManager");
		managerService.editpwd(manager.getManager_pwd(),model.getManager_id());
		ActionContext.getContext().getSession().remove("currentManager");
		return "logout";
	}
	
	public String logout(){
		ActionContext.getContext().getSession().remove("currentManager");
		return "logout";
	}
	@RequiresPermissions("manager-add")
	public String add(){
		System.out.println(roleIds);
		managerService.save(manager,roleIds);
		return "list";
	}
	@RequiresPermissions("manager-list")
	public String pageQuery() throws IOException{
		DetachedCriteria dc=DetachedCriteria.forClass(Manager.class);
		PageBean pb=new PageBean();
		pb.setCurrentPage(page);
		pb.setPageSize(rows);
		pb.setDetachedCriteria(dc);
		managerService.pageQuery(pb);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"detachedCriteria","currentPage","pageSize","roles"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json=JSONObject.fromObject(pb,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	@RequiresPermissions("manager-update")
	public String foredit(){
		Manager model= managerService.findById(manager.getManager_id());
		ActionContext.getContext().put("manager", model);
		return "edit";
	}
	@RequiresPermissions("manager-update")
	public String initpwd() throws IOException{
		String flag="1";
		try {
			managerService.initpwd(manager.getManager_id());
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	@RequiresPermissions("manager-update")
	public String update(){
		managerService.update(manager,roleIds);
		return "list";
	}
	@Override
	public Manager getModel() {
		return manager;
	}

}
