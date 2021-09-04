<%-- 
    Document   : addemployee
    Created on : 15 Mar, 2021, 1:47:28 AM
    Author     : HP
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EMPLOYEE INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="addemployeestyle.css" rel="stylesheet">
    </head>
    <body>
        <div class="bgimage">
        <div class="button1">
                <button class="btn1 home">Home</button>
                <button class="btn1 back">Back</button>
        </div>
        <div class="emp_info">
            <h1>Employee Information</h1>
        </div>
        <div class="main">
        <form method="post">
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="eid">
            
            <div id="name">
                <h2 class="name">Name</h2>
                <input class="fname" type="text" name="fname" placeholder="First Name">
                <input class="mname" type="text" name="mname" placeholder="Middle Name">
                <input class="lname" type="text" name="lname" placeholder="Last Name">
            </div> 
            
            <h2 class="name">Age</h2>
            <input class="age" type="number" name="eage">
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="eemail">
            
            <h2 class="name">Department</h2>
            <input class="dept" type="text" name="edept">

            <h2 class="name">Block No.</h2>
            <input class="bno" type="number" name="ebno">
            
            <h2 class="name">House No.</h2>
            <input class="hno" type="number" name="ehno">
            
            <h2 class="name">Area</h2>
            <input class="area" type="text" name="earea">
            
            <h2 class="name">District</h2>
            <input class="district" type="text" name="edistrict">
            
            <h2 class="name">City</h2>
            <input class="city" type="text" name="ecity">
            
            <h2 class="name">State</h2>
            <input class="state" type="text" name="estate">
            
            <h2 class="name">Zipcode</h2>
            <input class="zipcode" type="number" name="ezipcode">
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="ephno">
            
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
        if(request.getParameter("b1") != null)
        {
            String e_id = request.getParameter("eid");
            int e_age = Integer.parseInt(request.getParameter("eage"));
            String e_firstname = request.getParameter("fname");
            String e_middlename = request.getParameter("mname");
            String e_lastname = request.getParameter("lname");
            String e_email = request.getParameter("eemail");
            String department = request.getParameter("edept");
            int block_no = Integer.parseInt(request.getParameter("ebno"));
            String house_no = request.getParameter("ehno");
            String area = request.getParameter("earea");
            String district = request.getParameter("edistrict");
            String city = request.getParameter("ecity");
            String state = request.getParameter("estate");
            String zipcode = request.getParameter("ezipcode");
            String e_phno = request.getParameter("ephno");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ArogyaMandir");
            PreparedStatement pst = conn.prepareStatement("insert into employee_information values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setString(1, e_id);
            pst.setInt(2, e_age);
            pst.setString(3, e_firstname);
            pst.setString(4, e_middlename);
            pst.setString(5, e_lastname);
            pst.setString(6, e_email);
            pst.setString(7, department);
            pst.setInt(8, block_no);
            pst.setString(9, house_no);
            pst.setString(10, area);
            pst.setString(11, district);
            pst.setString(12, city);
            pst.setString(13, state);
            pst.setString(14, zipcode);
            pst.setString(15, e_phno);
            
            int x = pst.executeUpdate();
            if (x > 0) 
            {
                out.print("<script>alert('record inserted successfully.')</script>");
            }
        }
    } 
    catch(Exception ex) 
    {
        ex.printStackTrace();
    }
%>
