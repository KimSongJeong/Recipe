package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;


@WebServlet("/idCheckCon")
public class idCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String u_id = request.getParameter("u_id");
		
		UserDAO dao = new UserDAO();
		boolean check = dao.confirmID(u_id);
		System.out.println(check);

		PrintWriter out = response.getWriter();
		out.print(check);
		

		
//		response.sendRedirect("join2.html?res="+cnt);
	}

}
