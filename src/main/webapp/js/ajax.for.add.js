var number;
function getDepartmentNumber(){
	 
	 
	  xmlHttp=GetXmlHttpObject();
	  if(xmlHttp==null){
		  
		  alert("您的浏览器不支持AJAX!");
		  return;
		  
	  }
	  
	  var url="getdepartnumber.do";
	  xmlHttp.onreadystatechange=stateChanged;
	  xmlHttp.open("get",url,true);
	  xmlHttp.send(null);
	
	
}

function stateChanged(){
	
	if(xmlHttp.readyState==4){
		number=xmlHttp.responseText;
		document.getElementById("departNumber").innerHTML=xmlHttp.responseText;
		 
	}
	
	
}