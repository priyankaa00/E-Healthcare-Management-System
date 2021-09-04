<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title> Book Offline Appointment </title>
        <link rel="stylesheet" href="style4.css">

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
        <section>
            <div class="form-container">
                <h1> Offline Appointment</h1>
                <form action="#" onclick="return validate()" method="post">
                    <div class="control">
                        <label for="name">Patient ID</label>
<!--                        <input type="text" name="patientid" id="pid"><span id="error"></span>-->
                        <input type="text" name="patientid" id="id" value=<%=request.getParameter("id")%> required><span id="error"></span>

<!--                        <label for="name">Patient Password</label>
                        <input type="password" id="pass" name="pass1">-->
                    </div>
                    <div class="control">
                        <label for="name">Doctor ID</label>
                        <input type="text" name="department" id="did"><span id="errord"></span>
                    </div>
                    <label> Date:</label>
                    <select name="date">
                        <option value="1">Today</option>
                        <option value="2">Tomorrow</option>
                        <option value="3">Day After Tomorrow</option>
                    </select>
                    <div class="control">
                        <input type="submit" value="Book" name="book">
                    </div>
                </form>
            </div>

        </section>
        <form action="#" >
        <div>
            <input class="show" type="submit" value="Show All Doctors" name="show">
        </div>
        </form>
        <script>
            function validate(){
		var u=document.getElementById('pid').value;
                var d=document.getElementById('did').value;
                var uregx=/[ES]/;
                var dregx=/[D]/;
		var ures=uregx.test(u);
                var dres=dregx.test(d);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Patient Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
                if(dres === false)
		{
			document.getElementById('errord').style.color='red';
                        document.getElementById('errord').innerHTML='Please enter valid Doctor Id';
			return false;
		}
                document.getElementById('errord').style.color='none';
                document.getElementById('errord').innerHTML="";
		return true;
		}
       </script>
    </body>
</html>
<%
    try {

        if (request.getParameter("book") != null) {
            String pid = request.getParameter("patientid");
            String dpt = request.getParameter("department");
            String dp = request.getParameter("date");
//            String pass = request.getParameter("pass1");
            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date());
            if ("3".equals(dp)) {
                cal.add(Calendar.DATE, 2);
            } else if ("2".equals(dp)) {
                cal.add(Calendar.DATE, 1);
            }
            Date timestamp = cal.getTime();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dte = formatter.format(timestamp);
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement(); 
            
//            ResultSet rst1 = stmt.executeQuery("select * from authentication where password like'" + pass +"'");
//            rst1.next();
//            String pid1 = rst1.getString(1);
            
            PreparedStatement pst = conn.prepareStatement("insert into appointment values(?,?,?,?)");
            pst.setString(1, pid);
            pst.setString(2, dpt);
            pst.setString(3, dte);
            pst.setString(4, "offline");
            

            int x = pst.executeUpdate();
            if (x > 0) 
            {
               
                ResultSet rst = stmt.executeQuery("select p_id from transaction_info where p_id like'" + pid +"'");
                if(rst.next()){
                    PreparedStatement pst1 = conn.prepareStatement("update transaction_info set fees=fees+10 where p_id like'" + pid +"'");
                    pst1.executeUpdate();
                }
                else
                {
                    PreparedStatement pst2 = conn.prepareStatement("insert into transaction_info values(?,?)");
                    pst2.setString(1, pid);
                    pst2.setInt(2, 0);
                    pst2.executeUpdate();
                    PreparedStatement pst3 = conn.prepareStatement("update transaction_info set fees=fees+10 where p_id like'" + pid +"'");
                    pst3.executeUpdate();
                }
                
                 out.print("<script>alert('Appointment Booked Successfully.')</script>");
            }
        }
        if(request.getParameter("show") != null){
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement(); 
            ResultSet rs = stmt.executeQuery("select d_id, d_dept from doctor_information");
            out.print("<html><body><center>");
            out.print("<table bgcolor='black' width='60%' border='1'>");
            out.print("<tr>");
                out.print("<th>"+ "Doctor_ID" + "</th><th>" + "Doctor_Department" + "</th>");
            out.print("</tr>");
            while (rs.next()){
                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td>");
                out.print("</tr>");
            }
            out.print("</table");
            out.print("</center></body></html>");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>