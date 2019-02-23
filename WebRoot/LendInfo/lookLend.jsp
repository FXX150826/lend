

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="JDBC.*"%>
<%@page import="com.action.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>租赁信息查询</title>
    </head>
    <body bgcolor="CCCFFF">
     <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：租赁信息>查看租赁信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
        <center>
            <%
                
                //Connection con=DBGet.getConnection();
               // Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
               // String sql="select * from stu";
                ResultSet rs=DBGet.lookLend();
                rs.last(); //移至最后一条记录
                request.setCharacterEncoding("gb2312");
            %>
            <br> <br> <br> <br> <br>
            你要查询的数据表中共有
            <font size="5" color="red">
                <%= rs.getRow()%>
            </font>
           人
           <table border="2" bgcolor= "CCCEEE" width="600">
                <tr bgcolor="CCCCCC" align="center">
                    <th>记录条数</th>
                    <th>租赁编号</th>
                    <th>车辆编号</th>
                    <th>用户编号</th>
                    <th>租赁时间</th>
                    <th>删除</th>
                </tr>
                <%
                    rs.beforeFirst(); //移至第一条记录之前
                    while(rs.next()){
                %>
                <tr align="center">
                    <td><%= rs.getRow()%></td>
                    <td><%=rs.getString("lendCode")%> </td>
                    <td><%=rs.getString("carCode")%> </td>
                    <td><%=rs.getString("userCode")%> </td>
                    <td><%=rs.getString("lendTime")%> </td>
                    <td align="center">
	<%if(rs.getString("lendCode")==null){ %><a href="manager?action=deleteLend&code=<%=rs.getString("lendCode")%>">删除</a><%}else{%>&nbsp;<%}%></td>
                </tr>
                <%
                    }
                    rs.close();
                %>
            </table>
        </center>
    </body>
</html>
