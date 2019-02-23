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
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：用户管理>修改用户信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
		<center>

			<br>
			<br>
			<br>
			<h3>
				&nbsp;&nbsp;修改用户信息
			</h3>
			<form action="../servlet/userServlet?action=updateUserCheck" method="post">
				<table border="0" width="200">
					<%
					ResultSet rs=(ResultSet)request.getAttribute("rs");
						rs.beforeFirst(); //移至第一条记录之前
						rs.next();
					%>
					<tr>
						<td>
							用户编号
						</td>
						<td>
							<input type="text" name="code"
								value="<%=rs.getString("code")%>">
						</td>
					</tr>
					<tr>
						<td>
							用户姓名
						</td>
						<td>
							<input type="text" name="name"
								value="<%=rs.getString("name")%>">
						</td>
					</tr>
					<tr>
						<td>
							身份证号
						</td>
						<td>
							<input type="text" name="id"
								value="<%=rs.getString("id")%>">
						</td>
					</tr>
					<tr>
						<td>
							密码
						</td>
						<td>
							<input type="text" name="pwd"
								value="<%=rs.getString("pwd")%>">
						</td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<input name="submit" type="submit" value="提 交">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="clear" type="reset" value="取  消">
						</td>
					</tr>
					<%
						rs.close();
					%>
				</table>
			</form>
		</center>
	</body>
</html>
