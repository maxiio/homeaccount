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
import com.zoutong.homeaccount.entity.OutAccountType;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.InTypeService;
import com.zoutong.homeaccount.service.OutAccountTypeService;
import com.zoutong.homeaccount.utils.PageBean_list;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class OutAccountTypeAction extends ActionSupport implements ModelDriven<OutAccountType>{
	@Autowired
	private OutAccountTypeService outAccountTypeService;
	private OutAccountType outAccountType=new OutAccountType();
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
		DetachedCriteria dc=DetachedCriteria.forClass(OutAccountType.class);
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		dc.add(Restrictions.eq("user.user_id", user.getUser_id()));
		List<OutAccountType> list = outAccountTypeService.findAll(dc);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String []{"outaccounts","user","outaccounttype_createtime"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json = JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//分页查询
	public String list(){
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(OutAccountType.class);
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		detachedCriteria.add(Restrictions.eq("user.user_id", user.getUser_id()));
		if(outAccountType.getOutaccounttype_name()!=null&&!"".equals(outAccountType.getOutaccounttype_name())){
			detachedCriteria.add(Restrictions.like("inaccounttype_name", "%"+outAccountType.getOutaccounttype_name()+"%"));
		}
		PageBean_list pb=outAccountTypeService.findList(detachedCriteria,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	//添加支出类型
	public String add(){
		outAccountType.setOutaccounttype_createtime(new Date());
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		outAccountType.setUser(user);
        outAccountTypeService.save(outAccountType);
		return "toShow";
	}
	//根据ID查找支出类型信息
	public String findById() throws Exception{
		OutAccountType outAccountType2 = outAccountTypeService.findById(outAccountType.getOutaccounttype_id());
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String []{"outaccounts","user","outaccounttype_createtime"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json = JSONObject.fromObject(outAccountType2,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//修改支出类型
	public String update(){
		User u=(User) ServletActionContext.getContext().getSession().get("currentUser");
		outAccountType.setUser(u);
		outAccountTypeService.update(outAccountType);
		return "toShow";
	}
	
	//根据ID删除支出类型
	public String delete() throws IOException{
		String flag="1";
		try {
			outAccountTypeService.deleteById(outAccountType.getOutaccounttype_id());
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	@Override
	public OutAccountType getModel() {
		return outAccountType;
	}


}
