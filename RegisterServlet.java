package com.servlets.pkg;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseCon.pkg.RegisterDao;
import com.beans.pkg.RegisterBean;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterDao registerDao;

	public void init() {
		registerDao = new RegisterDao();
	}

	/*Receives elements from submit request in html file? */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String discount_type = request.getParameter("discount_type");
		
		if(discount_type == null) {
			discount_type = "NA";
		}
		
		RegisterBean registerBean = new RegisterBean();
			
		registerBean.setUsername(username);
		registerBean.setEmail(email);
		registerBean.setPassword(password);
		registerBean.setFirst_Name(first_name);
		registerBean.setLast_Name(last_name);
		registerBean.setDiscount_type(discount_type);

		try {
			
			if (registerDao.validate(registerBean)) {
				response.sendRedirect("registersuccess.jsp");
				
			} else {
				response.sendRedirect("register.jsp");
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		
		}
	}
}