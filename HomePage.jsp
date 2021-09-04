<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home page</title>
        <link rel="stylesheet" type="text/css" href="Home_Page.css">
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700%7CPT+Serif:400,700,400italic'
              rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/yourcode.js" ></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="bgimage">
            <div class="menu">
                <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Aarogya Mandir</h2>
<!--                    <a href="covid.html">
                        <div class="button"><i class='fas fa-briefcase-medical' style='font-size:38px;color:red'></i>
                        <span><font color="red">Corona Updates</font></span></div></a>-->
                        <a href="covid.html">    <div class="button" ><i class='fas fa-briefcase-medical' style='font-size:38px;color:red'></i>
                            <span><font color="red">Corona Updates</font></span></div></a>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="login_stud_emp.jsp">PATIENT</a>
                            <!--<ul class="srm">
                                <li><a href="student_login.jsp">STUDENT</a></li>
                                <li><a href="emp_login.jsp">EMPLOYEE</a></li>
                            </ul>-->
                        </li>
                        <li class="rmi"><a href="doctorlogin.jsp">DOCTORS</a></li>
                        <li class="rmi"><a href="#four">ABOUT US</a></li>
                        <li class="rmi"><a href="#cu">CONTACT US</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="login-wrapper">
            <form action="login_admin" method="POST" class="form" onclick="return validate()">
                <h2>ADMIN LOGIN</h2>
                <div class="input-group">
                <input type="text" name="loginuserid" id="loginuserid" class="loginuserid" required>
                <label for="loginuserid">ID</label><span id="error"></span><br>
                </div>
                <br>
                <div class="input-group">
                <input type="password" name="psw" id="psw" class="psw" required>
                <label for="psw">PASSWORD</label><span id="error1"></span><br>
                </div>
                <input type="submit" value="login" name="login" class="submit-btn">
            </form>
        </div>
        <div class="team-area1">
            <h1>OUR  SPECIALITIES</h1>
        </div>
        <div class="team-area">
            <div class="single-team">
                <img src="images\24.jpg" alt="">
                <div class="team-text">
                    <h2>Neurology</h2>
                </div>
            </div>
            <div class="single-team2">
                <img src="images\23.jpg" alt="">
                <div class="team-text">
                    <h2>Gynaecology</h2>
                </div>
            </div>
            <div class="single-team3">
                <img src="images\25.jpg" alt="">
                <div class="team-text">
                    <h2>Opthamalogy</h2>
                </div>
            </div>
            <div class="single-team4">
                <img src="images\26.jpg" alt="">
                <div class="team-text">
                    <h2>Physician</h2>
                </div>
            </div>
            <div class="single-team5">
                <img src="images\27.jpg" alt="">
                <div class="team-text">
                    <h2>Dentist</h2>
                </div>
            </div>
        </div>
       
        <div class="para">
            <p>
                This website has been engineered to make entire clinical operation streamlined, smoother and more efficient. 
                The platform is powering all over Banasthali Vidyapith and has been designed to optimize the entire patient and doctor experience. 
                The scale also helps the platform get updates that are relevant across the institute.
            </p>
        </div>
         <div class="link">
            <p>
                For the convenience of patient, this website also allow online consultancy and our doctor will be available on the specific meet link on the appointment date and time.<b> Please click this icon to know your meet link</b>.
            </p>
            <form action="book_onapp.jsp">
                <button id="close" name="view" type="submit"><img src="images/meet.jpeg" height='40' width='40' /></button>
            </form>
            <span>
                Patient and Doctor are advised to download Google Meet App from Google PlayStore prior their appointment for smooth consultation . 
            </span>
        </div>
        <section id="four" class="about-section">
          
        <div class="inneraboutus">
              <h2>ABOUT US</h2>
            <p class="text">
                Banasthali University has been a leading institution in the field of women education since 1935. 
                The institution has an area extending to 850 acres having numerous buildings of different statures and sizes, housing various academic and administrative blocks.
                A new purpose-built website is made to cater for the growing needs of our university.  
                The doctors will always endeavoured to provide the highest quality of service with professionalism and compassion.
                All the staff believe in holistic management of each individual, encompassing mental, physical and emotional health.</p>

            <p class="text">The Banasthali University has its own hospital, “Apaji Arogya Mandir" with 60 beds, qualified doctors and other hospital staff. The hospital works round the clock throughout the year.
            All our medical staff participate in ongoing education to provide the best evidence base, up-to-date health advice and management. </p>

            <p class="text">New and existing patients are welcome to visit our website.  
            We continue to provide the trustworthy, reliable and friendly medical service we have always been proud of.
            </p>
            
        </div>
        </section>
        <div id="cu" class="contactus">
            <h2>CONTACT US</h2>
            <br>
            <br>
            <p> <font color="black">Address:</font> Banasthali Vidyapith, P.O. Banasthali Vidyapith, Rajasthan - 304022 </p>
            <br>
            <p><font color="black">Contact Number:</font> +91- 93528 79844 </p>
            <br>
            <p><font color="black">Emergency Number:</font> +91- 98370 99010 </p>
            <br>
            <p><font color="black">Email Addrres: </font>info@banasthali.ac.in</p>
            <br>
            <p><font color="black"> Fax Number:</font> 228365/228587 </p>
            <br>
            <br>
        </div>
        
        <div class="conc"> 
            <h1>Thank You for visiting our site!!</h1>
            <p>copyright @2021 Banasthali Vidyapith </p></div>
        
        <script>
 function validate(){
     var id=document.getElementById('loginuserid').value;
     var idregx=/[A]/;
     var idres=idregx.test(id);
                
//                var pass=document.getElementById('psw').value;
//                var dpass=/(?=.\d)(?=.[a-z])(?=.*[A-Z]).{8,}/;
//                var ddpass=dpass.test(pass);
     if(idres === false)
     {
             document.getElementById('error').style.color='red';
             document.getElementById('error').innerHTML='Please enter valid Admin Id';
             return false;
     }
//                if(ddpass === false)
//                {
//                    document.getElementById('error1').style.color='red';
//                    document.getElementById('error1').innerHTML='Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters';
//                    return false;
//                }
     document.getElementById('error').style.color='none';
     document.getElementById('error').innerHTML="";
     return true;
     }
        </script>
    </body>
</html>