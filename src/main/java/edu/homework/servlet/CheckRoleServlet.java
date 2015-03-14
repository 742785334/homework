package edu.homework.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import edu.homework.service.RoleService;

public class CheckRoleServlet extends HttpServlet {

	@Autowired
	private RoleService roleService;

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String roleName = request.getParameter("roleName");
    	if (roleName != null && !"".equals(roleName)) {
            roleName=new String(roleName.getBytes("iso-8859-1"),"UTF-8");
			if (roleService.find(roleName) == null)
				out.print(true);
			else
				out.print(false);

		}

		out.close();

	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());

	}

}
