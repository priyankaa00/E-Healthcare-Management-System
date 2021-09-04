<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Doctor Portal </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style1.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <div class="menu">
            <div class="left-menu"> 
                <h1> Doctor Portal </h1>
            </div>
            <div class="right-menu">
                <ul>
                    <li> <a href="HomePage.jsp"> <i class="fa fa-home" aria-hidden="true"></i> Home </a> </li>
                   <li> <a href=#> View </a>
                    
                        <div class="sub-menu-1">
                            <ul>
                                <li class="hover-me"> <a href=#> Appointment </a> <i class="fa fa-angle-right"></i>
                                    <div class="sub-sub-menu-1">
                                        <ul> 
<!--                                            <li> <a href="viewonlineappointment.jsp"> Online </a></li>
                                                <li> <a href="viewofflineappointment.jsp"> Offline </a></li>-->
                                        <%
                                    String did=request.getParameter("id");
                                    out.print("<li> <a href='viewonlineappointment.jsp?id=" + did + "'> Online </a></li>");
                                    out.print("<li> <a href='viewofflineappointment.jsp?id=" + did + "'> Offline </a></li>");

                               %>
                                        </ul>
                                    </div>
                                </li>
                            <li class="hover-me"> <a href="ViewPatientRecord1.jsp"> Patient Record </a> 

<!--                            </li>-->
                            </ul>
                        </div>
                    </li>
                    <li> <a href=#> Add </a>
                        <div class="sub-menu-1">
                            <ul>
<!--                            <li> <a href="addprescription.jsp"> Prescription </a> </li>-->
                                <% out.print("<li> <a href='addprescription.jsp?id=" + did + "'> Prescription </a></li>"); %>
                            </ul>
                        </div>    
                    </li>
                    <li> <a href="logout.jsp"> Logout </a></li>
                </ul>
            </div>
        </div>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("docid") == null) {
                response.sendRedirect("doctorlogin.jsp");
            }
        %>
    </body>
</html>