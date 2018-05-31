var userName=document.getElementById("userName");
var userNameMessage=document.getElementById("userNameMessage");
var checkUser=document.getElementById("checkUser");
var email=document.getElementById("email");
var emailMessage=document.getElementById("emailMessage");
var num=document.getElementById("number");
var numMessage=document.getElementById("numberMessage");
var pwd=document.getElementById("password");
var pwdMessage=document.getElementById("pwdMessage");
var pwdlevel=document.getElementById("pwdLevel");
var okpwd=document.getElementById("okpwd");
var okpwdMessage=document.getElementById("okpwdMessage");
function checkForm(){
	
	
}
//用户名输入框失去焦点时
function userNameBlur(){
	userNameMessage.style.display='none';
	//用户名规则：3-16位可以为汉字、数字、字母（大小写）、下划线
	var regex=/^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/;
	if(regex.test(userName.value)){
		checkUser.innerHTML="<img src='../img/checked.gif' />";
		
	}else{
		checkUser.innerHTML="<img src='../img/unchecked.gif' />";
		
	}
}
//用户名输入框获取焦点时
function userNamefocus(){
	userNameMessage.style.display='block';
	userNameMessage.innerHTML="<span style='color:gray;font-size:14px'>用户名：3-16位可以为汉字、数字、字母（大小写）、下划线</span>";
	
}

//邮箱地址输入框失去焦点和内容改变时
function checkEmail(){
	var emailRegex=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(email.value!=''){
		if(emailRegex.test(email.value)){
			emailMessage.innerHTML="<img src='../img/checked.gif' />";
		}else{
			emailMessage.innerHTML="<span style='color:red;'>邮箱格式不正确</span>";
		}
	}else{
		   emailMessage.innerHTML="<span style='color:red;'>邮箱不能为空！</span>";
	}

}

//手机号码输入框失去焦点和内容改变时
function checkNumber(){
	//手机号码正则表达式
	var numRegex=/^1[34578]\d{9}$/;
	if(numRegex.test(num.value)){
		numMessage.innerHTML="<img src='../img/checked.gif' />";
	}else{
		numMessage.innerHTML="<span style='color:red;'>格式不正确</span>";
	}
}

//密码输入框失去焦点时
function checkpwd(){
	
	//强：字母+数字+特殊字符   
	//^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\d!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$            
	//中：字母+数字，字母+特殊字符，数字+特殊字符      
	//^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$
	//弱：纯数字，纯字母，纯特殊字符 
	//^(?:\d+|[a-zA-Z]+|[!@#$%^&*]+)$
	var pwdRegex1=/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\d!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/; 
	var pwdRegex2=/^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/;
	var pwdRegex3=/^(?:\d+|[a-zA-Z]+|[!@#$%^&*]+)$/;
	if(pwd.value==''){
		pwdlevel.style.display='none';
		pwdMessage.innerHTML="<span style='color:red;'>密码不能为空</span>";
		return;
	}
	pwdlevel.style.display='block';
	if(pwdRegex3.test(pwd.value)){
		pwdMessage.innerHTML="<img src='../img/checked.gif' />";
		pwdlevel.innerHTML="密码强度<div class='progress'><div class='progress-bar progress-bar-danger' role='progressbar' aria-valuenow='20' aria-valuemin='0' aria-valuemax='100' style='width: 20%;'低</div></div>";
	}else if(pwdRegex2.test(pwd.value)){
		pwdMessage.innerHTML="<img src='../img/checked.gif' />";
		pwdlevel.innerHTML="密码强度<div class='progress'><div class='progress-bar progress-bar-warning' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%;'中</div></div>";
	}else if(pwdRegex3.test(pwd.value)){
		pwdMessage.innerHTML="<img src='../img/checked.gif' />";
		pwdlevel.innerHTML="密码强度<div class='progress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='100' aria-valuemin='0' aria-valuemax='100' style='width: 100%;'低</div></div>";
	}else{
		pwdMessage.innerHTML="<span style='color:red;'>密码格式不正确</span>";
	}
	
}

//确认密码输入框失去焦点时
function checkpwd1(){
	if((okpwd.value)==''){
		okpwdMessage.innerHTML="<span style='color:red'>请输入确认密码</span>";
		return;
	}
	if((okpwd.value)!=(pwd.value)){
			okpwdMessage.innerHTML="<span style='color:red'>两次密码不一致</span>";
	}else{
		okpwdMessage.innerHTML="<img src='../img/checked.gif' />";
	}
	
}
function resetMessage(){
	userNameMessage.innerHTML='';
	emailMessage.innerHTML='';
	pwdMessage.innerHTML='';
	okpwdMessage='';
}

