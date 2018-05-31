package com.zoutong.homeaccount.web.action;

import java.io.File;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zoutong.homeaccount.entity.Message;

import net.sf.json.JSONObject;
@Controller
@Scope("prototype")
public class UploadAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private File image;
	private String imageFileName;
	private String imageContentType;
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String uploadImg() throws Exception{
		imageFileName=System.currentTimeMillis()+".jpg";
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		/**
		 * {
	        "error" : 0,
	        "url" : "http://www.example.com/path/to/file.ext"
			}
			//失败时
			{
			      "error" : 1,
			      "message" : "错误信息"
			}
		 */
		Message message=new Message();
		String json ="";
		try {
			image.renameTo(new File("E:/test/upload/"+imageFileName));
			message.setError(0);
			message.setUrl("/upload/"+imageFileName);
			 json=JSONObject.fromObject(message).toString();
			ServletActionContext.getResponse().getWriter().print(json);
		} catch (Exception e) {
			message.setError(1);
			message.setMessage("上传图片出错");
			json = JSONObject.fromObject(message).toString();
			ServletActionContext.getResponse().getWriter().print(json);
		}
		return NONE;
	}

}
