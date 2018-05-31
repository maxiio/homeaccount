package com.zoutong.homeaccount.web.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
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
import com.zoutong.homeaccount.entity.InAccount;
import com.zoutong.homeaccount.entity.InAccountType;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.InAccountService;
import com.zoutong.homeaccount.service.InTypeService;
import com.zoutong.homeaccount.service.UserService;
import com.zoutong.homeaccount.utils.DateFormateUtil;
import com.zoutong.homeaccount.utils.FileUtils;
import com.zoutong.homeaccount.utils.PageBean_list;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class InAccountAction extends ActionSupport implements ModelDriven<InAccount>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private InAccountService inAccountService;
	@Autowired
	private InTypeService inTypeService;
	@Autowired
	private UserService userService;
	private String inaccount_ids;
	private Date startTime;
	private Date endTime;
	private String year;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	private InAccount inAccount=new InAccount();
	private Integer currentPage;
	private Integer pageSize;
	private File myFile;
	public void setInaccount_ids(String inaccount_ids) {
		this.inaccount_ids = inaccount_ids;
	}
	public String getStartTime() {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		return format.format(startTime);
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		return format.format(endTime);
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
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
	 * 显示收入账单
	 */
	public String list()throws Exception{
		DetachedCriteria dc=DetachedCriteria.forClass(InAccount.class);
		User user =(User)ActionContext.getContext().getSession().get("currentUser");
		dc.add(Restrictions.eq("user.user_id",user.getUser_id()));
		dc.addOrder(Order.asc("inaccount_datetime"));
		if(startTime!=null||endTime!=null){
			if(startTime!=null&&endTime!=null){
				dc.add(Restrictions.between("inaccount_datetime",startTime, endTime));
			}else{
				dc.add(Restrictions.like("inaccount_datetime", startTime!=null?startTime:endTime));
			}
			
		}
		if(inAccount.getInAccountType()!=null&&inAccount.getInAccountType().getInaccounttype_id()!=null){
			dc.add(Restrictions.eq("inAccountType.inaccounttype_id", inAccount.getInAccountType().getInaccounttype_id()));
		}
		if(StringUtils.isNotBlank(inAccount.getInaccount_desc())){
			dc.add(Restrictions.like("inaccount_desc", "%"+inAccount.getInaccount_desc()+"%"));
		}
		PageBean_list pb=inAccountService.findAll(dc,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "toList";
	}
	/**
	 * 添加账单
	 * @return
	 * @throws Exception 
	 */
	public String add() throws Exception{
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		user.setScore(user.getScore()+2);
		userService.persistUser(user);
		inAccount.setUser(user);
		InAccountType inAccountType=inTypeService.findById(inAccount.getInAccountType().getInaccounttype_id());
		inAccount.setInAccountType(inAccountType);
		inAccount.setInaccount_createtime(new Date());
		inAccountService.save(inAccount);
		return "toShow";
	}
	/**
	 * 上传收入账单
	 * @throws IOException 
	 * @throws ParseException 
	 * @throws Exception 
	 */
	public String upload() throws IOException{
		  HSSFWorkbook workbook;
		  String flag="1";
		try {
			workbook = new HSSFWorkbook(new FileInputStream(myFile));
			HSSFSheet sheet = workbook.getSheetAt(0);
			List<InAccount> list=new ArrayList<InAccount>();
			User user = (User) ActionContext.getContext().getSession().get("currentUser");
			for (Row row : sheet) {
				if(row.getRowNum()==0){
					continue;
				}
				String typename = row.getCell(0).getStringCellValue();
				String inaccount_money="";
				if(row.getCell(1)!=null){
					row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
					inaccount_money=row.getCell(1).getStringCellValue();
				}
				String inaccount_datatimeStr="";
				if(row.getCell(2)!=null){
					row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
					inaccount_datatimeStr=row.getCell(2).getStringCellValue();
				}
				System.out.println(inaccount_datatimeStr);
				String inaccount_desc=row.getCell(3).getStringCellValue();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				Date inaccount_datatime = sdf.parse(inaccount_datatimeStr);
				InAccount inAccount=new InAccount(inaccount_datatime, Double.valueOf(inaccount_money), new Date(), inaccount_desc);
				InAccountType inAccountType=new InAccountType();
				inAccountType.setInaccounttype_name(typename);
				inAccount.setInAccountType(inAccountType);
				inAccount.setUser(user);
				list.add(inAccount);
			}
			inAccountService.saveInAccount(list);
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		} 
		ServletActionContext.getResponse().getWriter().print(flag);
		return NONE;
	}
	/**
	 * 下载收入账单
	 */
	public String download() throws IOException{
		DetachedCriteria dc=DetachedCriteria.forClass(InAccount.class);
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		dc.add(Restrictions.eq("user.user_id", user.getUser_id()));
		dc.addOrder(Order.asc("inaccount_datetime"));
		List<InAccount> list=inAccountService.findList(dc);
		HSSFWorkbook workbook=new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("收入账单");
        sheet.setDefaultColumnWidth(20);//默认宽度
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//居中
        HSSFFont createFont = workbook.createFont();
        createFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//加粗
        createFont.setFontHeightInPoints((short)14);//字体大小
        cellStyle.setFont(createFont);
        //创建一行
        HSSFRow row = sheet.createRow(0);
        //设置头信息
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("收入类型");
        cell.setCellStyle(cellStyle);
        HSSFCell cell2 = row.createCell(1);
        cell2.setCellValue("收入金额");
        cell2.setCellStyle(cellStyle);
        HSSFCell cell3 = row.createCell(2);
        cell3.setCellValue("收入日期");
        cell3.setCellStyle(cellStyle);
        HSSFCell cell4 = row.createCell(3);
        cell4.setCellValue("备注");
        cell4.setCellStyle(cellStyle);
        for (InAccount inAccount1: list) {
            HSSFRow dataRow=sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(inAccount1.getInAccountType().getInaccounttype_name());
            dataRow.createCell(1).setCellValue(inAccount1.getInaccount_money());
            dataRow.createCell(2).setCellValue(inAccount1.getInaccount_datetime_s());
            dataRow.createCell(3).setCellValue(inAccount1.getInaccount_desc());
        }
        //下载
        String filename="收入账单.xls";
        String contentType = ServletActionContext.getServletContext().getMimeType(filename);
        ServletOutputStream stream = ServletActionContext.getResponse().getOutputStream();
        ServletActionContext.getResponse().setContentType(contentType);
        String agent = ServletActionContext.getRequest().getHeader("User-Agent");
        filename=FileUtils.encodeDownloadFilename(filename, agent);
        ServletActionContext.getResponse().setHeader("content-disposition", "attachment;filename="+filename);
        workbook.write(stream);
		return NONE;
	}
	/**
	 * 根据ID删除收入账单
	 * @return
	 */
	public String delete(){
		String flag="1";
		try {
			inAccountService.deleteById(inAccount.getInaccount_id());
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}
		return "toShow";
	}
	/**
	 * 批量删除收入账单
	 * @return
	 */
	public String deleteBatch(){
		if(StringUtils.isNotBlank(inaccount_ids)){
		 inAccountService.deleteByIds(inaccount_ids);
		}
		return "toShow";
	}
	//用来回显修改
	public String findById() throws Exception{
		InAccount inaccount=inAccountService.findById(inAccount.getInaccount_id());
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String []{"inaccounts","user"});
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json = JSONArray.fromObject(inaccount,config).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//修改收入账单
	public String update(){
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		inAccount.setUser(user);
		InAccountType intype = inTypeService.findById(inAccount.getInAccountType().getInaccounttype_id());
		inAccount.setInAccountType(intype);
		inAccount.setInaccount_createtime(new Date());
		inAccountService.update(inAccount);
		return "toShow";
	}
	//根据类型分类查询出收入账单总和
	public String findInAccountGroupByInAccountTypeName() throws Exception{
		User user = (User) ActionContext.getContext().getSession().get("currentUser");
		List<Object> list=inAccountService.findInAccountGroupByInAccountTypeName(user.getUser_id(),year);
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		String json = JSONArray.fromObject(list).toString();
		ServletActionContext.getResponse().getWriter().print(json);
		return NONE;
	}
	//统计
	public String total() throws IOException{
		int total=inAccountService.getTotal();
		ActionContext.getContext().put("intotal", total);
		return "total";
	}
	@Override
	public InAccount getModel() {
		return inAccount;
	}
	
}
