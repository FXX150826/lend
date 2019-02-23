<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="JDBC.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>数据处理页面</title>
	</head>
	<body bgcolor="CCCFFF">
	<tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：个人中心>修改个人信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
		<center>
<%
		User user = (User)session.getAttribute("user");
		//验证用户是否登录
		if (user == null || "".equals(user)) {
			response.sendRedirect("login.jsp");
		}
	%>
			<br>
			<br>
			<br>
			<h3>
				&nbsp;&nbsp;修改用户信息
			</h3>
			<form action="../servlet/userServlet?action=updateUserCheck" method="post">
				<table border="0" width="200">
					<tr>
						<td>
							用户编号
						</td>
						<td>
							<input type="text" name="code"
								value="<%=user.getCode()%>">
						</td>
					</tr>
					<tr>
						<td>
							用户姓名
						</td>
						<td>
							<input type="text" name="name"
								value="<%=user.getName()%>">
						</td>
					</tr>
					<tr>
						<td>
							身份证号
						</td>
						<td>
							<input type="text" name="id"
								value="<%=user.getId()%>">
						</td>
					</tr>
					<tr>
						<td>
							密码
						</td>
						<td>
							<input type="text" name="pwd"
								value="<%=user.getPwd()%>">
						</td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<input name="submit" type="submit" value="提 交">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="clear" type="reset" value="取  消">
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>
