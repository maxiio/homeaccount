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
import com.zoutong.homeaccount.entity.Loan;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.LoanService;
import com.zoutong.homeaccount.utils.PageBean_list;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class LoanAction extends ActionSupport implements ModelDriven<Loan>{
	@Autowired
	private LoanService loanService;
	private Loan loan=new Loan();
	private Integer currentPage;
	private Integer pageSize;
	private Date startTime;
	private Date endTime;
	private String loan_ids;//批量删除id字符串
	public void setLoan_ids(String loan_ids) {
		this.loan_ids = loan_ids;
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
	//添加借款账单
	public String add(){
		User user=(User) ServletActionContext.getContext().getSession().get("currentUser");
		loan.setUser(user);
		loan.setLoan_createtime(new Date());
		loanService.saveLoan(loan);
		return "toShow";
	}
	
	//分页查询借款账单
	public String list(){
		DetachedCriteria dc=DetachedCriteria.forClass(Loan.class);
		User user=(User) ServletActionContext.getContext().getSession().get("currentUser");
		dc.add(Restrictions.eq("user.user_id",user.getUser_id()));
		dc.addOrder(Order.desc("loan_datetime"));
		if(startTime!=null||endTime!=null){
			if(startTime!=null&&endTime!=null){
				dc.add(Restrictions.between("inaccount_datetime",startTime, endTime));
			}else{
				dc.add(Restrictions.like("inaccount_datetime", startTime!=null?startTime:endTime));
			}
		}
		if(StringUtils.isNotBlank(loan.getLoanname())){
			dc.add(Restrictions.like("loanname", "%"+loan.getLoanname()+"%"));
		}
		if(StringUtils.isNotBlank(loan.getLoan_desc())){
			dc.add(Restrictions.like("loan_desc","%"+loan.getLoan_desc()+"%"));
		}
		PageBean_list pb= loanService.findAll(dc,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	//根据id查找借款
	public String findById() throws IOException{
		if(loan.getLoan_id()!=null&&!"".equals(loan.getLoan_id())){
			Loan loan1=loanService.findById(loan.getLoan_id());
			JsonConfig config=new JsonConfig();
			config.setExcludes(new String[]{"user"});
			ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
			String json=JSONObject.fromObject(loan1,config).toString();
			ServletActionContext.getResponse().getWriter().print(json);
		}
		return NONE;
	}
	//修改借款
	public String update(){
		User user=(User) ServletActionContext.getContext().getSession().get("currentUser");
		loan.setUser(user);
		loanService.update(loan);
		return "toShow";
	}
	//根据ID删除借款
	public String delete(){
		if(loan.getLoan_id()!=null&&!"".equals(loan.getLoan_id())){
			loanService.deleteById(loan.getLoan_id());
		}
		return "toShow";
	}
	//批量删除
     public String deletebatch(){
			if(StringUtils.isNotBlank(loan_ids)){
				loanService.deleteBatch(loan_ids);
			}
			return "toShow";
		}
    //统计
     public String total(){
    	 int total=loanService.getTotal();
    	 ActionContext.getContext().put("loantotal", total);
    	 return "total";
     }
	@Override
	public Loan getModel() {
		return loan;
	}
}
