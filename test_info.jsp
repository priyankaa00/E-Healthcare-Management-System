<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lab Test Information</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="test_info.css" rel="stylesheet">
    </head>
    <body>
        <div class="bgimage">
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
            <div class="test_info">
                <h1> Laboratory Test </h1>
            </div>
            <div class="main">
                <form method="post" onsubmit="return validate()">
                    <h2 class="name">Lab&nbsp;Test&nbsp;Id</h2>
                    <input class="test" type="text" name="id" id="id1" required><br><span id="e1"></span>
                    
                    <h2 class="name">Lab&nbsp;Test&nbsp;Name</h2>
                    <input class="test" type="text" name="name" required>
                    
                    <h2 class="name">Lab&nbsp;Test&nbsp;Amount</h2>
                    <input class="test" type="number" name="amount" id="amt" required><br><span id="e2"></span>
                    <div class="button">
                        <button class="btn submit" name="b1">Submit</button>
                        <button class="btn clear" type="reset">Clear</button>
                    </div>
                </form>
            </div>    
        </div> 
        <script>
            function validate()
            {
                var u = document.getElementById('id1').value;
                var ureg = /^T/;
                var uregex = ureg.test(u);
                
                var v = document.getElementById('amt').value;
                var vreg = /^[0-9]/;
                var vregex = vreg.test(v);
                if(uregex === false)
                {
                    document.getElementById('e1').style.color = 'red';
                    document.getElementById('e1').innerHTML = "Please enter valid Lab Test ID";
                    return false;
                }
                
                if(vregex === false)
                {
                    document.getElementById('e2').style.color = 'red';
                    document.getElementById('e2').innerHTML = "Please enter valid Lab Test Amount";
                    return false;
                }
                document.getElementById('e1').style.color = none;
                document.getElementById('e1').innerHTML = "";
                document.getElementById('e2').style.color = none;
                document.getElementById('e2').innerHTML = "";
            }
      </script>
    </body>
</html>

<%
    try 
    {
        if (request.getParameter("b1")!= null) 
        {
            String test_id = request.getParameter("id");
            String tname = request.getParameter("name");
            int tamt = Integer.parseInt(request.getParameter("amount"));
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            PreparedStatement pst = conn.prepareStatement("insert into test values(?,?,?)");
            pst.setString(1, test_id);
            pst.setString(2, tname);
            pst.setDouble(3, tamt);
            int x = pst.executeUpdate();
            if (x > 0) 
            {
                out.print("<script>alert('Added successfully.')</script>");
            }
        }
    } 
    
    catch (Exception ex) 
    {
        ex.printStackTrace();
    }
%>