package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Role;
import com.zoutong.homeaccount.service.RoleService;
import com.zoutong.homeaccount.utils.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class RoleAction extends ActionSupport implements ModelDriven<Role>{

	private Role role=new Role();
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

	@Autowired
	private RoleService roleService;
	private String functionIds;
	public String getFunctionIds() {
		return functionIds;
	}
	public void setFunctionIds(String functionIds) {
		this.functionIds = functionIds;
	}
	@RequiresPermissions("role-add")
	public String add(){
		roleService.save(role,functionIds);
		return "list";
	}
	@RequiresPermissions("role-list")
	public String pageQuery() throws IOException{
		DetachedCriteria dc=DetachedCriteria.forClass(Role.class);
		PageBean pb=new PageBean();
		pb.setDetachedCriteria(dc);
		pb.setCurrentPage(page);
		pb.setPageSize(rows);
		roleService.pageQuery(pb);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"detachedCriteria","currentPage","pageSize","managers","functions"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json=JSONObject.fromObject(pb,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	public String listajax() throws IOException{
		List<Role> list=roleService.findAll();
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"functions","managers"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json=JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	@RequiresPermissions("role-update")
	public String foredit(){
		Role model=roleService.findById(role.getRole_id());
		ActionContext.getContext().put("role", model);
		return "edit";
	}
	@RequiresPermissions("role-update")
	public String update(){
		roleService.update(role,functionIds);
		return "list";
	}
	@Override
	public Role getModel() {
		return role;
	}

}
