<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${path}/css/bootstrap.min.css"/>
<script src="${path}/js/jquery.min.js" type="text/javascript"></script>
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
</style>
<script type="text/javascript">

window.onload=function(){
 var url=window.parent.document.getElementById("usersFrame").src;
	if(url.indexOf("createuser")!=-1){
	  window.parent.document.getElementById("id_create").style.display="inline";
	  window.parent.document.getElementById("usersFrame").src="usersinfo?currentPage=1";
	  }
}
   function allSelect(){
   	  
	    var rooms=document.getElementsByName("selected");
	    
	    if(document.getElementById("checkAll").checked==true){
	      for(var j=0;j<rooms.length;j++)
	    	if(rooms.item(j).checked==false)
	    		rooms.item(j).checked=true;
	     
	      
	      
	    }
	    else{
	    	
	    	
	    	for(var j=0;j<rooms.length;j++)
		    		rooms.item(j).checked=false;
	    	
	    }
	    
   }
   
   function deleteSelected(option,currentPage){
	   
	   var rooms=document.getElementsByName("selected");
	   var flag=false;
	      for(var j=0;j<rooms.length;j++)
	    	if(rooms.item(j).checked==true)
	    		flag=true;
	     
	   if(flag==false){
		   
		   alert("您没有选择要删除的用户");
		   return;
		   
	   }   
	      
	   if(option==1)
	      document.userForm.action="${path}/deleteselectedusers?currentPage="+currentPage;
	   else if(option==2)
		  document.userForm.action="${path}/deleteselecteduserstimelength?currentPage="+currentPage;
	   else if(option==3){
		  document.userForm.action="${path}/deleteselecteduserspassword?currentPage="+currentPage;	  

	   }
	   document.getElementById("id_user").submit();
	   
   }
   
   
   function updateUser(id,currentPage){
		var whichTr = $("#modify_"+id).parent().parent();//TR
		var userName = whichTr.children("#userName_"+id);//TD
		var userRealName = whichTr.children("#userRealName_"+id);//TD
		var userDepartment = whichTr.children("#userDepartment_"+id);//TD
		var userArrangeClass = whichTr.children("#userArrangeClass_"+id);//TD
		var userMainRole = whichTr.children("#userMainRole_"+id);//TD
		var userManageScope = whichTr.children("#userManageScope_"+id);//TD
		var userOnlineTimeLength = whichTr.children("#userOnlineTimeLength_"+id);//TD
		var userFreeTime= whichTr.children("#userFreeTime_"+id);//TD
	     
		if(userName.html().indexOf('value=')==-1){
			userName.html("<input type='text' name='user.userName' value='"+userName.html()+"' class='tdWidth' readonly=readonly>");
			userRealName.html("<input type='text' name='user.userRealName' value='"+userRealName.html()+"' class='tdWidth'>");
			userDepartment.html("<input type='text' name='user.userDepartment' value='"+userDepartment.html()+"' class='tdWidth'>");
			userArrangeClass.html("<input type='text' name='user.userArrangeClass' value='"+userArrangeClass.html()+"' class='tdWidth'>");
			userMainRole.html("<input type='text' name='user.userMainRole' value='"+userMainRole.html()+"' class='tdWidth'>");
			userMainRole.html("<select name='user.userMainRole' class='tdWidth'> <option>超级系统管理员</option> <option>总经理</option><option>副总经理</option><option>部门经理</option><option>部门副经理</option><option>人事管理</option><option>行政管理</option><option>职员</option></select>")
			userManageScope.html("<input type='text' name='user.userManageScope' value='"+userManageScope.html()+"' class='tdWidth'>");
			userOnlineTimeLength.html("<input type='text' name='user.userOnlineTimeLength' value='"+userOnlineTimeLength.html()+"' class='tdWidth'>");
			userFreeTime.html("<input type='text' name='user.userFreeTime' value='"+userFreeTime.html()+"' class='tdWidth'>");
		    $("#modify_"+id).html("修改");
		}else{
			
			document.userForm.action="userupdateandsave?currentPage="+currentPage;
			$("#id_user").submit();
		 	
		}
		 
	   
   }
   
</script>
</head>
<body>
<form action="userupdateandsave" method="post" name="userForm" id="id_user">
   <table width="100%" cellpadding="0" cellspacing="0" border="1" bordercolor="#66FFCC">
              <tr class="firstRow">
              <td width="50">选择</td>
              <td class="tdWidth">用户名</td>
              <td class="tdWidth">真实姓名</td>
              <td class="tdWidth">部门</td>
              <td class="tdWidth">排班</td>
              <td class="tdWidth">角色</td>
              <td class="tdWidth">管理范围</td>
              <td class="tdWidth">在线时间</td>
              <td class="tdWidth">闲置时间</td>
              <td class="tdWidth">操作</td>
             </tr>
            <c:if test="${! empty userList}">
             <c:forEach items="${userList}" var="user" varStatus="status">
                <tr>
                  <td><input type="checkbox" name="selected" value="${user.userName}" id="selected"/></td>
                  <td id="userName_${status.index}">${user.userName}</td>
                  <td id="userRealName_${status.index}">${user.userRealName}</td>
                  <td id="userDepartment_${status.index}">${user.userDepartment}</td>
                  <td id="userArrangeClass_${status.index}">${user.userArrangeClass}</td>
                  <td id="userMainRole_${status.index}">${user.userMainRole}</td>
                  <td id="userManageScope_${status.index}">${user.userManageScope}</td>
                  <td id="userOnlineTimeLength_${status.index}">${user.userOnlineTimeLength}</td>
                  <td id="userFreeTime_${status.index}">${user.userFreeTime}</td>
                  <td class="operateClass">
                  <a href="${path}/cleartimelength?user.userName=${user.userName}&currentPage=${currentPage}">清空时长</a><br/>
                  <a id="modify_${status.index}" onclick="updateUser('${status.index}','${currentPage}')">编辑</a>
                  </td>
                </tr>
             </c:forEach>
             </c:if>
             <tr>
              <td colspan="10">
              <button type="button" class="btn btn-primary"  onclick="location.href='${path}/usersinfo?currentPage=${perPage}'">上一页</button> 
              <button type="button" class="btn btn-primary"  onclick="location.href='${path}/usersinfo?currentPage=${nextPage}'">下一页</button>   
              [第${currentPage}页]/[共${allPage}页]&nbsp;&nbsp;[每页${everyPageNumber}条]/[共${allNumber}条]</td></tr>
             <tr>
             <td colspan="10">
             <input type="checkbox" id="checkAll" onclick="allSelect()"/>全选&nbsp;
             <span onclick="deleteSelected(1,'${currentPage}')" class="operateClass">删除所选用户</span>&nbsp;
             <span onclick="deleteSelected(2,'${currentPage}')" class="operateClass">清空所选用户在线时长</span>&nbsp;
             <span onclick="deleteSelected(3,'${currentPage}')" class="operateClass">清空所选用户密码</span>
             </td>
             </tr>
</table>
</form>
</body>
</html>
