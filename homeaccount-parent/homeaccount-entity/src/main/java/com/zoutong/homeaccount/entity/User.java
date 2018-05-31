package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.zoutong.homeaccount.utils.AgeUtil;
import com.zoutong.homeaccount.utils.DateFormateUtil;
/**
 *用户实体类
 */
public class User implements Serializable{
	private Long user_id;//用户编号
	private String user_name; //用户昵称
	private String user_password;//用户密码
	private Date birthday;//出生日期
	private String idcard;//身份证号
	private String province;//省份
	private String city;//市
	private String details;//详细地址
	private String realname;//真实姓名
	private String user_phone;//手机号
	private Character user_sex;//性别
	private String email;//邮箱
	private String address;//地址
	private String question;//密保问题
	private String answer;//密保答案
	private Date register_date;//注册时间
	private String face;//头像
	private Integer score;//积分
	private Character state;//状态
	private String activecode;//激活码
	private Character activestate;//激活状态
	private Integer level;//用户级别
	private Date loginDate;//上次登录时间
	
	private Set<InAccount> inaccounts=new HashSet<InAccount>();
	private Set<OutAccount> outaccounts=new HashSet<OutAccount>();
	
	private Set<InAccountType> inaccounttypes=new HashSet<InAccountType>();
	private Set<OutAccountType> outaccounttypes=new HashSet<OutAccountType>();
	
	private Set<Invest> invests=new HashSet<Invest>();
	private Set<Loan> loans=new HashSet<Loan>();
	
	private Set<Topic> topics=new HashSet<Topic>();
	private Set<Reply> replys=new HashSet<Reply>();
	
	public User() {
	}
	//根据出生日期获取年龄
	public Integer getAge(){
		return AgeUtil.getAge(birthday);
	}
	public Set<Topic> getTopics() {
		return topics;
	}
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	public Set<Reply> getReplys() {
		return replys;
	}
	public void setReplys(Set<Reply> replys) {
		this.replys = replys;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getBirthday_s() {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		return format.format(birthday);
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getIdcard() {
		return idcard;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Character getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(Character user_sex) {
		this.user_sex = user_sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddress_s() {
		if(StringUtils.isNotBlank(province)){
			return province+city+details;
		}else{
			return null;
			
		}
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getRegister_date_s() {
		return DateFormateUtil.transferForCN(register_date);
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Character getState() {
		return state;
	}
	public void setState(Character state) {
		this.state = state;
	}
	public String getActivecode() {
		return activecode;
	}
	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}
	public Character getActivestate() {
		return activestate;
	}
	public void setActivestate(Character activestate) {
		this.activestate = activestate;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Set<InAccount> getInaccounts() {
		return inaccounts;
	}
	public void setInaccounts(Set<InAccount> inaccounts) {
		this.inaccounts = inaccounts;
	}
	public Set<OutAccount> getOutaccounts() {
		return outaccounts;
	}
	public void setOutaccounts(Set<OutAccount> outaccounts) {
		this.outaccounts = outaccounts;
	}
	public Set<InAccountType> getInaccounttypes() {
		return inaccounttypes;
	}
	public void setInaccounttypes(Set<InAccountType> inaccounttypes) {
		this.inaccounttypes = inaccounttypes;
	}
	public Set<OutAccountType> getOutaccounttypes() {
		return outaccounttypes;
	}
	public void setOutaccounttypes(Set<OutAccountType> outaccounttypes) {
		this.outaccounttypes = outaccounttypes;
	}
	public Set<Invest> getInvests() {
		return invests;
	}
	public void setInvests(Set<Invest> invests) {
		this.invests = invests;
	}
	public Set<Loan> getLoans() {
		return loans;
	}
	public void setLoans(Set<Loan> loans) {
		this.loans = loans;
	}
	public String getLoginDate_s() {
		return DateFormateUtil.transferHaveTime(loginDate);
	}
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	
}
