<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="disp_css.css" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Link</title>
    </head>
    <body>
        <%
            try {
                if (request.getParameter("view") != null) {

                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from doctor_information");
                    
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                        out.print("</br>");
                       
                        out.print("<html><head><h1><center>Meeting Link Details</center></h1></head></br><body bgcolor='beige'><center><font size=5>");
                        out.print("<table bgcolor='deepskyblue' width='60%' border=''>");
                        out.print("<tr bgcolor='white'><td>First Name</td><td>Middle Name</td><td>Last Name</td><td>Link</td></tr>");
                        while (rs.next()) 
                        {
                            out.print("<tr>");
                            out.print("<tr><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(9) + "</td></tr>");
                            out.print("</tr>");

                        }
                        out.print("</table");
                        out.print("</font></center></body></html>");
                    
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
