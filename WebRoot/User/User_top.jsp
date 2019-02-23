

<%@page contentType="text/html" pageEncoding="UTF-8" import="JDBC.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body background="../image/top.jpg">
	<%
		User user = (User)session.getAttribute("user");
		//验证用户是否登录
		if (user == null || "".equals(user)) {
			response.sendRedirect("login.jsp");
		}
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<center>
		<table width="100%" align="center">
			<tr height="80">
				<th width="25%" align="left"></th>
				<th width="50%" align="center"><h1>网上汽车租赁管理系统</h1></th>
				<th width="25%" align="right" valign="bottom">当前用户：<%=user.getName()%></th>
			</tr>
		</table>
		<table width="100%" align="center">
			<tr height="20">
			<th width="10%" align="left"></th>
				<th width="80%"><a href="lookTheUser.jsp" target="main">个人中心</a> | <a
					href="../Car/lookCar.jsp" target="main">车辆信息</a> | <a
					href="../other/login.jsp" target="_parent">退出系统</a></th>
					<th width="10%" align="right" valign="bottom"></th>
			</tr>
		</table>
	</center>
</body>
</html>