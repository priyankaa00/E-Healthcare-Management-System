<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DOCTOR INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="doctor_info.css" rel="stylesheet">
    </head>
    <body>
        <div class="bgimage">
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
                        <li class="rmi"><a href="admin_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href=""> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <div class="doct_info">
            <h1>Doctor Information</h1>
        </div>
        <div class="main">
        <form method="POST" onsubmit="return validate()">
            
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="did" id="id1" required><br><span id="e1"></span>
            
            <h2 class="name">First Name</h2>
            <input class="fname" type="text" name="dfname" id="fname1" required>
            <br><span id="e2"></span>

            <h2 class="name">Middle Name</h2>
            <input class="mname" type="text" name="dmname">
            
            <h2 class="name">Last Name</h2>
            <input class="lname" type="text" name="dlname">
            
            <h2 class="name">Department&nbsp;</h2>
            <input class="dept" type="text" name="depmt" id="dept1" required><br><span id="e3"></span>
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="demail" id="email1" required><br><span id="e4"></span>
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="dphno" id="phno1" required><br><span id="e5"></span>
            
            <h2 class="name">Hospital&nbsp;Room&nbsp;No.</h2>
            <input class="hno" type="text" name="dhno" id="hno1" required><br><span id="e6"></span>
            
            <div class="button">
                <input type="submit" class="btn submit" name="b1" value="Update">
                <input type="reset" class="btn clear" value="Clear">
            </div>
           </form>
         </div>   
         </div>
       <script>
         function validate()
         {
            var id = document.getElementById('id1').value;                
            var fname = document.getElementById('fname1').value;
            var dept = document.getElementById('dept1').value;
            var email = document.getElementById('email1').value;
            var phno = document.getElementById('phno1').value; 
            var hno = document.getElementById('hno1').value;          
            
            var idreg = /^[D]/;
            var idregex = idreg.test(id);
            
            var freg = /^[A-Za-z]/;
            var fregex = freg.test(fname);
            
            var dreg = /^[A-Za-z]/;
            var dregex = dreg.test(dept);
            
            var ereg = /^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$/;
            var eregex = ereg.test(email);
            
            var preg = /^[1-9][0-9]{9}$/;
            var pregex = preg.test(phno);
            
            var hreg = /^[0-9]/;
            var hregex = hreg.test(hno);
            
            if(idregex === false)
            {
                document.getElementById('e1').style.color = 'red';
                document.getElementById('e1').innerHTML = "Valid Doctor ID must start with D";
               return false;
            }
            
            if(fregex === false)
            {
                document.getElementById('e2').style.color = 'red';
                document.getElementById('e2').innerHTML = "First Name can only contain alphabets";
                return false;
            }
            
            if(dregex === false)
            {
                document.getElementById('e3').style.color = 'red';
                document.getElementById('e3').innerHTML = "Department Id can contain alphabets and then numbers";
                return false;
            }
               
            if(eregex === false)
            {
                document.getElementById('e4').style.color = 'red';
                document.getElementById('e4').innerHTML = "Please enter valid email id";
                return false;
            }
           
            if(pregex === false)
            {
                document.getElementById('e5').style.color = 'red';
                document.getElementById('e5').innerHTML = "Phone No. can only be of 10 numbers";
                return false;
            }
           
            if(hregex === false)
            {
                document.getElementById('e6').style.color = 'red';
                document.getElementById('e6').innerHTML = "House No. can only contain numbers";
                return false;
            }
            
            else
            {
                document.getElementById('e1').style.color = none;
                document.getElementById('e1').innerHTML = "";
                document.getElementById('e2').style.color = none;
                document.getElementById('e2').innerHTML = "";
                document.getElementById('e3').style.color = none;
                document.getElementById('e3').innerHTML = "";
                document.getElementById('e4').style.color = none;
                document.getElementById('e4').innerHTML = "";
                document.getElementById('e5').style.color = none;
                document.getElementById('e5').innerHTML = "";
                document.getElementById('e6').style.color = none;
                document.getElementById('e6').innerHTML = ""; 
            }
        }
      </script>
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
            PreparedStatement pst = conn.prepareStatement("update doctor_information set d_id=?,d_firstname=?,d_middlename=?,d_lastname=?,d_dept=?,d_phno=?,d_email=?,hospital_roomno=? where d_id like ('"+d_id+"')");
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
                out.print("<script>alert('Updated successfully.')</script>");
            }
        }
    } 
    catch(Exception ex) 
    {
        ex.printStackTrace();
    }
%>



