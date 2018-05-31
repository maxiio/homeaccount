package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.InAccountType;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.InTypeService;
import com.zoutong.homeaccount.utils.PageBean_list;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class InTypeAction extends ActionSupport implements ModelDriven<InAccountType>{
	@Autowired
	private InTypeService inTypeService;
	private InAccountType  inAccountType=new InAccountType();
	private Integer currentPage;
	private Integer pageSize;
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	//页面ajax加载下拉框
	public String listajax() throws IOException{
		DetachedCriteria dc=DetachedCriteria.forClass(InAccountType.class);
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		dc.add(Restrictions.eq("user.user_id", user.getUser_id()));
		List<InAccountType> list = inTypeService.findAll(dc);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String []{"inaccounts","user","inaccounttype_createtime"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json = JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//分页查询
	public String list(){
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(InAccountType.class);
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		System.out.println(user.getUser_name());
		detachedCriteria.add(Restrictions.eq("user.user_id", user.getUser_id()));
		if(inAccountType.getInaccounttype_name()!=null&&!inAccountType.equals("")){
			detachedCriteria.add(Restrictions.like("inaccounttype_name", "%"+inAccountType.getInaccounttype_name()+"%"));
		}
		PageBean_list pb=inTypeService.findList(detachedCriteria,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	//添加收入类型
	public String add(){
		inAccountType.setInaccounttype_createtime(new Date());
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		inAccountType.setUser(user);
		inTypeService.save(inAccountType);
		return "toShow";
	}
	//根据ID查找收入类型信息
	public String findById() throws Exception{
		InAccountType inAccountType2 = inTypeService.findById(inAccountType.getInaccounttype_id());
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String []{"inaccounts","user","inaccounttype_createtime"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json = JSONObject.fromObject(inAccountType2,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//修改收入类型
	public String update(){
		User u=(User) ServletActionContext.getContext().getSession().get("currentUser");
		inAccountType.setUser(u);
		inTypeService.update(inAccountType);
		return "toShow";
	}
	//根据ID删除收入类型
	public String delete() throws IOException{
		String flag="0";
		try {
			inTypeService.deleteById(inAccountType.getInaccounttype_id());
		} catch (Exception e) {
			flag="1";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	
	public InAccountType getModel() {
		return inAccountType;
	}

}
