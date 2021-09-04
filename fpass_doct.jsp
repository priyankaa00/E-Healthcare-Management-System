<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.mail.Message.RecipientType"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Forgot Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="fpass_css.css" >
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
                        <li class="rmi"><a href="doctorlogin.jsp"> Back </a></li>  
                    </ul>
                </div>
            </div>
        <div class="box">
            <h2>Forgot Password</h2>
                
            <form method="POST">
                <div class="inputbox">
                    <input type="text" id="id" name="id1" required>
                    <label>Doctor ID</label>
                </div>
                <input type="submit" name="btn" value="Confirm">
            </form>
        </div>
<!--<!DOCTYPE html>
<html>
    <body>
        <form method="POST">
                <div class="control">
                    <label for="name"> Patient ID </label>
                    <input type="text" name="id1" id="id"><span id="error"></span><br>
               </div>
                <div class="forgot">
                    <input name="btn" value="Forgot Password?" type="submit">
                </div>
        </form>
    </body>
</html>-->
<%
    try
    {
        String bid=request.getParameter("id1");
    
//     String bid="S1";
//    int rid=Integer.parseInt(request.getParameter("rid"));
    Class.forName("org.apache.derby.jdbc.ClientDriver");
//    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/BloodDrive");
//    Statement stmt=conn.createStatement();
//    ResultSet rs=stmt.executeQuery("select email from requester where req_id="+rid+" ");
    
//    if(rs.next())
//        emailto=rs.getString(1);
//    rs=stmt.executeQuery("select email,password from bloodbank where bloodbank_id="+bid+" ");
    String emailfrom="arogyabv@gmail.com";
    String pass1="arogyamandir2021";
    String pass="";
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
    String query = "select d_email,password from doctor_information,authentication where d_id=id and d_id IN (select id from authentication where id like '" + bid + "')";
    PreparedStatement pst = conn.prepareStatement(query); 
    ResultSet rst = pst.executeQuery();
    String emailto="";
    if(rst.next())
    {
        emailto=rst.getString(1);
        pass=rst.getString(2);
    }
     Properties props = new Properties();
     props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.user", emailfrom);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "true"); 
                   
                Session session1 = Session.getDefaultInstance(props, null);
                session1.setDebug(true);
                MimeMessage message = new MimeMessage(session1);
                message.setText("Your forgot password request has been accepted. Password  : "+pass );
                message.setSubject("Password Recovery ");
                message.setFrom(new InternetAddress( emailfrom));
                message.addRecipient( RecipientType.TO, new InternetAddress( emailto));
                message.saveChanges();
                Transport transport = session1.getTransport("smtp");
                transport.connect("smtp.gmail.com", emailfrom, pass1);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                out.println("<script>alert('Your password has mailed to your registered EMAIL ID');</script>");  
    }
    catch(Exception e)
    {
        
    }
    
%>
