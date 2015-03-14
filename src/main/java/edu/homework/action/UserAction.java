package edu.homework.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.homework.common.PageConstants;
import edu.homework.common.vo.PageResult;
import edu.homework.model.User;
import edu.homework.service.UserService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value = "/*")
public class UserAction extends ActionSupport implements ModelDriven<User>{

	@Autowired
	private UserService userService;
	@Autowired
	private PageConstants pageConstants;
	private User user;
	private int currentPage;

	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Action(value = "usersinfo", results = { @Result(name = "success", location = "/WEB-INF/usersinfo.jsp") })
	public String usersinfo() {

		//System.out.println("usersinfo"+"----"+currentPage);
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = new User();
		PageResult<User> result = userService.pageResult(user, currentPage);

		request.setAttribute("userList", result.getCurrentList());
		request.setAttribute("perPage", result.getPer());
		request.setAttribute("nextPage", result.getNext());
		request.setAttribute("allPage", result.getAllPage());
		request.setAttribute("everyPageNumber", pageConstants.getPageMax());
		request.setAttribute("allNumber", result.getAllResult());
		request.setAttribute("currentPage", result.getCurrentPage());
		return SUCCESS;
	}

	@Action(value = "cleartimelength", results = { @Result(name = "success", type = "redirect", location = "usersinfo?currentPage=${currentPage}") })
	public String clearTimeLength() throws Exception {

		//System.out.println("cleartimelength"+"-----"+currentPage);
		User u=userService.get(user.getUserName());
		u.setUserFreeTime("");
		userService.update(u); 
		
		return SUCCESS;
	}

	@Action(value="deleteselectedusers",results={@Result(name="success",type="redirect",location="usersinfo?currentPage=${currentPage}")})
	public String deleteSelectedUsers() throws Exception{
		 
		HttpServletRequest request=ServletActionContext.getRequest();
		String []userNames=request.getParameterValues("selected");
		User u=null;
		for(String userName:userNames){
			u=userService.get(userName);
			userService.delete(u);
		   
		}
		  return SUCCESS;
	}
	@Action(value="deleteselecteduserspassword",results={@Result(name="success",type="redirect",location="usersinfo?currentPage=${currentPage}")})
	public String deleteSelectedUsersPassword() throws Exception{
		
		 
		HttpServletRequest request=ServletActionContext.getRequest();
		String []userNames=request.getParameterValues("selected");
		User u=null;
		for(String userName:userNames){
			u=userService.get(userName);
		    u.setUserPassword("");
		    userService.update(u);
			 
		   
		}
		  
		return SUCCESS;
	} 
	
	@Action(value="deleteselecteduserstimelength",results={@Result(name="success",type="redirect",location="usersinfo?currentPage=${currentPage}")})
	public String deleteSelectedUsersOnlineTimeLength() throws Exception{
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String []userNames=request.getParameterValues("selected");
		
		User u=null;
		
		for(String userName:userNames){
			u=userService.get(userName);
			u.setUserOnlineTimeLength("0");
			userService.update(u);
			
		}
			
		
		
		return SUCCESS;
		
	}
	
	@Action(value="createuser",results={@Result(name="success",location="/WEB-INF/createuser.jsp")})
	public String createUser() throws Exception{
		
	      return SUCCESS;
	}
	
	@Action(value="adduser",results={@Result(name="success",type="redirect",location="usersinfo")})
	public String addUser() throws Exception{
		
		userService.add(user);
		return SUCCESS;
		
	}
	
	@Action(value="userupdateandsave",results={@Result(name="success",type="redirect",location="usersinfo")})
	public String updateAndSave() throws Exception{
		
		userService.update(user);
		return SUCCESS;
		
	}

	@Override
	public User getModel() {
		return user;
	}
	
}
