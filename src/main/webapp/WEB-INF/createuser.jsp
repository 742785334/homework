<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${path}/css/bootstrap.min.css" rel="stylesheet"/>
<script src="${path}/js/ajax.get.xmlhttp.js"></script>
<title>无标题文档</title>
<style type="text/css">
.tdWidth{
   	
	width:100px;
	
}
.firstRow{
	background-color:rgb(22,85,152);
	text-align:center;
}
.operateClass{
 
  color:blue;
  cursor:pointer;
  
}
.textRight{

  text-align:right;
 font-family:'微软雅黑';

}
</style>
<script type="text/javascript">
   var flag=0;
   
   
   function checkUserNameAJAX(){
	   var userName=document.getElementById("id_user_name").value;
		  if(userName==null||userName==''){
			  flag=0;
			  alert("用户名不能为空")
		  }

		  xmlHttp=GetXmlHttpObject();
		   if(xmlHttp==null){
			   alert("您的浏览器不支持AJAX!");
			   return;
			   
		   }
		   
		   var url="checkusername.do?userName="+userName;
		   xmlHttp.onreadystatechange=stateChanged;
		   xmlHttp.open("GET",url,true);
		   xmlHttp.send(null);
		    
		   
	   
   }
   function checkUserName(){
	   checkUserNameAJAX();
   }
   
   function stateChanged(){
	   
	   if(xmlHttp.readyState==4){
		  
		   if(xmlHttp.responseText=='false'){
			   flag=1;
			   alert("该用户名已经被使用了");
		   }else{
			   
			   flag=2;
			   
		   }
		   
	   }
	   
	   
   }
   
   function clearAuxiliaryRole(){
	   
	     document.getElementById("id_auxiliary_role").value="";
	   
	   
   }
    function checkRealName(){
    	
    	if(document.getElementById("id_user_real_name").value==null||document.getElementById("id_user_real_name").value==''){
    		alert("真实姓名不能为空");
    		return false;
    	}else{
    	     return true;
    	}    	
    }
    
    function canSubmitForm(){
   
    	checkUserName();
    	if(flag==0){
    		
    		alert("用户名不能为空");
    		return false;
    		
    	}else if(flag==1){
    		
    		alert("用户名已经存在");
    		return false;
    		
    	}
        if(checkRealName()==false)
        	return false;
    		
        if(checkCapacity()==false)
        	return false;
    	
    	
    	return true;
    }
    
    function checkCapacity(id){
    	
    	var capacity=document.getElementById(id).value;
    	if(capacity==null||capacity=='')
    		return true;
    	var pattern=/^[1-9][0-9]*$/;
    	if(!pattern.test(capacity)){
    		alert("容量只有数字组成");
    		return false;
    		
    	}
    	
    	return true;
    	
    }
</script>
</head>
<body>
<form action="${path}/adduser" method="post" name="userForm" id="id_user" onsubmit="return canSubmitForm()">
   <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#66FFCC">
      <tr>
       <td colspan="4"><p  class="btn btn-primary" style="cursor:none;width:100%;text-align:left;">以下选项有管理员设置</p></td>
      </tr>
      <tr>
        <td class="textRight">用户名:</td>
        <td><input type="text" id="id_user_name" name="user.userName" onblur="checkUserName()"/></td>
        <td style="font-family:'微软雅黑'">真实姓名:</td>
        <td><input type="text" name="user.userRealName" onblur="checkRealName()" id="id_user_real_name"/></td>
      </tr>    
      <tr>
        <td class="textRight">主角色:</td>
        <td colspan="3">
          <select name="user.userMainRole">
            <option>超级系统管理员</option>
            <option>总经理</option>
            <option>副总经理</option>
            <option>部门经理</option>
            <option>部门副经理</option>
            <option>人事管理</option>
            <option>行政管理</option>
            <option>职员</option>
          </select>
        </td>
      </tr>    
      <tr>
        <td class="textRight ">辅助角色:</td>
        <td colspan="3">
        <textarea rows="2" cols="90" name="user.userAuxiliaryRole" id="id_auxiliary_role"></textarea>
        <button type="button" class="btn btn-primary" onclick="clearAuxiliaryRole()">清空</button>  
        </td>
      </tr>    
      <tr>
        <td class="textRight">用户排序号:</td>
        <td colspan="3"><input type="text" name="user.userOrderNumber"/></td>
      </tr>    
      <tr>
        <td class="textRight">部门:</td>
        <td colspan="3">
        <select name="user.userDepartment">
           <option value="总经办">|——总经办</option>
           <option value="行政部">|——行政部</option>
           <option value="人事部">|——人事部</option>
           <option value="财务部">|——财务部</option>
           <option value="销售部">|——销售部</option>
           <option value="北京市">| |——北京市</option>
           <option value="上海市">| |——上海市</option>
           <option value="广州市">| |——广州市</option>
           <option value="离职人员/外部人员">离职人员/外部人员</option>
        </select>
        </td>
      </tr>    
      <tr>
        <td class="textRight">管理范围:</td>
        <td colspan="3"><input type="text" name="user.userManageScope"/></td>
      </tr>    
      <tr>
        <td class="textRight">系统访问控制:</td>
        <td colspan="3"><input type="text" name="user.userAccessControl"/></td>
      </tr>    
      <tr>
        <td class="textRight">考勤排班类型:</td>
        <td><input type="text" name="user.userArrangeClass"/></td>
        <td style="font-family:'微软雅黑'">IMA广播权限:</td>
        <td>
         <input type="radio" name="user.userBroadcastAuthority" value="无"/>无
         <input type="radio" name="user.userBroadcastAuthority" value="有"/>有
        </td>
      </tr>    
      <tr>
        <td class="textRight">绑定IP地址:</td>
        <td colspan="3"><input type="text" name="user.userIpAddress"/></td>
      </tr>    
      <tr>
        <td class="textRight">内部邮箱容量:</td>
        <td><input type="text" name="user.userInsideMailCapacity" id="id_mail_capacity" onblur="checkCapacity('id_mail_capacity')"/>MB</td>
        <td style="font-family:'微软雅黑'">个人文件容量:</td>
        <td><input type="text" name="user.userPersonFileCapacity" id="id_file_capacity" onblur="checkCapacity('id_file_capacity')"/>MB</td>
      </tr>    
   </table>
   <center>
  <button type="submit" class="btn btn-primary" style="vertical-align: top; margin-left: 50px">提交</button>  
  </center>
</form>
</body>
</html>
