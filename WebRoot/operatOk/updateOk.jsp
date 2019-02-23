

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>数据处理页面</title>
    </head>
    <body bgcolor="CCCFFF">
            <%--
           		String id=(String)session.getAttribute("id");
           		//byte b0[]=id.getBytes("ISO-8859-1");
                //id=new String(b0,"UTF-8");
                String sql0="DELETE FROM stu WHERE stuId='"+id+"'";
                
                String studentNumber=request.getParameter("stuId");
                //byte b[]=studentNumber.getBytes("ISO-8859-1");
                //studentNumber=new String(b,"UTF-8");
                String studentName=request.getParameter("stuName");
                //byte b1[]=studentName.getBytes("ISO-8859-1");
                //studentName=new String(b1,"UTF-8");
                String studentSex=request.getParameter("stuSex");
                //byte b2[]=studentSex.getBytes("ISO-8859-1");
                //studentSex=new String(b2,"UTF-8");
                String studentAge=request.getParameter("stuAge");
                //byte b3[]=studentAge.getBytes("ISO-8859-1");
                //studentAge=new String(b3,"UTF-8");
                String studentWeight=request.getParameter("stuWeight");
                //byte b4[]=studentWeight.getBytes("ISO-8859-1");
                //studentWeight=new String(b4,"UTF-8");
                
                Connection conn=DBGet.getConnection();
                Statement stmt=conn.createStatement();
                //stmt.executeUpdate(sql0);
                //String sql="insert into stu values('"+studentNumber+"','"+studentName+"','"+studentSex+"','"+studentAge+"','"+studentWeight+"')";
                String sql="UPDATE stu SET stuId='"+studentNumber+"',stuName='"+studentName+"',stuSex='"+studentSex+"',stuAge='"+studentAge+"',stuWeight='"+studentWeight+"'WHERE stuId='"+id+"'";
                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                session.invalidate();
            --%>
        <center>
            <h2 >修改信息</h2>
            <p>
                <br>
                新的数据已经添加到数据库中!
            </p>
        </center>
    </body>
</html>
