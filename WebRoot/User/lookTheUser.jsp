

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="JDBC.*"%>
<%@page import="com.action.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人中心</title>
    </head>
    <body bgcolor="CCCFFF">
    <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：个人中心>查看个人信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
    <%request.setCharacterEncoding("gb2312");
		User user = (User)session.getAttribute("user");
		//验证用户是否登录
		if (user == null || "".equals(user)) {
			response.sendRedirect("login.jsp");
		}
	%>
    <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：个人中心 &gt;&gt;&gt;&nbsp;</td>
      </tr>
        <center>
            <br> <br> <br> <br> <br>

           人
           <table border="2" bgcolor= "CCCEEE" width="600">
                <tr bgcolor="CCCCCC" align="center">
                    <th>用户编号</th>
                    <th>用户姓名</th>
                    <th>身份证号</th>
                    <th>密码</th>
                    <th>修改</th>
                </tr>
                <tr align="center">
                    <td><%=user.getCode()%> </td>
                    <td><%=user.getName()%> </td>
                    <td><%=user.getId()%> </td>
                    <td><%=user.getPwd()%> </td>
                    <td align="center">
	<%if(user!=null){ %><a href="updateTheUser.jsp">修改</a><%}else{%>&nbsp;<%}%></td>
                    
                </tr>
            </table>
        </center>
    </body>
</html>

