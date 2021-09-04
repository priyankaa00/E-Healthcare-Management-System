<!DOCTYPE html>
<html>
    <head>
        <title>Admin Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="admin_portal.css" rel="stylesheet">
    </head>
    <body>
       <div class="bgimage">
           <div class="menu">
               <div class="left-menu">
                   <h2>Admin&nbsp;Portal</h2>
               </div>
               <div class="right-menu">
                   <ul>
                       <li><a href="HomePage.jsp">Home</a></li>
                       <li><a href="#">Add</a>
                           <div class="sub-menu-1">
                            <ul>
                                <li><a href="dept_info.jsp">Department</a></li>
                                <li><a href="#">Patient</a>
                                    <div class="sub-sub-menu-1">
                                        <ul>
                                            <li><a href="employee_info.jsp">Employee</a></li>
                                            <li><a href="student_info.jsp">Student</a></li>
                                        </ul>
                                    </div>
                                 </li>
                                <li><a href="doctor_info.jsp">Doctor</a></li>
                                <li><a href="test_info.jsp">Test</a></li>
                            </ul>
                        </div>
                       </li>
                       <li><a href="#">View</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href="#">Appointments</a>
                                    <div class="sub-sub-menu-1">
                                        <ul>
                                            <li><a href="view_onlineappoints.jsp">Online</a></li>
                                            <li><a href="view_offlineappoints.jsp">Offline</a></li>
                                            <li><a href="disp_viewtest.jsp">Test</a></li>
                                        </ul>
                                    </div>
                                </li>
                                
                                <li><a href="disp_viewdept.jsp">Department</a></li>
                                <li><a href="#">Patient</a>
                                    <div class="sub-sub-menu-1">
                                        <ul>
                                            <li><a href="view_emp.jsp">Employee</a></li>
                                            <li><a href="view_stud.jsp">Student</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li><a href="view_doctor.jsp">Doctor</a></li>
                                <li><a href="view_testinfo.jsp">Test</a></li>
                                 <li><a href="disp_viewcomp.jsp">Complaint</a></li>
                            </ul> 
                        </div>
                       </li>
                       <li><a href="trans_option.jsp">Transaction</a>
                            <div class="sub-menu-1">
                        </div>
                       </li>
                       <li><a href="#">Delete</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href="#">Patient</a>
                                    <div class="sub-sub-menu-1">
                                        <ul>
                                            <li><a href="delete_emp.jsp">Employee</a></li>
                                            <li><a href="delete_stud.jsp">Student</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li><a href="delete_doctor.jsp">Doctor</a></li>
                            </ul>
                        </div>
                       </li>
                       <li><a href="logout.jsp">Log&nbsp;Out</a></li>
                   </ul>
               </div>     
           </div>
       </div>
    </body>
</html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("loginuserid") == null) 
    {
        response.sendRedirect("HomePage.jsp");
    }

%>