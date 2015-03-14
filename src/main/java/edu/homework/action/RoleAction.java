package edu.homework.action;

import java.util.List;
import java.util.Map;

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

import edu.homework.model.Role;
import edu.homework.service.RoleService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value = "/*")
public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleService roleService;

	private Role role;

	@Action(value = "rolelist", results = { @Result(name = "success", location = "/WEB-INF/createrole.jsp") })
	public String roleList() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		List<Map<String, Object>> listMap = roleService.getRoleRelaNumber();

		request.setAttribute("listMap", listMap);

		return SUCCESS;

	}

	@Action(value = "createrole", results = { @Result(name = "success", type = "redirect", location = "rolelist") })
	public String createRole() throws Exception {

		roleService.add(role);
		return SUCCESS;

	}

	@Override
	public Role getModel() {
		return role;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
