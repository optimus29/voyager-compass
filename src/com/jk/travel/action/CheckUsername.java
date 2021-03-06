package com.jk.travel.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jk.travel.dao.SecurityDAO;

@WebServlet("/CheckUsername")
public class CheckUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String user = new SecurityDAO().checkUser(username);
		String resText = "fail";

		if (user == null)
			resText = "ok";

		response.setContentType("text/plain");
		response.getWriter().write(resText);

		// System.out.println("CheckUsername:: username: " + username + ",
		// response: " + resText);
	}

}
