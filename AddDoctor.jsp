<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DOCTOR INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="addDoctorstyle.css" rel="stylesheet">
    </head>
    <body>
        <div class="bgimage">
        <div class="button1">
                <button class="btn1 home">Home</button>
                <button class="btn1 back">Back</button>
        </div>
        <div class="doct_info">
            <h1>Doctor Information</h1>
        </div>
        <div class="main">
        <form action=# method="POST">
            
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="did">
            
            <h2 class="name">First Name</h2>
            <input class="fname" type="text" name="dfname">
            
            <h2 class="name">Middle Name</h2>
            <input class="mname" type="text" name="dmname">
            
            <h2 class="name">Last Name</h2>
            <input class="lname" type="text" name="dlname">
            
            <h2 class="name">Department&nbsp;Id</h2>
            <input class="dept" type="text" name="depmt">
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="demail">
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="dphno">
            
            <h2 class="name">Hospital&nbsp;Room&nbsp;No.</h2>
            <input class="hno" type="text" name="dhno">
            
            <div class="button">
                <input type="submit" class="btn submit" name="b1" value="Add">
                <input type="reset" class="btn clear" value="Clear">
            </div>
           </form>
         </div>   
         </div>
    </body>
</html>


<%
    try 
    {
        if (request.getParameter("b1")!= null) 
        {
            String d_id = request.getParameter("did");
            String d_firstname = request.getParameter("dfname");
            String d_middlename = request.getParameter("dmname");
            String d_lastname = request.getParameter("dlname");
            String d_dept = request.getParameter("depmt");
            String d_phno = request.getParameter("dphno");
            String d_email = request.getParameter("demail");
            String hospital_roomno = request.getParameter("dhno");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            PreparedStatement pst = conn.prepareStatement("insert into doctor_information values(?,?,?,?,?,?,?,?)");
            pst.setString(1, d_id);
            pst.setString(2, d_firstname);
            pst.setString(3, d_middlename);
            pst.setString(4, d_lastname);
            pst.setString(5, d_dept);
            pst.setString(6, d_phno);
            pst.setString(7, d_email);
            pst.setString(8, hospital_roomno);
            int x = pst.executeUpdate();
            if (x > 0) 
            {
                out.print("<script>alert('Added successfully.')</script>");
            }
        }
    } 
    catch(Exception ex) 
    {
        ex.printStackTrace();
    }
%>
