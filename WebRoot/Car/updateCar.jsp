<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="JDBC.*"%>
<%@page import="com.action.*" %>
<!DOCTYPE html>
<html>
  <head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>车辆信息修改</title>
  </head>
 <body bgcolor="CCCFFF">
 <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：车辆管理>修改车辆信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
        <center>
            <br><br><br>
            <br><br><br>
            <h2>修改用户信息</h2><br>
            <form  action="../servlet/userServlet?action=updateCar" method="post">
                <p>请选择要修改车辆的编号:
                    <select name="code">
             		<%
                            ResultSet rs =DBGet.lookCar();
                            while(rs.next()){
                     		String SNo=rs.getString("code");
              		%>
              		<option value="<%=SNo%>"><%=SNo%></option>
              		<%
                            }
                        %>
                    </select>
                </p>
                 <p>
                    <input type="submit"  value="修 改">&nbsp;
                    <input  type="button"  value="返回" onClick="javascript:history.go(-1)">
                </p>
            </form>
        </center>
    </body>
</html>
