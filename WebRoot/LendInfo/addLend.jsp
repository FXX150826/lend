

<%@page contentType="text/html" pageEncoding="UTF-8" import="JDBC.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>租赁信息添加</title>
    </head>
    <body bgcolor="CCCFFF">
     <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：租赁信息>添加租赁信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
        <center>
            <br><br><br>
            <h3>&nbsp;&nbsp;添加租赁信息</h3>
            <form action= "../servlet/userServlet?action=addLend"  method="post">
                <table border="0" width="200">
                    <tr>
                        <td>租赁编号</td>
                        <td><input type="text" name="lendCode"></td>
                    </tr>
                    <tr>
                        <td>车辆编号</td>
                        <td><input type="text" name="carLend"></td>
                    </tr>
                    <tr>
                        <td>用户编号</td>
                        <td><input type="text" name="userCode"></td>
                    </tr>
                    <tr>
                        <td>租赁日期</td>
                        <td><input type="text" name="lendTime" ></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input name="submit" type="submit" value="添 加">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="clear" type="reset" value="取  消">
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </body>
</html>
