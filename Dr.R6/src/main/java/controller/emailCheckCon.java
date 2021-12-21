package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;

@WebServlet("/emailCheckCon")
public class emailCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("u_email");

		UserDAO uDao = new UserDAO();
		boolean check = uDao.confirmEmail(email);
		System.out.println(check);

		PrintWriter out = response.getWriter();
		out.print(check);
	}

}
