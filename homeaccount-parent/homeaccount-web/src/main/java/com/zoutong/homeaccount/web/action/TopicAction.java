package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Region;
import com.zoutong.homeaccount.entity.Reply;
import com.zoutong.homeaccount.entity.Topic;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.RegionService;
import com.zoutong.homeaccount.service.ReplyService;
import com.zoutong.homeaccount.service.TopicService;
import com.zoutong.homeaccount.utils.DateFormateUtil;
import com.zoutong.homeaccount.utils.PageBean;
import com.zoutong.homeaccount.utils.PageBean_list;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class TopicAction extends ActionSupport implements ModelDriven<Topic>{
	private Topic topic =new Topic();
	private Integer region_id;
	private Integer currentPage;//当前页
	private Integer pageSize;//每页记录数
	private Integer page;//easyui传来的当前页
	private Integer rows;//easyui传来的每页记录数
	private String topic_ids;
	private Integer badcount;
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getBadcount() {
		return badcount;
	}
	public void setBadcount(Integer badcount) {
		this.badcount = badcount;
	}
	public String getTopic_ids() {
		return topic_ids;
	}
	public void setTopic_ids(String topic_ids) {
		this.topic_ids = topic_ids;
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
	public Integer getRegion_id() {
		return region_id;
	}
	public void setRegion_id(Integer region_id) {
		this.region_id = region_id;
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
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private TopicService topicService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private ReplyService replyService;
	public String list(){
		DetachedCriteria dc=DetachedCriteria.forClass(Topic.class);
		if(StringUtils.isNotBlank(keyword)){
			dc.add(Restrictions.like("topic_title", "%"+keyword+"%"));
		}
		dc.add(Restrictions.eq("del",'0'));
		dc.add(Restrictions.eq("region.region_id", region_id));
		dc.addOrder(Order.desc("is_top"));
		dc.addOrder(Order.desc("is_good"));
		dc.addOrder(Order.desc("topic_datetime"));
		PageBean_list pb=topicService.findAll(dc,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}
	
	public String showContent(){
		Topic topic1=topicService.showContent(topic.getTopic_id());
		DetachedCriteria dc=DetachedCriteria.forClass(Reply.class);
		dc.add(Restrictions.eq("topic.topic_id", topic1.getTopic_id()));
		dc.addOrder(Order.asc("reply_datetime"));
		List<Reply> list= replyService.findByCriteria(dc);
		ActionContext.getContext().put("topic", topic1);
		ActionContext.getContext().put("replylist", list);
		return "show";
	}
	
	public String add(){
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		topic.setUser(user);
		topicService.save(topic);
		return "tolist";
	}
	//通过当前用户查找主题帖
	public String findByUser(){
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		DetachedCriteria dc=DetachedCriteria.forClass(Topic.class);
		dc.add(Restrictions.eq("del",'0'));
		dc.add(Restrictions.eq("user.user_id", user.getUser_id()));
		dc.addOrder(Order.desc("topic_datetime"));
		PageBean_list pb=topicService.findAll(dc,currentPage,pageSize);
		
		List<Reply> xiaoxi=replyService.findByTopicAndUser(user.getUser_id());
		List<Reply> replys=replyService.findByCriteria(user.getUser_id());
		ActionContext.getContext().put("pageBean", pb);
		ActionContext.getContext().put("replys", replys);
		ActionContext.getContext().put("xiaoxi", xiaoxi);
		return "mylist";
	}
	//删除主题帖
	public String deleteById() throws IOException{
		String flag="1";
		try {
			topicService.deleteById(topic.getTopic_id());
		} catch (Exception e) {
			flag="0";
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	//通过ID查找主题帖
	public String findById(){
		Topic t=topicService.findById(topic.getTopic_id());
		ActionContext.getContext().put("topic", t);
		return "toedit";
	}
	//修改主题帖
	public String update(){
		topicService.update(topic);
		return "toshow";
	}
	//结贴
	public String end() throws IOException{
		String flag="1";
		try {
			topicService.end(topic.getTopic_id());
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	//点赞
	public String zan() throws IOException{
		String flag="1";
		try {
			topicService.zan(topic.getTopic_id());
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
			topicService.bad(topic.getTopic_id());
		} catch (Exception e) {
			flag="0";
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
		
	}
	//管理员查看主题帖
	@RequiresPermissions("topic-list")
	public String pageQuery() throws IOException{
		PageBean pb=new PageBean();
		DetachedCriteria dc=DetachedCriteria.forClass(Topic.class);
		if(StringUtils.isNotBlank(topic.getTopic_title())){
			dc.add(Restrictions.like("topic_title", "%"+topic.getTopic_title()+"%"));
		}
		if(topic.getIs_top()!=null&&!"".equals(topic.getIs_top())){
			dc.add(Restrictions.eq("is_top", topic.getIs_top()));
		}
		if(topic.getIs_good()!=null&&!"".equals(topic.getIs_good())){
			dc.add(Restrictions.eq("is_good", topic.getIs_top()));
		}
		if(topic.getIs_end()!=null&&!"".equals(topic.getIs_end())){
			dc.add(Restrictions.eq("is_end", topic.getIs_end()));
		}
		if(topic.getDel()!=null&&!"".equals(topic.getDel())){
			dc.add(Restrictions.eq("del", topic.getDel()));
		}
		if(topic.getTopic_datetime()!=null){
			//将日期向后推移一天
			Calendar ca=Calendar.getInstance();
			ca.setTime(topic.getTopic_datetime());
			ca.add(Calendar.DATE,1);
			Date date=ca.getTime();
			dc.add(Restrictions.between("topic_datetime",DateFormateUtil.transfer(topic.getTopic_datetime()),date));
		}
		if(badcount!=null&&badcount==10){
			System.out.println("==========badcount==========");
			dc.add(Restrictions.ge("topic_bad", 20));
		}
		pb.setDetachedCriteria(dc);
		
		pb.setCurrentPage(page);
		
		pb.setPageSize(rows);
		
		topicService.pageQuery(pb);
		
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"detachedCriteria","inaccounts","outaccounts","inaccounttypes","outaccounttypes","invests","loans","topics","replys","currentPage","pageSize","age","birthday_s"});
		String json = JSONObject.fromObject(pb,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	@RequiresPermissions("topic-top")
	public String top(){
		topicService.top(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-good")
	public String good(){
		topicService.good(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-delete")
	public String deleteBatch(){
		topicService.deleteBatch(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-notop")
	public String noTop(){
		topicService.notop(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-nogood")
	public String noGood(){
		topicService.nogood(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-undelete")
	public String noDelete(){
		topicService.nodelete(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-end")
	public String adminend(){
		topicService.adminend(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-unend")
	public String unend(){
		topicService.unend(topic_ids);
		return "adminshow";
	}
	@RequiresPermissions("topic-confirm")
	public String confirm(){
		topicService.confirm(topic.getTopic_id());
		return "adminconfirm";
	}
	@Override
	public Topic getModel() {
		return topic;
	}
}
