<%--<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="student_info.css" rel="stylesheet">
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
        <div class="student_info">
            <h1>Student Information</h1>
        </div>
        <div class="main">
        <form method="POST" onsubmit="return validate()">
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="id" id="id1" required><br><span id="e1"></span>
            
            <div id="name">
                <h2 class="name">Name</h2>
                <input class="fname" type="text" name="fname" placeholder="First Name" id="fname1" required>
                <input class="mname" type="text" name="mname" placeholder="Middle Name">
                <input class="lname" type="text" name="lname" placeholder="Last Name">
            </div> 
            
            <h2 class="name">Age</h2>
            <input class="age" type="number" name="age" required>
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="email" id="email1" required><br><span id="e3"></span>
            
            <div id="name">
                <h2 class="name">Father's&nbsp;Name</h2>
                <input class="fname" type="text" name="ffname" placeholder="First Name" id="ffname1" required><br><span id="e4"></span>
                <input class="mname" type="text" name="fmname" placeholder="Middle Name">
                <input class="lname" type="text" name="flname" placeholder="Last Name">
            </div> 
            
            <h2 class="name">Hostel Name</h2>
            <input class="hname" type="text" name="hname" id="hname1" required><br><span id="e5"></span>
            
            <h2 class="name">Hostel&nbsp;Room&nbsp;No.</h2>
            <input class="hrno" type="number" name="hrno" required>
            
            <h2 class="name">Course</h2>
            <input class="course" type="text" name="course" id="course1" required><br><span id="e6"></span>
            
            <h2 class="name">Current Year</h2>
            <input class="year" type="number" name="year" required>
            
            <h2 class="name">House No.</h2>
            <input class="hno" type="text" name="hno" id="hno1" required>
            
            <h2 class="name">Area</h2>
            <input class="area" type="text" name="area" required>
            
            <h2 class="name">District</h2>
            <input class="district" type="text" name="district" required>
            
            <h2 class="name">City</h2>
            <input class="city" type="text" name="city" required>
            
            <h2 class="name">State</h2>
            <input class="state" type="text" name="state" required>
            
            <h2 class="name">Zipcode</h2>
            <input class="zipcode" type="text" name="zipcode" id="zipcode1" required><br><span id="e8"></span>
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="phno" id="phno1" required><br><span id="e9"></span>
            
            <h2 class="name">Parent&nbsp;Phone&nbsp;No.</h2>
            <input class="pphno" type="text" name="pphno" id="pphno1" required><br><span id="e10"></span>
            
            <div class="button">
                <button class="btn submit" name="b1">Submit</button>
                <button class="btn clear" >Clear</button>
            </div>
            
           </form>
          </div>  
         </div> 
        <script>
        function validate()
        {
            var id = document.getElementById('id1').value;                
            var fname = document.getElementById('fname1').value;
            var ffname = document.getElementById('ffname1').value;
            var email = document.getElementById('email1').value;
            var hname = document.getElementById('hname1').value; 
            var course = document.getElementById('course1').value;
            var zipcode = document.getElementById('zipcode1').value;             
            var phno = document.getElementById('phno1').value;
            var pphno = document.getElementById('pphno1').value;          
            
            var idreg = /^[S]/;
            var idregex = idreg.test(id);
            if(idregex === false)
            {
                document.getElementById('e1').style.color = 'red';
                document.getElementById('e1').innerHTML = "Valid Student ID must start with S";
               return false;
            }
               
            var freg = /^[A-Za-z]/;
            var fregex = freg.test(fname);
            if(fregex === false)
            {
                document.getElementById('e2').style.color = 'red';
                document.getElementById('e2').innerHTML = "First Name can only contain alphabets";
                return false;
            }
               
            var ereg = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            var eregex = ereg.test(email);
            if(eregex === false)
            {
                document.getElementById('e3').style.color = 'red';
                document.getElementById('e3').innerHTML = "Please enter valid email id";
                return false;
            }
            
            var ffreg = /^[A-Za-z]/;
            var ffregex = ffreg.test(ffname);
            if(ffregex === false)
            {
                document.getElementById('e4').style.color = 'red';
                document.getElementById('e4').innerHTML = "First Name can only contain alphabets";
                return false;
            }
            
            var hfreg = /^[A-Za-z]/;
            var hfregex = hfreg.test(hname);
            if(hfregex === false)
            {
                document.getElementById('e5').style.color = 'red';
                document.getElementById('e5').innerHTML = "Hostel Name can only contain alphabets";
                return false;
            }
            
            var cfreg = /^[A-Za-z]/;
            var cfregex = cfreg.test(course);
            if(cfregex === false)
            {
                document.getElementById('e6').style.color = 'red';
                document.getElementById('e6').innerHTML = "Course name can only contain alphabets";
                return false;
            }
            
            var zreg = /^[0-9]{6}$/;
            var zregex = zreg.test(zipcode);
            if(zregex === false)
            {
                document.getElementById('e8').style.color = 'red';
                document.getElementById('e8').innerHTML = "Zipcode can only be of 6 numbers";
                return false;
            }
                
            var preg = /^[1-9][0-9]{9}$/;
            var pregex = preg.test(phno);
            if(pregex === false)
            {
                document.getElementById('e9').style.color = 'red';
                document.getElementById('e9').innerHTML = "Phone No. can only be of 10 numbers";
                return false;
            }
            
            var ppreg = /^[1-9][0-9]{9}$/;
            var ppregex = ppreg.test(pphno);
            if(ppregex === false)
            {
                document.getElementById('e10').style.color = 'red';
                document.getElementById('e10').innerHTML = "Phone No. can only be of 10 numbers";
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
                    document.getElementById('e8').style.color = none;
                    document.getElementById('e8').innerHTML = "";
                    document.getElementById('e9').style.color = none;
                    document.getElementById('e9').innerHTML = "";
                    document.getElementById('e10').style.color = none;
                    document.getElementById('e10').innerHTML = "";
                   
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
            String S_ID = request.getParameter("id");
            String S_FIRSTNAME = request.getParameter("fname");
            String S_MIDDLENAME = request.getParameter("mname");
            String S_LASTNAME = request.getParameter("lname");
            int S_AGE=Integer.parseInt(request.getParameter("age"));
            String S_EMAIL = request.getParameter("email");
            String FATHER_FIRSTNAME = request.getParameter("ffname");
            String FATHER_MIDDLENAME = request.getParameter("fmname");
            String FATHER_LASTNAME = request.getParameter("flname");
            String HOSTEL_NAME = request.getParameter("hname");
            int ROOM_NO=Integer.parseInt(request.getParameter("hrno"));
            String COURSE= request.getParameter("course");
            int CURRENT_YEAR=Integer.parseInt(request.getParameter("year"));
            String HOUSE_NO= request.getParameter("hno");
            String AREA= request.getParameter("area");
            String DISTRICT= request.getParameter("district");
            String CITY= request.getParameter("city");
            String STATE= request.getParameter("state");
            String ZIPCODE= request.getParameter("zipcode");
            String S_PHNO = request.getParameter("phno");
            String S_PARENTPHNO = request.getParameter("pphno");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            PreparedStatement pst = conn.prepareStatement("insert into STUDENT_INFORMATION values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setString(1, S_ID);
            pst.setString(2, S_FIRSTNAME);
            pst.setString(3, S_MIDDLENAME);
            pst.setString(4, S_LASTNAME);
            pst.setInt(5, S_AGE);
            pst.setString(6, S_EMAIL);
            pst.setString(7, FATHER_FIRSTNAME);
            pst.setString(8, FATHER_MIDDLENAME);
            pst.setString(9, FATHER_LASTNAME);
            pst.setString(10, HOSTEL_NAME);
            pst.setInt(11, ROOM_NO);
            pst.setString(12, COURSE);
            pst.setInt(13, CURRENT_YEAR);
            pst.setString(14, HOUSE_NO);
            pst.setString(15, AREA);
            pst.setString(16, DISTRICT);
            pst.setString(17, CITY);
            pst.setString(18, STATE);
            pst.setString(19, ZIPCODE);
            pst.setString(20, S_PHNO);
            pst.setString(21, S_PARENTPHNO);
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
%>--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="student_info.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="bgimage">
<!--        <div class="button1">
                <button class="btn1 home">Home</button>
                <button class="btn1 back">Back</button>
        </div>-->
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
        <div class="student_info">
            <h1>Student Information</h1>
        </div>
        <div class="main">
            <form method="POST" onsubmit="return validate()">
            <h2 class="name">Id</h2>
            <input class="id" type="text" name="id" id="id1" required><br><span id="e1"></span>
            
            <div id="name">
                <h2 class="name">Name</h2>
                <input class="fname" type="text" name="fname" placeholder="First Name" id="fname1" required>
                <input class="mname" type="text" name="mname" placeholder="Middle Name">
                <input class="lname" type="text" name="lname" placeholder="Last Name">
                <br><span id="e2"></span>
            </div> 
            
            <h2 class="name">Age</h2>
            <input class="age" type="number" name="age" required>
            
            <h2 class="name">Email</h2>
            <input class="email" type="text" name="email" id="email1" required><br><span id="e3"></span>

            
            <div id="name">
                <h2 class="name">Father's&nbsp;Name</h2>
                <input class="fname" type="text" name="ffname" placeholder="First Name" id="ffname1" required<br><span id="e4"></span>
                <input class="mname" type="text" name="fmname" placeholder="Middle Name">
                <input class="lname" type="text" name="flname" placeholder="Last Name">
            </div> 
            
            <h2 class="name">Hostel Name</h2>
            <input class="hname" type="text" name="hname" id="hname1" required><br><span id="e5"></span>
            
            <h2 class="name">Hostel&nbsp;Room&nbsp;No.</h2>
            <input class="hrno" type="number" name="hrno" required>
            
            <h2 class="name">Course</h2>
            <input class="course" type="text" name="course" id="course1" required><br><span id="e6"></span>
            
            <h2 class="name">Current Year</h2>
            <input class="year" type="number" name="year" required>
            
            <h2 class="name">House No.</h2>
            <input class="hno" type="text" name="hno" id="hno1" required>
            
            <h2 class="name">Area</h2>
            <input class="area" type="text" name="area" required>
            
            <h2 class="name">District</h2>
            <input class="district" type="text" name="district" required>
            
            <h2 class="name">City</h2>
            <input class="city" type="text" name="city" required>
            
            <h2 class="name">State</h2>
            <input class="state" type="text" name="state" required>
            
            <h2 class="name">Zipcode</h2>
            <input class="zipcode" type="text" name="zipcode" id="zipcode1" required><br><span id="e8"></span>
            
            <h2 class="name">Phone No.</h2>
            <input class="phno" type="text" name="phno" id="phno1" required><br><span id="e9"></span>
            
            <h2 class="name">Parent&nbsp;Phone&nbsp;No.</h2>
            <input class="pphno" type="text" name="pphno" id="pphno1" required><br><span id="e10"></span>
            
            <div class="button">
                <button class="btn submit" name="b1">Submit</button>
                <button class="btn clear" type="clear">Clear</button>
            </div>
            
           </form>
          </div>  
         </div> 
        
        <script>
        function validate()
        {
            var id = document.getElementById('id1').value;                
            var fname = document.getElementById('fname1').value;
            var ffname = document.getElementById('ffname1').value;
            var email = document.getElementById('email1').value;
            var hname = document.getElementById('hname1').value; 
            var course = document.getElementById('course1').value;
            var zipcode = document.getElementById('zipcode1').value;             
            var phno = document.getElementById('phno1').value;
            var pphno = document.getElementById('pphno1').value;          
            
            var idreg = /^[S]/;
            var idregex = idreg.test(id);
            if(idregex === false)
            {
                document.getElementById('e1').style.color = 'red';
                document.getElementById('e1').innerHTML = "Valid Student ID must start with S";
               return false;
            }
               
            var freg = /^[A-Za-z]/;
            var fregex = freg.test(fname);
            if(fregex === false)
            {
                document.getElementById('e2').style.color = 'red';
                document.getElementById('e2').innerHTML = "First Name can only contain alphabets";
                return false;
            }
               
            var ereg = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            var eregex = ereg.test(email);
            if(eregex === false)
            {
                document.getElementById('e3').style.color = 'red';
                document.getElementById('e3').innerHTML = "Please enter valid email id";
                return false;
            }
            
            var ffreg = /^[A-Za-z]/;
            var ffregex = ffreg.test(ffname);
            if(ffregex === false)
            {
                document.getElementById('e4').style.color = 'red';
                document.getElementById('e4').innerHTML = "First Name can only contain alphabets";
                return false;
            }
            
            var hfreg = /^[A-Za-z]/;
            var hfregex = hfreg.test(hname);
            if(hfregex === false)
            {
                document.getElementById('e5').style.color = 'red';
                document.getElementById('e5').innerHTML = "Hostel Name can only contain alphabets";
                return false;
            }
            
            var cfreg = /^[A-Za-z]/;
            var cfregex = cfreg.test(course);
            if(cfregex === false)
            {
                document.getElementById('e6').style.color = 'red';
                document.getElementById('e6').innerHTML = "Course name can only contain alphabets";
                return false;
            }
            
            var zreg = /^[0-9]{6}$/;
            var zregex = zreg.test(zipcode);
            if(zregex === false)
            {
                document.getElementById('e8').style.color = 'red';
                document.getElementById('e8').innerHTML = "Zipcode can only be of 6 numbers";
                return false;
            }
                
            var preg = /^[1-9][0-9]{9}$/;
            var pregex = preg.test(phno);
            if(pregex === false)
            {
                document.getElementById('e9').style.color = 'red';
                document.getElementById('e9').innerHTML = "Phone No. can only be of 10 numbers";
                return false;
            }
            
            var ppreg = /^[1-9][0-9]{9}$/;
            var ppregex = ppreg.test(pphno);
            if(ppregex === false)
            {
                document.getElementById('e10').style.color = 'red';
                document.getElementById('e10').innerHTML = "Phone No. can only be of 10 numbers";
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
                    document.getElementById('e8').style.color = none;
                    document.getElementById('e8').innerHTML = "";
                    document.getElementById('e9').style.color = none;
                    document.getElementById('e9').innerHTML = "";
                    document.getElementById('e10').style.color = none;
                    document.getElementById('e10').innerHTML = "";
                   
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
            String S_ID = request.getParameter("id");
            String S_FIRSTNAME = request.getParameter("fname");
            String S_MIDDLENAME = request.getParameter("mname");
            String S_LASTNAME = request.getParameter("lname");
            int S_AGE=Integer.parseInt(request.getParameter("age"));
            String S_EMAIL = request.getParameter("email");
            String FATHER_FIRSTNAME = request.getParameter("ffname");
            String FATHER_MIDDLENAME = request.getParameter("fmname");
            String FATHER_LASTNAME = request.getParameter("flname");
            String HOSTEL_NAME = request.getParameter("hname");
            int ROOM_NO=Integer.parseInt(request.getParameter("hrno"));
            String COURSE= request.getParameter("course");
            int CURRENT_YEAR=Integer.parseInt(request.getParameter("year"));
            String HOUSE_NO= request.getParameter("hno");
            String AREA= request.getParameter("area");
            String DISTRICT= request.getParameter("district");
            String CITY= request.getParameter("city");
            String STATE= request.getParameter("state");
            String ZIPCODE= request.getParameter("zipcode");
            String S_PHNO = request.getParameter("phno");
            String S_PARENTPHNO = request.getParameter("pphno");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            PreparedStatement pst = conn.prepareStatement("insert into STUDENT_INFORMATION values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setString(1, S_ID);
            pst.setString(2, S_FIRSTNAME);
            pst.setString(3, S_MIDDLENAME);
            pst.setString(4, S_LASTNAME);
            pst.setInt(5, S_AGE);
            pst.setString(6, S_EMAIL);
            pst.setString(7, FATHER_FIRSTNAME);
            pst.setString(8, FATHER_MIDDLENAME);
            pst.setString(9, FATHER_LASTNAME);
            pst.setString(10, HOSTEL_NAME);
            pst.setInt(11, ROOM_NO);
            pst.setString(12, COURSE);
            pst.setInt(13, CURRENT_YEAR);
            pst.setString(14, HOUSE_NO);
            pst.setString(15, AREA);
            pst.setString(16, DISTRICT);
            pst.setString(17, CITY);
            pst.setString(18, STATE);
            pst.setString(19, ZIPCODE);
            pst.setString(20, S_PHNO);
            pst.setString(21, S_PARENTPHNO);
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