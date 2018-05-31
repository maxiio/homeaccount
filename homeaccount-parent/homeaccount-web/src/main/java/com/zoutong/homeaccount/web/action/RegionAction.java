package com.zoutong.homeaccount.web.action;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zoutong.homeaccount.entity.Region;
import com.zoutong.homeaccount.service.RegionService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class RegionAction extends ActionSupport implements ModelDriven<Region>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Region region=new Region();
	private String region_ids;
	public String getRegion_ids() {
		return region_ids;
	}

	public void setRegion_ids(String region_ids) {
		this.region_ids = region_ids;
	}

	@Autowired
	private RegionService regionService;
	public String list(){
		List<Region> list=regionService.findAll();
	/*	for (Region region : list) {
			System.out.println(region);
		}*/
		ActionContext.getContext().put("list", list);
		return "list";
	}

	public String listajax() throws Exception{
		List<Region> list = regionService.findAll();
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[] {"topics"});
		String json = JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	@RequiresPermissions("region-add-page")
	public String add(){
		regionService.save(region);
		return "show";
	}
	@RequiresPermissions("region-edit")
	public String update(){
		regionService.update(region);
		return "show";
	}
	@RequiresPermissions("region-delete")
	public String delete(){
			regionService.delete(region_ids);
			return "show";
	}
	
	@Override
	public Region getModel() {
		return region;
	}
}
