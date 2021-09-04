<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Appointments </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style7.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Doctor Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="doctor_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <div> 
            <div class="form-container">
            <h1> Online Appointment </h1>
            <form action="viewonapp.jsp" method="POST" onclick="return validate()">
                <div class="control">
                    <label for="name"> Doctor ID </label>
<!--                <input type="text" name="did" id="did" required><span id="error"></span>-->
                    <input type="text" name="did" id="did" value=<%=request.getParameter("id")%> required><span id="error"></span>

                </div>
                
                <div class="control">
                    <label for="app"> Date </label>
                    <input type="date" name="appointment" required>
                </div>
                
                <div class="control">
                    <input type="submit" value="View" name="btnView">
                </div>
            </form>
        </div>
        
        </div>
        <script>
            function validate()
            {
                var d=document.getElementById('did').value;
                var dregx=/[D]/;
                var dres=dregx.test(d);
                if(dres === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Doctor Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
		}
       </script>
    </body>-
</html>
