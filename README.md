
#  homeaccount
家庭记账系统（ssh+shiro+solr）
##  项目介绍
  此项目为毕业设计时做的，功能也还算是比较多的，知识点也很齐全，值得一看  
  
  ###  用户界面一览
  1.  登录界面  
  ![用户登录界面](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/user_login.png)
    
  2.  用户主界面
    ![用户主界面](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/user_main.png)
  
  3.  账单列表
   ![用户账单列表](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/account_list.png)
  
  4.  添加账单
   ![用户添加账单](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/account_add.png)
   
  5.  账单统计图
  ![用户账单统计](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/account_report.png)
  
  6.  交流区
  ![用户交流区](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/chat_area.png)
  
  7.  主题帖列表
  ![主题帖列表](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/topic_list.png)
  
  8.  主题帖详情
  ![主题帖详情](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/topic_detail.png)
  
  9.  主题帖回复
  ![主题帖回复](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/topic_reply.png)
  
  10.  高亮显示的分词搜索引擎
  ![搜索](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/search_engine.png)
  
  ###  后台管理员界面一览
  1. 管理员登录界面
  ![登录界面](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_login.png)
  
  2. 管理员主界面
  ![管理员主界面](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_index.png)
     
  3.  用户列表
  ![用户列表](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_user_list.png)
  
  4.  主题帖列表
  ![主题帖](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_topic_list.png)
  
  5.  权限列表
  ![权限列表](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_permission_list.png)
  
  6.  角色列表
  ![角色列表](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_rolr_list.png)
  
  7.  修改角色
  ![修改角色](https://github.com/jianghuxiaoao/homeaccount/blob/master/githubimg/admin_rolr_edit.png)
  
 以上为系统关键功能界面
  ****
  
##  搭建系统步骤
  >  需要准备  
  
   1.  准备**tomcat8**版本  
   2.  准备**eclipse**带有sts的最好\[我使用的eclipse版本是**Neon**\]  
   3.  Maven-3.5.3  
   4.  jdk1.8  
   5.  mysql-5.1.55-community  
   6.  Solr-4.10.3
   7.    Mysql图形界面：Sqlyog
   8.  浏览器：谷歌浏览器
   
   >  下载项目  
   
   [github地址](https://github.com/jianghuxiaoao/homeaccount)  
   
   >  在Mysql中创建数据库：account  
   
使用Sqlyog连接mysql服务，并新建库命名为：account
   
   >  在eclipse中导入下载的项目  
   
 直接在eclipse中打开maven项目找到此项目打开即可**可能需要等待一会maven的下载**
 
   >  Solr是一个企业级的搜索服务，这里只介绍运行与访问  
   
 github下载下来的项目中有solr的服务，直接放到tomcat中运行即可
 
   >  在eclipse中使用直接运行项目
   
   这里面有一点需要注意的是：最好不要使用maven命令运行此项目，因为上传文件使用到了tomcat的虚拟路径 ，虚拟请求地址为：/upload
   本系统采用了Shiro提供的MD5加密算法对密码进行加密，但密码可以通过注册时的邮件重置
   
   ****
   - 搭建过程中有任何问题email到：javazt@126.com
