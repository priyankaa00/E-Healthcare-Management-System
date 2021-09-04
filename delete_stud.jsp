<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Delete Student </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="delete_studcss.css" >
    </head>
    <body>
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
        <div class="box">
            <h2>Delete Student</h2>

            <form onclick="return validate()">
                <div class="inputbox">
                    <input type="text" name="studid" id="stud" required placeholder="Enter Student's ID"><span id="error"></span>
                </div>
                <input type="submit" name="delete" value="Delete">
            </form>
        </div>
        <script>
     function validate(){
		var u=document.getElementById('stud').value;
		var uregx=/[S]/;
		var ures=uregx.test(u);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Student Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
		}
                </script>

    </body>
</html>
<%
    try {
        if (request.getParameter("delete") != null) {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement();
            String sid = request.getParameter("studid");
            stmt.execute("delete from STUDENT_INFORMATION where s_id like ('" + sid + "')");
            out.print("<script>alert('record deleted successfully')</script>");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>