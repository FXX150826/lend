
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="JDBC.*"%>
<%@page import="com.action.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>车辆信息删除</title>
    </head>
   <body bgcolor="CCCFFF">
<tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：车辆管理>删除车辆信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
        <center>
            <br><br><br>
            <br><br><br>
            <h2>删除车辆信息</h2><br>
            <form  action="../servlet/userServlet?action=deleteCar" method="post">
                <p>请选择要删除车辆编号:
                    <select name="code">
             		<%
                            ResultSet rs = DBGet.lookCar();
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
                    <input type="submit"  name="submit" value="删 除">&nbsp;
                    <input  type="button"  value="返回" onClick="javascript:history.go(-1)">
                </p>
            </form>
        </center>
    </body>
</html>

