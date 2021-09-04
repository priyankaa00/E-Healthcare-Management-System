<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="disp_css.css" >
        <title> View Department </title>
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Admin Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="admin_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
    </body>
</html>
<%
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from Department");
        out.print("<html><body bgcolor='beige'></br></br></br><center><h1>DEPARTMENTS</h1></br></br>");
        out.print("<table bgcolor='green' width='60%' border='.2'>");
        out.print("<tr bgcolor='red'><td >DEPARTMENT ID</td><td>DEPARTMENT NAME</td>");
        while (rs.next()) {

            out.print("<tr bgcolor='deepskyblue'>");
            out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td>");
            out.print("</tr>");

        }
        out.print("</table");
        out.print("</center></body></html>");
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
