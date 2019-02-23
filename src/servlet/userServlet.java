package servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.sun.xml.ws.rm.jaxws.runtime.Session;

import java.util.*;
import JDBC.*;

import java.sql.*;
import com.action.*;

public class userServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("action:"+action);
		if ("deleteUser".equals(action)) {
			String code = request.getParameter("code");
			boolean flag = DBGet.deleteUser(code);
			if (flag) {
				response.sendRedirect("../operatOk/deleteOk.jsp");
			}
		} else if ("addUser".equals(action)) {
			User user = new User();

			user.setCode(request.getParameter("code"));
			user.setId(request.getParameter("id"));
			user.setName(request.getParameter("name"));
			user.setPwd(request.getParameter("pwd"));
			if (request.getParameter("submit") != null) {

				boolean flag = DBGet.addUser(user);
				if (flag) {

					response.sendRedirect("../operatOk/addOk.jsp");
				}
			}
		} else if ("updateUser".equals(action)) {

			String code = request.getParameter("code");
			ResultSet rs = DBGet.lookTheUser(code);
			if (rs != null) {
				request.setAttribute("rs", rs);
				request.getRequestDispatcher("../User/updateUserCheck.jsp")
						.forward(request, response);
			}
		} else if ("updateUserCheck".equals(action)) {
			User user = new User();
			user.setCode(request.getParameter("code"));
			user.setId(request.getParameter("id"));
			user.setName(request.getParameter("name"));
			user.setPwd(request.getParameter("pwd"));
			boolean flag = DBGet.updateUser(user);
			if (flag) {
				response.sendRedirect("../operatOk/updateOk.jsp");
			}
		} else if ("login".equals(action)) {// 当action值为login时，调用managerLogin()方法验证管理员身份
			personLogin(request, response);
		} else if ("addCar".equals(action)) {
			Car car=new Car();
			car.setCode(request.getParameter("code"));
			car.setBrand(request.getParameter("brand"));
			car.setNum(request.getParameter("num"));
			car.setPrice(request.getParameter("price"));
			car.setType(request.getParameter("type"));
			if (request.getParameter("submit") != null) {

				boolean flag = DBGet.addCar(car);
				if (flag) {

					response.sendRedirect("../operatOk/addOk.jsp");
				}}
		}else if ("deleteCar".equals(action)) {
			String code = request.getParameter("code");
			boolean flag = DBGet.deleteCar(code);
			if (flag) {
				response.sendRedirect("../operatOk/deleteOK.jsp");
			}
		}else if ("updateCar".equals(action)) {

			String code = request.getParameter("code");
			ResultSet rs = DBGet.lookTheCar(code);
			if (rs != null) {
				request.setAttribute("rs", rs);
				request.getRequestDispatcher("../Car/updateCarCheck.jsp")
						.forward(request, response);
			}
		} else if ("updateCarCheck".equals(action)) {
			Car car=new Car();
			car.setCode(request.getParameter("code"));
			car.setBrand(request.getParameter("brand"));
			car.setNum(request.getParameter("num"));
			car.setPrice(request.getParameter("price"));
			car.setType(request.getParameter("type"));
			boolean flag = DBGet.updateCar(car);
			if (flag) {
				response.sendRedirect("../operatOk/updateOk.jsp");
			}
		} else if ("deleteLend".equals(action)) {
			String code = request.getParameter("code");
			boolean flag = DBGet.deleteLend(code);
			if (flag) {
				response.sendRedirect("../operatOk/deleteOK.jsp");
			}
		}else if ("addLend".equals(action)) {
			Lend lend=new Lend();
			lend.setCarCode(request.getParameter("carCode"));
			lend.setLendCode(request.getParameter("lendCode"));
			lend.setLendTime(request.getParameter("lendTime"));
			lend.setUserCode(request.getParameter("userCode"));
			if (request.getParameter("submit") != null) {

				boolean flag = DBGet.addLend(lend);
				if (flag) {

					response.sendRedirect("../operatOk/addOk.jsp");
				}}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public static void personLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String code = request.getParameter("code");
		Manager manager = null;
		User user = null;
		boolean ret = false;
		if (code.length() == 6) {// 管理员登录
			manager = new Manager();
			manager.setCode(request.getParameter("code"));
			manager.setPwd(request.getParameter("pwd"));
			ret = loginCheck.checkManager(manager);
			if (ret) {
				HttpSession session = request.getSession();
				session.setAttribute("manager", manager);

				request.getRequestDispatcher("../manager/main1.jsp").forward(request, response);// 转到系统主界面
			}
		} else if (code.length() == 10) {// 用户登录
			user = new User();
			user.setCode(code);
			user.setPwd(request.getParameter("pwd"));
			ret = loginCheck.checkUser(user);
			if (ret) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				request.getRequestDispatcher("../User/main2.jsp").forward(
						request, response);// 转到系统主界面
			}
		}
	}
}
