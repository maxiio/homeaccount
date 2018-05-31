package com.zoutong.homeaccount.web.action;

import java.io.IOException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Reply;
import com.zoutong.homeaccount.entity.Topic;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.ReplyService;
import com.zoutong.homeaccount.service.TopicService;
import com.zoutong.homeaccount.utils.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class ReplyAction extends ActionSupport implements ModelDriven<Reply>{
	private Reply reply=new Reply();
	@Autowired
	private TopicService topicService;
	@Autowired
	private ReplyService replyService;
	private Integer rows;
	private Integer page;
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String add(){
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		Topic topic = topicService.showContent(reply.getTopic().getTopic_id());
		reply.setUser(user);
		reply.setTopic(topic);
		replyService.save(reply);
		ActionContext.getContext().put("topic_id",topic.getTopic_id());
		return "toshow";
	}
	//阅读回复
	public String read() throws IOException{
		String flag="1";
		
		try {
			replyService.readById(reply.getReply_id());
			ServletActionContext.getResponse().getWriter().write(flag);
		} catch (Exception e) {
			flag="0";
			ServletActionContext.getResponse().getWriter().write(flag);
			e.printStackTrace();
		}
		return NONE;
	}
	//删除回复
	public String deleteById() throws IOException{
		String flag="1";
		try {
			replyService.deleteById(reply.getReply_id());
			ServletActionContext.getResponse().getWriter().write(flag);
		} catch (Exception e) {
			flag="0";
			ServletActionContext.getResponse().getWriter().write(flag);
			e.printStackTrace();
		}
		return NONE;
	}
	//点赞
	public String zan() throws IOException{
		String flag="1";
		try {
			replyService.zan(reply.getReply_id());
		} catch (Exception e) {
			flag="0";
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	//鄙视
	public String bad() throws IOException{
		String flag="1";
		try {
			replyService.bad(reply.getReply_id());
		} catch (Exception e) {
			flag="0";
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	@RequiresPermissions("reply-confirm-page")
	public String pageQuery() throws IOException{
		DetachedCriteria dc=DetachedCriteria.forClass(Reply.class);
		dc.add(Restrictions.ge("bad", 10));
		PageBean pb=new PageBean();
		pb.setDetachedCriteria(dc);
		pb.setCurrentPage(page);
		pb.setPageSize(rows);
		replyService.pageQuery(pb);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"region","detachedCriteria","pageSize","currentPage","inaccounts","outaccounts","inaccounttypes","outaccounttypes","invests","loans","topics","replys","age","address"});
		String json = JSONObject.fromObject(pb,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	@RequiresPermissions("reply-confirm")
	public String confirm(){
		replyService.confirm(reply.getReply_id());
		return "adminconfirm";
	}
	@Override
	public Reply getModel() {
		return reply;
	}
	

}
