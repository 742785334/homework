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

import edu.homework.model.User;
import edu.homework.service.UserService;

public class CheckUserNameServlet extends HttpServlet {

	
	@Autowired
	private UserService userService;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("service");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String userName=request.getParameter("userName");
		User user=userService.get(userName);
		if(user!=null)
			out.print(false);
		else
			out.print(true);
		
		out.close();
		
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}
}
