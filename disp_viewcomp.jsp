<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="disp_css.css" >
        <title> View Complaint </title>
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
        ResultSet rs = stmt.executeQuery("select * from complaint");
        out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center><font size=4>");
            out.print("<table bgcolor='red' width='60%' border='1'>");
            out.print("<thead>");
            out.print("<tr>");
            out.print("<th colspan='3' bgcolor='green'>" + "Complaints" + "</th>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<th>"+ "Complaint_ID" + "</th><th>" + "Patient_ID" + "</th><th>" + "Complaint"
                        + "</th>");
                out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody bgcolor='deepskyblue'>");
        while (rs.next()) {

            out.print("<tr>");
            out.print("<td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td>");
            out.print("</tr>");

        }
        out.print("</tbody>");
        out.print("</table");
        out.print("</center></body></html>");
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>