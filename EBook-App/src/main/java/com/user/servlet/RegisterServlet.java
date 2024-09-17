package com.user.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phonenumber = req.getParameter("phone");
			String password = req.getParameter("pass");
			String checkbox = req.getParameter("check");

			// System.out.println(name+""+email+""+phone number+""+""+password+""+checkbox);
			User u1 = new User();
			u1.setName(name);
			u1.setEmail(email);
			u1.setPhonenumber(phonenumber);
			u1.setPassword(password);

			HttpSession session = req.getSession();

			if (checkbox != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2=dao.checkUser(email);
				if(f2) {
					
					boolean f = dao.userRegister(u1);
					if (f) {

						// System.out.println("User Register success...");
						session.setAttribute("succMsg", " Registration sucessfully...");
						resp.sendRedirect("register.jsp");

					} else {

						// System.out.println("Something went wrong on server..");
						session.setAttribute("failedMsg", "Something went wrong on the server...");
						resp.sendRedirect("register.jsp");
					}

					
				}else {
					session.setAttribute("failedMsg", " User Already exist!");
					resp.sendRedirect("register.jsp");
				}

			} else {

				// System.out.println("Please check Agree terms and conditions");
				session.setAttribute("failedMsg", " Please check Agree terms and conditions");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}