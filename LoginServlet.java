package com.servlets.pkg;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseCon.pkg.LoginDao;
import com.beans.pkg.LoginBean;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			
			if (loginDao.validate(loginBean)) {
				HttpSession session = request.getSession();
				String affil = loginDao.get_affiliation(loginBean);
				
				session.setAttribute("username", username); //Save username to session. We need to identify user
				session.setAttribute("affil", affil); //Save affiliation. We need this to determine what features user has access to 
				
				/*Redirect to appropriate page*/
				if(affil.equals("customer")) {
					response.sendRedirect("customer.jsp");
				}
				else if(affil.equals("representative")) {
					response.sendRedirect("representative.jsp");
				}
				else{
					response.sendRedirect("admin.jsp");
				}
				
				
			} else {
				HttpSession session = request.getSession();
				//session.setAttribute("user", username);
				response.sendRedirect("index.jsp");
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
