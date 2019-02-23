

<%@page contentType="text/html" pageEncoding="UTF-8" import="JDBC.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>车辆信息添加</title>
    </head>
    <body bgcolor="CCCFFF">
    <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：车辆管理>添加车辆信息&gt;&gt;&gt;&nbsp;</td>
      </tr>
        <center>
            <br><br><br>
            <h3>&nbsp;&nbsp;添加车辆信息</h3>
            <form action= "../servlet/userServlet?action=addCar"  method="post">
                <table border="0" width="200">
                    <tr>
                        <td>车辆编号</td>
                        <td><input type="text" name="code"></td>
                    </tr>
                    <tr>
                        <td>车辆类别</td>
                        <td><input type="text" name="type"></td>
                    </tr>
                    <tr>
                        <td>品牌型号</td>
                        <td><input type="text" name="brand"></td>
                    </tr>
                    <tr>
                        <td>车牌号码</td>
                        <td><input type="text" name="num" ></td>
                    </tr>
                    <tr>
                        <td>租赁价格</td>
                        <td><input type="text" name="price"></td>
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
