package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Function;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.service.FunctionService;
import com.zoutong.homeaccount.utils.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class FunctionAction extends ActionSupport implements ModelDriven<Function>{

	@Autowired
	private FunctionService functionService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Function function =new Function();
	private Integer page;
	private Integer rows;
	private String role_id;
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
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
	
	public String listajax() throws IOException{
		List<Function> list=functionService.findajax();
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"roles","parentFunction"});
		String json=JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//查询权限
	@RequiresPermissions("function-list")
	public String pageQuery() throws IOException{
		DetachedCriteria dc=DetachedCriteria.forClass(Function.class);
		dc.addOrder(Order.asc("zindex"));
		PageBean pb=new PageBean();
		pb.setDetachedCriteria(dc);
		pb.setCurrentPage(Integer.parseInt(function.getPage()));
		pb.setPageSize(rows);
		functionService.pageQuery(pb);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"roles","chilren","detachedCriteria","currentPage","pageSize","parentFunction"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json=JSONObject.fromObject(pb,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	
	@RequiresPermissions("function-add")
	public String add(){
		functionService.save(function);
		return "list";
	}
	@RequiresPermissions("function-update")
	public String foredit(){
	  Function model=functionService.findById(function.getId());
	   ActionContext.getContext().put("model", model);
		return "edit";
	}
	@RequiresPermissions("function-update")
	public String update(){
		functionService.update(function);
		return "list";
	}
	public String findByRole() throws IOException{
		System.out.println("====================="+role_id+"=============================");
		List<Function> list= functionService.findByRole(role_id);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"roles","parentFunction"});
		String json=JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//根据登录人查询菜单
	public String findMenu() throws IOException{
		Manager model = (Manager) ActionContext.getContext().getSession().get("currentManager");
		List<Function> list=functionService.findMenu(model);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"roles","parentFunction","children"});
		String json=JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	@Override
	public Function getModel() {
		return function;
	}

}
