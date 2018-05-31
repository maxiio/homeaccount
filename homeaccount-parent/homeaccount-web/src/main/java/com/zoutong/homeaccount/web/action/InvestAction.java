package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Invest;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.InvestService;
import com.zoutong.homeaccount.utils.PageBean_list;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class InvestAction extends ActionSupport implements ModelDriven<Invest>{
	@Autowired
	private InvestService investService;
	private Date startTime;
	private Date endTime;
	private Integer currentPage;
	private Integer pageSize;
	private String invest_ids;
	public void setInvest_ids(String invest_ids) {
		this.invest_ids = invest_ids;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
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
	private Invest invest =new Invest();
	//添加投资账单
	public String add(){
		User user=(User) ServletActionContext.getContext().getSession().get("currentUser");
		invest.setUser(user);
		if(StringUtils.isNotBlank(invest.getInvestname())&&invest.getInvest_datetime()!=null&&invest.getInvest_money()!=0.0&&invest.getInterest_rates()!=0.0&&StringUtils.isNotBlank(invest.getInvest_target())){
			invest.setInvest_createtime(new Date());
			investService.save(invest);
		}
		return "toShow";
	}
	//分页查询投资账单
	public String list(){
		DetachedCriteria dc=DetachedCriteria.forClass(Invest.class);
		User user=(User) ServletActionContext.getContext().getSession().get("currentUser");
		dc.add(Restrictions.eq("user.user_id",user.getUser_id()));
		dc.addOrder(Order.asc("invest_datetime"));
		if(startTime!=null||endTime!=null){
			if(startTime!=null&&endTime!=null){
				dc.add(Restrictions.between("inaccount_datetime",startTime, endTime));
			}else{
				dc.add(Restrictions.like("inaccount_datetime", startTime!=null?startTime:endTime));
			}
		}
		if(StringUtils.isNotBlank(invest.getInvestname())){
			dc.add(Restrictions.like("investname", "%"+invest.getInvestname()+"%"));
		}
		if(StringUtils.isNotBlank(invest.getInvest_desc())){
			dc.add(Restrictions.like("loan_desc","%"+invest.getInvest_desc()+"%"));
		}
		PageBean_list pb= investService.findAll(dc,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	//根据id查找投资账单
	public String findById() throws IOException{
		if(StringUtils.isNotBlank(invest.getInvest_id())){
			Invest invest1=investService.findById(invest.getInvest_id());
			JsonConfig config=new JsonConfig();
			config.setExcludes(new String[]{"user"});
			ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
			String json = JSONObject.fromObject(invest1,config).toString();
			ServletActionContext.getResponse().getWriter().print(json);
		}
		return NONE;
	}
	//修改投资账单
	public String update(){
		User user=(User) ServletActionContext.getContext().getSession().get("currentUser");
		invest.setUser(user);
		investService.update(invest);
		return "toShow";
	}
	//根据id删除投资账单
	public String delete(){
		if(StringUtils.isNotBlank(invest.getInvest_id())){
			investService.deleteById(invest.getInvest_id());
		}
		return "toShow";
	}
	//批量删除
	public String deleteBatch(){
		if(StringUtils.isNotBlank(invest_ids)){
			investService.deleteBatch(invest_ids);
		}
		return "toShow";
	}
	//统计
	
	public String total() throws IOException{
		int total=investService.getTotal();
		ActionContext.getContext().put("investtotal", total);
		return "total";
	}
	@Override
	public Invest getModel() {
		return invest;
	}

}
