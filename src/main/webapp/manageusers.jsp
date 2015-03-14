<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/base.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>用户管理</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="css/jquery.treeview.css" />
    <link rel="stylesheet" href="${path}/css/bootstrap.css"/>
    <script src="${path}/js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <script src="js/jquery.treeview.js" type="text/javascript"></script>
    <style type="text/css">
    .leftContent{
	   float:left;
	   border:solid rgb(192,192,192) 3px;	
	   width:300px;
		display:inline;
    }
	.rightContent{
		border:solid rgb(192,192,192) 3px;
		 margin-left:310px;
		 margin-top:10px;
	 }
	 #id_create{
	 float:right;
	 margin-right:0px;
	 width:100px;
	 display:inline;
	 
	 
	 }
    </style>
    <script type="text/javascript">
       
      
    
      function createUser(){
    	      document.getElementById("id_create").style.display="none";
    		  document.getElementById("usersFrame").src="createuser";
    		 
      }
    
    </script>
 </head>
  <body style="margin-left:25px;margin-right:25px; min-width:1200px;">
   <div class="content">
        <div class="leftContent">
            <table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-color:#FFF; border-width:2px;"  >
            <tr>
            <td><img src="images/flag.JPG" />在职人员</td>
            </tr>
            <tr>
            <td>
            <ul id="tree" class="filetree">
                <li><span class="folder">深圳市鑫星空软件有限公司</span>
                    <ul>
                       <c:if test="${! empty listDepartments}">
                          <c:forEach items="${listDepartments}" var="department">
                           <li><span class="folder">${department.departName}</span></li>
                           </c:forEach>
                       </c:if>
                   </ul>
                 </li>
             </ul>
             </td>
             </tr>
             </table>
         </div>
         <div class="rightContent" >
           <div style="display:inline;"><span style="font-family:'微软雅黑';"><img src="images/folder.gif"/>管理用户</span></div>
           <div id="id_create">
           <button type="button" class="btn btn-primary"  onclick="createUser()">创建用户</button>
           </div>
           <br/>
           <iframe src="usersinfo?currentPage=1" width="960" height="500" scrolling="no" id="usersFrame" frameborder="0"></iframe>
             <div style="float:right;margin-right:-50px;width:100px;display:inline;">
                <button type="button" class="btn btn-primary"  onclick="history.go(-1)">返回</button>  
             </div>
         </div>
          
    </div> 
    <script type="text/javascript">
    $("#tree").treeview();
   </script>
    </body>
</html>
