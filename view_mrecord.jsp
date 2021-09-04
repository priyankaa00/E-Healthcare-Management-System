<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Medical Record </title>
        <link rel="stylesheet" href="cssdis.css" >
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Patient Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="patient_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
    </body>
</html>
<%
    try {
        if (request.getParameter("view") != null) {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement();
            String pid = request.getParameter("patientid");
            ResultSet rs = stmt.executeQuery("select * from Medical_Record where p_id like ('" + pid + "')");
            out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center><font size=4>");
            out.print("<table bgcolor='red' width='60%' border='1'>");
            out.print("<thead>");
            out.print("<tr>");
            out.print("<th colspan='5' bgcolor='green'>" + "Medical Record" + "</th>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<th>"+ "Patient_ID" + "</th><th>" + "Disease" + "</th><th>" + "Medicines Prescribed" + "</th><th>" + "Date" + "</th><th>" + "Doctor Name" + "</th>");
                out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody bgcolor='deepskyblue'>");
            while (rs.next()) {

                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getDate(4) + "</td><td>" + rs.getString(5)
                        + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
            out.print("</table");
            out.print("</center></body></html>");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>