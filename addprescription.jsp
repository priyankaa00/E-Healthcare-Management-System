<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Add Prescription </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style5.css" type="text/css" rel="stylesheet">
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
        <div class="regform">
            <h1> Prescription </h1>
        </div>
        <div class="main">
            <form action=# method="POST" onsubmit="return validate()">
                <h2 class="name"> Patient ID </h2>
                <div class="cmn"> <input class="patid" type="text" name="patid" id="pid" required> </div> <span id="error" style="margin-left:220px;"></span>

                <h2 class="name"> Doctor ID </h2>
                <div class="cmn"> 
<!--                    <input class="docid" type="text" name="docid" id="did" required> -->
                    <input class="docid" type="text" name="docid" id="did" value=<%=request.getParameter("id")%> required>
                </div> <span id="errorD" style="margin-left:220px;"></span>

                <h2 class="name"> Date </h2>
                <div class="cmn"> <input class="date" type="date" name="dates" required> </div>

                <h2 class="name"> Weight </h2>
                <div class="cmn"> <input class="weight" type="number" name="weights" required> </div>

                <h2 class="name"> Height </h2>
                <div class="cmn"> <input class="height" type="number" name="heights" required> </div>

                <h2 class="name"> Age </h2>
                <div class="cmn"> <input class="age" type="number" name="ages" min="0" max="100" required> </div>

                <h2 class="name"> Temperature </h2>
                <div class="cmn"> <input class="temp" type="number" name="temps" required> </div>

                <h2 class="name"> Blood Pressure </h2>
                <div class="cmn"> <input class="bp" type="number" name="bps" required> </div>

                <h2 class="name"> Bed Required? </h2>
                <div class="cmn"> 
                   
                        <input class="radio-one" type="radio" name="beds" value="Yes" checked/> 
                        <label id="radio"> Yes </label>
                        <input class="radio-two" type="radio" name="beds" value="No"  />
                         <label id="radio"> No </label>
                    
                </div>
                <h2 class="name"> Test Required </h2>
                <div class="cmn"> <textarea class="test" name="tests" rows="3" cols="20"> 
                </textarea> </div>

                <h2 class="name"> Description </h2>
                <div class="cmn"> <textarea class="des" name="descriptions" rows="6" cols="50"> 
                </textarea> </div>

                <h2 class="name"> Disease </h2>
                <div class="cmn"> <textarea class="dis" name="diseases" rows="6" cols="50" required> 
                </textarea> </div>

                <h2 class="name"> Medicines </h2>
                <div class="cmn"> <textarea class="med" name="medicines" rows="6" cols="50" required> 
                </textarea> </div>

                <div class="button">
                    <input type="submit" class="btn add" value="Add" name="btnInsert">
                    
                    <input type="reset" class="btn clear" value="Clear">
                    
                </div>

            </form>
            
        </div> 
        <script>
            function validate(){
		var u=document.getElementById('pid').value;
                var d=document.getElementById('did').value;
                var uregx=/[ES]/;
                var dregx=/[D]/;
		var ures=uregx.test(u);
                var dres=dregx.test(d);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Patient Id';
			return false;
		}
                 document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
                if(dres === false)
		{
			document.getElementById('errorD').style.color='red';
                        document.getElementById('errorD').innerHTML='Please enter valid Doctor Id';
			return false;
		}
                document.getElementById('errorD').style.color='none';
                document.getElementById('errorD').innerHTML="";
		return true;
		}
       </script>
    </body>
</html>
        <%
    try {

        if (request.getParameter("btnInsert") != null) {
            String p_id = request.getParameter("patid");
            String d_id = request.getParameter("docid");
            String date = request.getParameter("dates");
            int weight = Integer.parseInt(request.getParameter("weights"));
            int height = Integer.parseInt(request.getParameter("heights"));
            Double temperature = Double.parseDouble(request.getParameter("temps"));
            Double bloodpressure = Double.parseDouble(request.getParameter("bps"));
            String description = request.getParameter("descriptions");
            int age = Integer.parseInt(request.getParameter("ages"));
            String p_test = request.getParameter("tests");
            Boolean p_bed = Boolean.parseBoolean(request.getParameter("beds"));
            
            
            String pdisease = request.getParameter("diseases");
            String pmedicine = request.getParameter("medicines");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement(); 
            PreparedStatement ps = conn.prepareStatement("insert into prescription values(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, p_id);
            ps.setString(2, d_id);
            ps.setString(3, date);
            ps.setInt(4, weight);
            ps.setInt(5, height);
            ps.setDouble(6, temperature);
            ps.setDouble(7, bloodpressure);
            ps.setString(8, description);
            ps.setInt(9, age);
            ps.setString(10, p_test);
            ps.setBoolean(11, p_bed);
            
            PreparedStatement pst = conn.prepareStatement("insert into disease values(?,?,?)");
            pst.setString(1, p_id);
            pst.setString(2, d_id);
            pst.setString(3, pdisease);
            
            PreparedStatement psm = conn.prepareStatement("insert into medicine values(?,?,?)");
            psm.setString(1, p_id);
            psm.setString(2, d_id);
            psm.setString(3, pmedicine);
            int x = ps.executeUpdate();
            int y = pst.executeUpdate();
            int z = psm.executeUpdate();
            if (x > 0 && y > 0 && z > 0) 
            {
                if(p_bed == true)
                {
                    ResultSet rst = stmt.executeQuery("select p_id from transaction_info where p_id like'" + p_id +"'");
                    if(rst.next())
                    {
                        PreparedStatement psb1 = conn.prepareStatement("update transaction_info set fees=fees+100 where p_id like'" + p_id +"'");
                        psb1.executeUpdate();
                    }
                    else
                    {
                        PreparedStatement psb2 = conn.prepareStatement("insert into transaction_info values(?,?)");
                        psb2.setString(1, p_id);
                        psb2.setInt(2, 0);
                        PreparedStatement psb3 = conn.prepareStatement("update transaction_info set fees=fees+100 where p_id like'" + p_id +"'");
                        psb3.executeUpdate();
                    }
                    
                }
                out.print("<script>alert('Prescription Added Successfully.')</script>");
            }
        }
        } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
