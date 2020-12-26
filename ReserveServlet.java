package com.servlets.pkg;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseCon.pkg.ReserveDao;
import com.beans.pkg.ReserveBean;


@WebServlet("/reserve")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReserveDao reserveDao;

	public void init() {
		reserveDao = new ReserveDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ReserveBean reservation = (ReserveBean) request.getAttribute("reservation");
		
		
		
		
		try {
			
			String discount_type = reserveDao.get_discount_type(reservation);
			double fare = (double) reservation.getFare();
			
			if(discount_type.equals("child")) {
				fare = fare * 0.75;
			}
			else if(discount_type.equals("senior")){
				fare = fare * 0.65;
			}
			else if(discount_type.equals("disabled")){
				fare = fare * 0.50;
			}
			
			reservation.setFare((int)fare);
			
			reserveDao.insert(reservation);
			
			response.sendRedirect("reserveSuccess.jsp");
			
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
