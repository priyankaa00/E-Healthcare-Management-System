<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Patient Record </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style3.css" type="text/css" rel="stylesheet">
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
                        <li class="rmi"><a href="doctor_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <%
    try {
        if (request.getParameter("btnView") != null) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement();  
            String pid = request.getParameter("pid");
            ResultSet rs = stmt.executeQuery("select * from Medical_Record where p_id like ('" + pid + "')");    
            out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center>");
            out.print("<table bgcolor='black' width='80%' border='1'>");
            out.print("<thead>");
            out.print("<tbody bgcolor='blue'>");
            out.print("<tr>");
            out.print("<th colspan='5'>" + "Medical History" + "</th>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<td>"+ "Patient ID" + "</td><td>" + "Disease" + "</td><td>" + "Medicines Prescribed"
                        + "</td><td>" + "Date" + "</td><td>" + "Doctor Name" + "</td>");
             
                out.print("</tr>");
            out.print("</thead>");
              
            
            while (rs.next()) {

                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
                        + "</td><td>" + rs.getDate(4) + "</td><td>" + rs.getString(5) + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
            
            Statement stm = conn.createStatement();  
//        ResultSet rse = stm.executeQuery("select p_id, d_firstname, date, disease, medicines from prescription join disease using(p_id, d_id) "
//                + "join medicine using(p_id, d_id) join doctor_information using(d_id)");
        ResultSet rse = stm.executeQuery("select p_id, d_firstname, date, disease, medicines from prescription join disease using(p_id, d_id) "
                + "join medicine using(p_id, d_id) join doctor_information using(d_id) where p_id='"+pid+"'");
        out.print("<tbody bgcolor='green'>");
            out.print("<tr>");
            out.print("<th colspan='5'>" + "Prescription" + "</th>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<td>"+ "Patient_ID" + "</td><td>" + "Doctor_name" + "</td><td>" + "Date"
                        + "</td><td>" + "Disease" + "</td><td>" + "Medicines" + "</td>");
                out.print("</tr>");
            
            while (rse.next()) {

                out.print("<tr>");
                out.print("<td>" + rse.getString(1) + "</td><td>" + rse.getString(2) + "</td><td>" + rse.getString(3) 
                        + "</td><td>" + rse.getString(4) + "</td><td>" + rse.getString(5));
                out.print("</tr>");

            }
            out.print("</tbody>");
            out.print("</table");
            out.print("</center></body></html>");
            }
    }
    catch (Exception ex) {
        ex.printStackTrace();
    }
%>

    </body>
</html>
