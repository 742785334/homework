<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp" %>
<%@include file="../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${path}/css/bootstrap.min.css" rel="stylesheet"/>
<script src="${path}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${path}/js/jquery.min.js" type="text/javascript"></script>
<script src="${path}/js/ajax.get.xmlhttp.js" type="text/javascript"></script>
<title>创建一个角色</title>
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
.tdNumber{
   
   width:100px;
   font-family:'微软雅黑'
}
.tdRoleName ,.tdRoleUserNumber{
   width:400px;
   font-family:'微软雅黑';
}
.tdOperate{

   
   width:150px;
   font-family:'微软雅黑';
}
 #id_create{
	 float:right;
	 margin-right:-18px;
	 width:100px;
	 display:inline;
	 
}
.createRole{

 	position:absolute;
	right:35%;
	top:10%;
	width:30%;
	height:200px;
	background-color:#fff;
	border:solid gray 5px;
	visibility:hidden;
	z-index:5;
}
.turnDark{

    position:absolute;
    left:0px;
    top:0px;
    width:100%;
    height:100%;
    opacity:0.8;
    filter:alpha(opacity=80);
    background-color:rgb(146,117,122);
    visibility:hidden;
    z-index:3;


}

</style>
<script type="text/javascript">
   
   var flag=0;

   function createRole(){
	   
	   document.getElementById("createRole").style.visibility="visible";
	   document.getElementById("turnDark").style.visibility="visible";
	   
   }
   
   function cancelCreateRole(){
	   
	   document.getElementById("createRole").style.visibility="hidden";
	   document.getElementById("turnDark").style.visibility="hidden";
	   
	   
   }
   
   function checkRole(){
	  checkRoleForAJAX();
	   
   }
   
   function checkRoleForAJAX(){
	   
	  var newRole=document.getElementById("id_new_role").value;
	  if(newRole==null||newRole==''){
		  alert("角色不能为空");
		  flag=1;
		  return;
		  
	  }
		  
	   xmlHttp=GetXmlHttpObject();
	   if(xmlHttp==null){
		   
		   alert("您的浏览器不支持AJAX!!!");
		   return;
		   
	   }
	   
	   var url="checkrole.do?roleName="+newRole;
	   xmlHttp.onreadystatechange=stateChanged;
	   xmlHttp.open("GET",url,true);
	   xmlHttp.send(null);
	   
   }
   
   function stateChanged(){
	   
	   if(xmlHttp.readyState==4){
		   if(xmlHttp.responseText=='false'){
			   alert("该角色已经存在");
		       return;
		   }
		   
		   flag=2;
	   }
	   
   }
   
   function canSubmit(){
	   checkRole();
	   if(flag==2)
		   return true;
	   
	   return false;
   }
   
</script>
</head>
<body style="margin-left:80px;margin-right:80px; min-width:900px;">
  <div style="display:inline;"><span style="font-family:'微软雅黑';"><img src="images/folder.gif"/>管理角色</span></div>
  <div id="id_create">
        <button type="button" class="btn btn-primary"  onclick="createRole()">新建角色</button>
  </div>
<form action="${path}/adduser" method="post" name="userForm" id="id_user" >
   <table class="table table-striped" width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#66FFCC">
      <tr style="background-color:blue">
        <td class="tdNumber">序号</td>
        <td class="tdRoleName">角色名称</td>
        <td class="tdRoleUserNumber">角色用户数</td>
        <td class="tdOperate">操作 </td>
      </tr>
      <c:if test="${! empty listMap}">
      <c:forEach items="${listMap}" var="map" varStatus="status">
        <tr>
          <td class="tdNumber">${status.index+1}</td>
          <td class="tdRoleName">${map.role_name}</td>
          <td class="tdRoleUserNumber">总用户数:${map.user_number}&nbsp;禁止登录数:${map.auxiliary_role_number}&nbsp;辅助角色数:${map.ban_login_number}</td>
          <td class="tdOperate">编辑 权限 克隆</td>
        </tr>
      </c:forEach>
      </c:if>
   </table>
</form>
<div class="createRole" id="createRole">
  <form class="form-horizontal" role="form" action="createrole" method="post" onsubmit="return canSubmit()">
   <div class="form-group">
      <br/>
      <label for="firstname" class="col-sm-2 control-label">角色:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" name="role.roleName" id="id_new_role" onblur="checkRole()" placeholder="请输入新角色">
      </div>
   </div>
   <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
         <button type="submit" class="btn btn-default">创建角色</button>
         <button type="button" class="btn btn-default" style="margin-left:100px;" onclick="cancelCreateRole()">取消</button>
      </div>
   </div>
   
  </form>
</div>
<div class="turnDark" id="turnDark">
</div>
</body>
</html>
