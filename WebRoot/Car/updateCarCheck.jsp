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
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：车辆管理>修改车辆信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
		<center>

			<br>
			<br>
			<br>
			<h3>
				&nbsp;&nbsp;修改车辆信息
			</h3>
			<form action="../servlet/userServlet?action=updateCarCheck" method="post">
				<table border="0" width="200">
					<%
					ResultSet rs=(ResultSet)request.getAttribute("rs");
						rs.beforeFirst(); //移至第一条记录之前
						rs.next();
					%>
					<tr>
						<td>
							车辆编号
						</td>
						<td>
							<input type="text" name="code"
								value="<%=rs.getString("code")%>">
						</td>
					</tr>
					<tr>
						<td>
							车辆类型
						</td>
						<td>
							<input type="text" name="type"
								value="<%=rs.getString("type")%>">
						</td>
					</tr>
					<tr>
						<td>
							品牌型号
						</td>
						<td>
							<input type="text" name="brand"
								value="<%=rs.getString("brand")%>">
						</td>
					</tr>
					<tr>
						<td>
							车牌号码
						</td>
						<td>
							<input type="text" name="num"
								value="<%=rs.getString("num")%>">
						</td>
					</tr>
					<tr>
						<td>
							租赁价格
						</td>
						<td>
							<input type="text" name="price"
								value="<%=rs.getString("price")%>">
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
