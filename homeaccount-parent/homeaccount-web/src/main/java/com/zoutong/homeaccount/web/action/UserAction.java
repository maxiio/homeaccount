package com.zoutong.homeaccount.web.action;

import java.io.IOException;
import java.util.Map;
import java.util.Random;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.UserService;
import com.zoutong.homeaccount.utils.CryptographyUtil;
import com.zoutong.homeaccount.utils.MainMail;
import com.zoutong.homeaccount.utils.PageBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	private static final long serialVersionUID = 1L;
	private User user =new User();
	@Autowired
	private UserService userService;
	private String checkcode;
	private String keyword;
	private String oldpwd;
	private Integer page;
	private Integer rows;
	private String user_ids;
	
	public String getUser_ids() {
		return user_ids;
	}
	public void setUser_ids(String user_ids) {
		this.user_ids = user_ids;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	/**
	 * 用户登录
	 * User currentUser=userService.getUserByName(user);
			if(currentUser!=null){
				if(CryptographyUtil.md5(user.getUser_password(), CryptographyUtil.md5("www.javazt.top", "homeaccount")).equals(currentUser.getUser_password())){
					if(currentUser.getState()=='1'){
						return "callmanager";
					}else{
						//此处持久化主要是校验每日登录
						userService.persistUser(currentUser);
						ActionContext.getContext().getSession().put("currentUser", currentUser);
						return "welcome";
					}
				}else{
					this.addActionError("密码输入错误！");
					return "toLogin";
				}
			}else{
				this.addActionError("用户名输入有误！");
				return "toLogin";
			}
	 */
	public String login() throws Exception {
		Map<String, Object> map = ActionContext.getContext().getSession();
		//取出session中的验证码
		String validatecode = (String) map.get("key");
		if(StringUtils.isNotBlank(checkcode)&&checkcode.equals(validatecode)&&StringUtils.isNotBlank(user.getUser_name().trim())){
			Subject subject = SecurityUtils.getSubject();
			//比对用户输入的用户名和密码
			AuthenticationToken token=new UsernamePasswordToken(user.getUser_name().trim(), CryptographyUtil.md5(user.getUser_password().trim(), CryptographyUtil.md5("www.javazt.top", user.getUser_name().trim())));
			
			//System.out.println(CryptographyUtil.md5(user.getUser_password(), CryptographyUtil.md5("www.javazt.top", user.getUser_name().trim())));
			try {
				subject.login(token);
				User currentUser = (User) subject.getPrincipal();
				//判断用户是否被封禁
				if(currentUser.getState()=='1'){
					
					return "callmanager";
					
				}else{
					//存入session中
					ActionContext.getContext().getSession().put("currentUser", currentUser);
					
					return "welcome";
				}
			} catch (Exception e) {
				e.printStackTrace();
				this.addActionError("用户名或密码输入错误！");
				return "toLogin";
			}
		}else{
			this.addActionError("输入的验证码有误！");
			return "toLogin";
		}
	}

	/**
	 * 用户注册
	 */
	public String regist()throws Exception{
		Map<String, Object> map = ActionContext.getContext().getSession();
		String validatecode = (String) map.get("key");
		if(StringUtils.isNotBlank(checkcode)&&checkcode.equals(validatecode)){
			if(StringUtils.isBlank(user.getUser_name())||StringUtils.isBlank(user.getUser_password())){
				return "toRigister";
			}
			try {
				userService.saveUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "toOk";
		}else{
			return "toRegister";
		}
	}
	/**
	 * 用户注销
	 */
	public String logout()throws Exception{
		
		ActionContext.getContext().getSession().remove("currentUser");
		
		return LOGIN;
	}
	/**
	 * 用户修改信息
	 * @return
	 */
	public String edit(){
		User currentUser=(User)ActionContext.getContext().getSession().get("currentUser");
		user.setUser_id(currentUser.getUser_id());
		user.setLevel(currentUser.getLevel());
		user.setUser_name(currentUser.getUser_name());
		user.setUser_password(currentUser.getUser_password());
		user.setState(currentUser.getState());
		user.setScore(currentUser.getScore());
		user.setActivestate(currentUser.getActivestate());
		user.setRegister_date(currentUser.getRegister_date());
		user.setLoginDate(currentUser.getLoginDate());
		if(StringUtils.isBlank(user.getFace())){
			user.setFace(null);
		}
		if(StringUtils.isBlank(user.getRealname())){
			user.setRealname(null);
		}
		if("".equals(user.getUser_sex())){
			user.setUser_sex(null);
		}
		if(StringUtils.isBlank(user.getIdcard())){
			user.setIdcard(null);
		}
		if(StringUtils.isBlank(user.getProvince())){
			user.setProvince(null);
			user.setCity(null);
			user.setDetails(null);
		}
		if(StringUtils.isBlank(user.getQuestion())){
			user.setQuestion(null);
			user.setAnswer(null);
		}
		userService.update(user);
		ActionContext.getContext().getSession().put("currentUser", user);
		return "toUserDesc";
	}
	//校验密码是否是原密码
	public String checkOldPassword() throws Exception{
		User u = (User) ActionContext.getContext().getSession().get("currentUser");
		String user_password = u.getUser_password();
		String old = CryptographyUtil.md5(oldpwd, CryptographyUtil.md5("www.javazt.top", u.getUser_name()));
		boolean flag=false;
		if(old.equals(user_password)){
			flag=true;
		}
		String json="{\"isExist\":"+flag+"}";
		ServletActionContext.getResponse().getWriter().write(json);
		return NONE;
	}
	//在线修改密码
	public String editPwd() throws Exception{
		User u = (User) ActionContext.getContext().getSession().get("currentUser");
		if(StringUtils.isNotBlank(user.getUser_password())){
			String newpwd =CryptographyUtil.md5(user.getUser_password().trim(), CryptographyUtil.md5("www.javazt.top", u.getUser_name().trim()));
			System.out.println("========在线修改的密码======"+newpwd+"=================");
			u.setUser_password(newpwd);
			userService.update(u);
			ServletActionContext.getContext().getSession().remove("currentUser");
			return LOGIN;
		}else{
			return "toRegister";
		}
	}
	//检查用户名是否重复
	public String checkUserName() throws IOException{
		boolean flag=userService.findByUserName(user.getUser_name().trim());
		String json="{\"isExist\":"+flag+"}";
		ServletActionContext.getResponse().getWriter().write(json);
		return NONE;
	}
	//检查邮箱是否重复
	public String checkemail() throws IOException{
		boolean flag=userService.findUserByEmail(user.getEmail().trim());
		String json="{\"isExist\":"+flag+"}";
		ServletActionContext.getResponse().getWriter().write(json);
		return NONE;
	}
	//检验找回密码的输入
	public String findpwd(){
		Map<String, Object> map = ActionContext.getContext().getSession();
		String validatecode = (String) map.get("key");
		//校验验证码
		if(StringUtils.isNotBlank(checkcode)&&checkcode.equals(validatecode)){
			//判断输入
			if(StringUtils.isNotBlank(keyword)){
				User u=userService.findUserByKeyWord(keyword);
				if(u!=null){
					ActionContext.getContext().put("user_id", u.getUser_id());
					//生成六位随机数验证码
					Random rdm = new Random();
					String hash1 = Integer.toHexString(rdm.nextInt());
					String capstr = hash1.substring(0, 6);
					try {
					 MainMail.sendMyEMail(u.getEmail(), u.getUser_name(), capstr);
					} catch (Exception e) {
						e.printStackTrace();
						this.addActionError("发送邮箱出错了");
						return "tofindpwd";
					}
					ActionContext.getContext().getSession().put("key", capstr);
					return "updatepwd";
				}else{
					this.addActionError("用户名或者邮箱不存在！");
					return "tofindpwd";
				}
			}else{
				this.addActionError("用户名或者邮箱不能为空！");
				return "tofindpwd";
			}
		}else{
			this.addActionError("验证码输入错误！");
			return "tofindpwd";
		}
	}
	/**
	 * 检验验证码是否正确
	 * @return
	 * @throws IOException 
	 */
	public String check() throws IOException{
		String key = (String) ActionContext.getContext().getSession().get("key");
		String json="";
		if(checkcode.equals(key)){
			json="{\"isExist\":true}";
			
		}else{
			json="{\"isExist\":false}";
		}
		ServletActionContext.getResponse().getWriter().write(json);
		return NONE;
	}
	//找回密码--并修改
	public String updatepwd(){
		String key = (String) ActionContext.getContext().getSession().get("key");
		if(StringUtils.isNotBlank(checkcode)&&checkcode.equals(key)&&user.getUser_id()!=null){
				userService.updatepwd(user);
				//置空发送的验证码
				ActionContext.getContext().getSession().put("key","");
				return "login";
		}
		return "findpwd";
	}
	
	//获取所有用户
	@RequiresPermissions("user-list")
	public String pageQuery() throws IOException{
		PageBean pb=new PageBean();
		DetachedCriteria dc=DetachedCriteria.forClass(User.class);
		if(StringUtils.isNotBlank(user.getUser_name())){
			dc.add(Restrictions.like("user_name","%"+ user.getUser_name()+"%"));
		}
		if(StringUtils.isNotBlank(user.getIdcard())){
			dc.add(Restrictions.eq("idcard", user.getIdcard().trim()));
		}
		if(StringUtils.isNotBlank(user.getUser_phone())){
			dc.add(Restrictions.eq("user_phone", user.getUser_phone().trim()));
		}
		if(user.getState()!=null){
			dc.add(Restrictions.eq("state", user.getState()));
		}
		if(user.getLevel()!=null){
			dc.add(Restrictions.eq("level", user.getLevel()));
		}
		pb.setDetachedCriteria(dc);
		pb.setCurrentPage(page);
		pb.setPageSize(rows);
		userService.pageQuery(pb);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"inaccounts","outaccounts","inaccounttypes","outaccounttypes","invests","loans","topics","replys","currentPage","pageSize","age","birthday_s"});
		String json = JSONObject.fromObject(pb,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//封禁用户
	@RequiresPermissions("user-stop")
	public String stop(){
		userService.stop(user_ids);
		return "userlist";
	}
	//解封用户
	@RequiresPermissions("user-open")
	public String open(){
		userService.open(user_ids);
		return "userlist";
	}
	@RequiresPermissions("user-level")
	public String editLevel(){
		userService.editLevel(user);
		return "userlist";
	}
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	@Override
	public User getModel() {
		return user;
	}
	

	
}
