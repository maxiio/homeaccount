package com.zoutong.homeaccount.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zoutong.homeaccount.entity.InAccount;
import com.zoutong.homeaccount.entity.OutAccount;
import com.zoutong.homeaccount.entity.Reply;
import com.zoutong.homeaccount.entity.Topic;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.InAccountService;
import com.zoutong.homeaccount.service.OutAccountService;
import com.zoutong.homeaccount.service.ReplyService;
import com.zoutong.homeaccount.service.TopicService;
@Controller 
@Scope("prototype")
public class MainAction extends ActionSupport{
	@Autowired
	private TopicService topicService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private InAccountService inAccountService;
	@Autowired
	private OutAccountService outAccountService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//为首页准备的数据
	public String forindex(){
			User user=(User) ActionContext.getContext().getSession().get("currentUser");
			//最近发的帖子  前6条
			List<Topic> topiclist=topicService.findFontSix(user.getUser_id());
			//我最近回复的帖子  前6条
			List<Reply> replylist=replyService.findFontSix(user.getUser_id());
			
			//支出账单排行榜  前10条
			List<OutAccount> outaccountlist=outAccountService.findFontTen(user.getUser_id());
			//收入账单排行榜 前10条
			List<InAccount> inaccountlist=inAccountService.findFontTen(user.getUser_id());
			//获得当月总支出和收入额
			Double in_money=inAccountService.findCurrentMonthTotalMoney(user.getUser_id());
			Double out_money=outAccountService.findCurrentMonthTotalMoney(user.getUser_id());
			ActionContext context = ActionContext.getContext();
			context.put("topiclist", topiclist);
			context.put("replylist", replylist);
			context.put("outaccountlist", outaccountlist);
			context.put("inaccountlist", inaccountlist);
			context.put("in_money", in_money);
			context.put("out_money", out_money);
		return "index";
	}

}
