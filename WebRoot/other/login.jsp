<%@page contentType="text/html" pageEncoding="UTF-8" import="JDBC.*"%>
<%@page import="com.action.*" %>
<%@page import="servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
    </head>
    <body bgcolor="CCCFFF">
    <%if(request.getParameter("submit")!=null){
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

				/********** 将登录到系统的管理员名称保存到session中 ***********************************/
				session.setAttribute("manager", manager);
				/***********************************************************************************/
				//response.sendRedirect("manager/main1.jsp");
				request.getRequestDispatcher("../manager/main1.jsp").forward(request, response);// 转到系统主界面
			}
		} else if (code.length() == 10) {// 用户登录
			user = new User();
			user.setCode(request.getParameter("code"));
			user.setPwd(request.getParameter("pwd"));
			ret = loginCheck.checkUser(user);
			if (ret) {
				/********** 将登录到系统的管理员名称保存到session中 ***********************************/
				session.setAttribute("user", user);
				/***********************************************************************************/
				request.getRequestDispatcher("../User/main2.jsp").forward(
						request, response);// 转到系统主界面
			}
   }
   }
    %>
        <center>
            <br><br><br>
            <h3>&nbsp;&nbsp;登录</h3>
            <form action= ""  method="post">
                <table>
				<tr>
					<td>用户名：</td>
					<td><input name="code" type="text" id="code" size="27">
					</td>

				</tr>
				<tr>
					<td>密码：</td>
					<td><input name="pwd" type="password" id="pwd" size="27">
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td height="30">&nbsp;</td>
					<td align="center"><input name="submit" type="submit"
						class="btn_grey" value="登录">
						&nbsp; <input name="register" type="button" value="注册" onclick="window.location.href='User/addUser.jsp'">&nbsp;
						<input name="Submit2" type="button" value="关闭"
						onClick="window.close();">
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
            </form>
        </center>
    </body>
</html>
