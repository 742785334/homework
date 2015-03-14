<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/base.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>部门管理</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <!-- 导入js和CSS-->
    <link rel="stylesheet" href="css/jquery.treeview.css" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <script src="js/jquery.treeview.js" type="text/javascript"></script>
    <script src="js/ajax.get.xmlhttp.js" type="text/javascript"></script>
    <script src="js/ajax.for.add.js" type="text/javascript"></script>
    <style type="text/css">
	 
	.header{
        margin-left:0;
		margin-right:0;
		height:25px;
        background-color:rgb(203,234,254);
		}
	.leftTitle{
	    float:left;
		border-right:solid #6CC;
		width:300px;
		text-align:center;
		font-family:"微软雅黑";
		font-weight:bold;
		
	}
	.rightTitle{
		 
		margin-left:0;
		margin-right:0;
		text-align:center;
		font-family:"微软雅黑";
		font-weight:bold;
		
	}
	.horizontalLine{
		margin-left:0;
		margin-right:0;
		height:5px;
		background-color:rgb(184,192,195);
		}
		
	.content{
		
		
		}
	.leftContent{
	   	
	    float:left;
		width:300px;
		border-left:solid rgb(184,192,195);
	    border-right:solid rgb(184,192,195);
		border-bottom:solid rgb(184,192,195);
		
	}
	
	.rightContent{
		
	     margin-left:303px;
		 
		 
	 }
	 
	 .upContent{
		  background-color:rgb(205,225,250);
		  border-right:solid #6CC;
		  border-left:solid #6cc;
		  border-bottom:solid #6cc;
		  text-indent:50px;
		  height:35px;
		  line-height:35px;
		 }
	.fontAndImgSpacing{
		margin-left:-20px;
		color:#000;
	 }
	 
	 .upContent>a{
		 text-decoration:none; 
		 color:#000;
		 cursor:pointer;
		 font-family:"微软雅黑";
		 
     }
	 .downContent{
	   border:solid rgb(186,204,218) 5px; 	 
	}
	.departClass{
	 
	    width:300px;
		text-align:right;
		font-family:"微软雅黑";
		
	}
	#id_float{
	
	   position:absolute;
	   width:100px;
	   height:25px;
	   text-align:center;
	   
	
	
	}
	#id_file{
	
    top: 0; 
    left: -30px; 
    width: 120px; /* 宽高和外围元素保持一致 */ 
    height: 30px; 
    opacity: 0; 
    -moz-opacity: 0; /* 兼容老式浏览器 */ 
    filter: alpha(opacity=0); /* 兼容IE */ 
	
	}
	</style>
    <script type="text/javascript">
	    
        var flag=0;
        var isSelected=0;
        window.onload=function(){
        	
        	  if($())
        	  document.getElementById("id_float").style.left=document.getElementById("id_import").getBoundingClientRect().left-60+"px";
			  document.getElementById("id_float").style.top=document.getElementById("id_import").getBoundingClientRect().top-5+"px";
        	
        	
        }
		function addDepart(){
			 $("#departmentTable").show();
		     getDepartmentNumber();
		     if($("#departName").html().indexOf('value=')==-1){   
		      $("#add").html("提交");
		      $("#departName").html("<input tpye='text' id='dpName' name='department.departName' value='"+$("#departName").html()+"' placeholder='必填项' size=50>");  
	          $("#departMnemonic").html("<input type='text' id='dpMnemonic' name='department.departMnemonic' value='"+$("#departMnemonic").html()+"' placeholder='必填项' size=50>");	     
	          $("#departLeading").html("<input type='text' id='dpLeading' name='department.departLeading' value='"+$("#departLeading").html()+"' size=50>");
	          $("#departProperty").html("<input type='text' id='dpProperty' name='department.departProperty' value='"+$("#departProperty").html()+"' size=50>");
	           
		     }else{
		    	 
		    	 var flag=1;
		    	 if(dpName.value==""){
		    		 alert("部门名称不能为空");
		    	     flag=0;
		    	 }else if(dpMnemonic.value==""){
		    		 alert("部门助记符不能为空");
		    	     flag=0;
		    	 }
		    	 
		    	 if(flag==1){
		    		 if(window.confirm("确定要提交吗?"))
		    		  $("#saveAndUpdate").submit();
		    		 
		    	 }
		    	 
		    	 
		     }
		
		}
		
		
		function updateDepart(){
					
			if(isSelected==0){
				alert("请选择要修改的部门");
			    return;
			}
		    if($("#departName").html().indexOf('value=')==-1){   
			      $("#update").html("提交修改");
			      $("#departName").html("<input tpye='text' id='dpName' name='department.departName' value='"+$("#departName").html()+"' placeholder='必填项' size=50>");  
		          $("#departMnemonic").html("<input type='text' id='dpMnemonic' name='department.departMnemonic' value='"+$("#departMnemonic").html()+"' placeholder='必填项' size=50>");	     
		          $("#departLeading").html("<input type='text' id='dpLeading' name='department.departLeading' value='"+$("#departLeading").html()+"' size=50>");
		          $("#departProperty").html("<input type='text' id='dpProperty' name='department.departProperty' value='"+$("#departProperty").html()+"' size=50>");
		           
			     }else{
			    	 
			    	 var flag=1;
			    	 if(dpName.value==""){
			    		 alert("部门名称不能为空");
			    	     flag=0;
			    	 }else if(dpMnemonic.value==""){
			    		 alert("部门助记符不能为空");
			    	     flag=0;
			    	 }
			    	 
			    	 if(flag==1){
			    		 if(window.confirm("确定要提交修改吗?")){
			    			 
			    		<%--  
			    		location.href="${path}/departmentupdate?department.departNumber="+isSelected+"&department.departName="+dpName.value+"&department.departMnemonic="+dpMnemonic.value+"&department.departLeading="+dpLeading.value+"&department.departProperty="+dpProperty;
			    		--%>
			    			 document.departmentForm.action="departmentupdate?department.departNumber="+isSelected;
			    			 $("#saveAndUpdate").submit();
			    		 }
			              
			    		 
			    	 }
			    	 
			    	 
			     }
			
		}
		
		function choose(departNumber,departName,departMnemonic,departLeading,departProperty){
			
		    	  isSelected=departNumber;
		    	  $("#departmentTable").show();
		    	  $("#departNumber").html(departNumber);
		    	  $("#departName").html(departName);  
		          $("#departMnemonic").html(departMnemonic);	     
		          $("#departLeading").html(departLeading);
		          $("#departProperty").html(departProperty);  	
		    	
			
		}
		function deleteDepart(){
			
			if(isSelected==0){
				alert("请选择要删除的部门");
			    return;
			}
			$("#delete").html("确定删除");
			if(window.confirm("确定要删除吗?")){
				
				location.href="${path}/departmentdelete?department.departNumber="+isSelected;
				
			}
			
			
			
		}
		
		function exportExcel(){
			
			location.href="${path}/databasetoexcel";
			
		}
		
		function importFile(){
			 
		
			    
			   if(flag==0){
				
				 document.getElementById("id_import").innerHTML="确定上传";
				 document.getElementById("id_float").style.display="none";
				 flag=flag+1;  
			   }
			    
			
			  
		}
		function importDatabase(){
			
			
			var file=document.getElementById("id_file").value;
			if(file==''){
				 document.getElementById("id_import").innerHTML="上传部门";
				 document.getElementById("id_float").style.display="block";
				 flag=0;
				 return;
			}
				
			
			 if(flag==1){
				   
			     $("#import").submit();	  
				 document.getElementById("id_import").innerHTML="上传部门";
				 document.getElementById("id_float").style.display="block";
				 flag=0;  
			 }
			
			
		}
    
    </script>
 </head>
  
  <body style="margin-left:25px;margin-right:25px; min-width:1200px;">
    
   <div class="header">
     <div class="leftTitle">部门树状图</div>
     <div class="rightTitle">部门信息</div>
   </div>
   <div class="horizontalLine"></div>
   <div class="content">
        <div class="leftContent">
            <ul id="tree" class="filetree">
                <%-- 
                <li><span class="folder">1临床服务类科室</span>
                    <ul>
                        <li><span class="folder">101内科</span>
                            <ul>
                                <li><span class="file">1</span></li>
                                <li><span class="file">2</span></li>
                                <li><span class="file">3</span></li>
                            </ul>
                        </li>
                        
                        <li><span class="file">102肛肠科</span>
                        </li>
                        <li><span class="file">103儿科</span>
                        </li>
                        <li><span class="file">104中医外科</li>
                         <li><span class="folder">105康复科</span>
                              <ul>
                                <li><span class="file">1</span></li>
                                 <li><span class="file">2</span></li>
                                 <li><span class="file">3</span></li>
                              </ul>
                         </li>
                    </ul>
                    
                </li>
                <li><span class="folder">2医疗技术类科室</span></li>
                --%>
                <c:if test="${! empty setDepartments}">
                   <c:forEach items="${setDepartments}" var="department">
                    <li style="cursor:pointer" onclick="choose(${department.departNumber},'${department.departName}','${department.departMnemonic}','${department.departLeading}','${department.departProperty}')"><span class="folder">${department.departNumber}${department.departName}</span></li>
                  </c:forEach>
                </c:if>
            </ul>
         </div>
         <div class="rightContent">
            <div class="upContent">
            <a><img src="images/download.png"/>模板下载</a>&nbsp;&nbsp;
            <a><img src="images/up.png"/>
            <div id="id_import" style="display:inline" onclick="importDatabase()">上传部门</div>
            <div id="id_float">
                <form action="importdatabase" method="post" enctype="multipart/form-data" id="import">
      <input type="file" onclick="importFile()" id="id_file" name="upload" accept=".xls"/>
                </form>
            </div>
            </a>&nbsp;&nbsp;
            <a onclick="exportExcel()"><img src="images/export.png"/>导出部门</a>&nbsp;&nbsp;
            <a onclick="addDepart()"><img src="images/add.png"/><span id="add">添加</span></a>&nbsp;&nbsp;
            <a onclick="updateDepart()"><img src="images/update.png"/><span id="update">修改</span></a>&nbsp;&nbsp;
            <a onclick="deleteDepart()"><img src="images/delete.png"/><span id="delete">删除</span></a>&nbsp;&nbsp;
            <a href="#"><img src="images/fresh.png"/>刷新</a>| 请点击响应工具栏操作
            </div>
            <div class="downContent">
               <form action="${path}/departmentadd" method="post" id="saveAndUpdate" name="departmentForm">
                <table  width="100%" border="1" cellspacing="0" cellpadding="0"  bordercolor="#FFCCCC" id="departmentTable" style="display:none">
                  <tr>
                  <td class="departClass">部门编码:</td>
                  <td><span id="departNumber"></span></td>
                  </tr>
                   <tr>
                  <td class="departClass">部门名称:</td>
                  <td id="departName"></td>
                  </tr> 
                  <tr>
                  <td class="departClass">部门助记码:</td>
                  <td id="departMnemonic"></td>
                  </tr> 
                  <tr>
                  <td class="departClass">部门负责人:</td>
                  <td id="departLeading"></td>
                  </tr>
                  <tr>
                  <td class="departClass">部门属性:</td>
                  <td id="departProperty"></td>
                  </tr>
                </table>
                </form>
            </div>
         </div>
    </div> 
   <script type="text/javascript">
    $("#tree").treeview();
   </script>
   <%
      
      String infoPrompt=(String)request.getAttribute("infoPrompt");
      if(infoPrompt!=null&&!infoPrompt.equals("")){
    	  
    	  out.print("<script type='text/javascript'>alert('"+infoPrompt+"')</script>");
    	  
      }
   
   %>
    </body>
</html>
