<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title> Register Complaint </title>
        <link rel="stylesheet" href="insert_complaintcss.css">
        
    </head>
    <body>
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
                        <li class="rmi"><a href="patient_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <div class="box">
            <h2>Complaint</h2>
                
            <form onclick="return validate()">
                <div class="inputbox">
<!--                    <input type="text" name="patid" id="id" required><span id="error"></span>-->
                        <input type="text" name="patid" id="id" value=<%=request.getParameter("id")%> required><span id="error"></span>

                    <label>Patient's ID</label>
                </div>
                 <div class="inputbox">
                 
                    <textarea name="txtcomp" placeholder="Enter Feedback here" rows="4" cols="30" required></textarea>
                </div>
                <input type="submit" name="btn_send" value="Submit">
            </form>
        </div>
       <script>
            function validate(){
		var u=document.getElementById('id').value;
		var uregx=/[ES]/;
		var ures=uregx.test(u);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Patient Id';
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
    try
    {
    if(request.getParameter("btn_send")!=null)
    {
        String pid=request.getParameter("patid");
        String comp=request.getParameter("txtcomp");
        
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");    
            PreparedStatement pst = conn.prepareStatement("select c_no from complaint order by c_no desc") ; 
            
            ResultSet rst = pst.executeQuery();
            int cno = 1;
            if(rst.next()==true) 
            {    
                cno = rst.getInt(1);
//                out.print(cno);
                cno++;
                
            } 
//            out.println(cno);
            pst = conn.prepareStatement("insert into complaint values (?,?,?)");
            pst.setInt(1, cno);
            pst.setString(2, pid);  
            pst.setString(3, comp);
            int x=pst.executeUpdate();        
            if(x>0)  
               out.println("<script> alert('Thank You for you feedback')</script>");
                 
        }
    }
        catch(Exception ex)
        {
            out.println("Error occurred.Kindly try again!"); 
        }
        
    
    
%>
