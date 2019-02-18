
#  homeaccount
家庭记账系统（ssh+shiro+solr）

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
