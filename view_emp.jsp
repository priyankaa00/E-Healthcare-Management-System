<!DOCTYPE html>
<html>
    <head>
        <title> View Employee </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="view_empcss.css" >
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
            <h2>Employee Profile</h2>
                
            <form action="disp_viewemp.jsp" method="post" onclick="return validate()">
                <div class="inputbox">
                    <input type="text" name="empid" id="empd" required><span id="error"></span>
                    <label>Employee's ID</label>
                </div>
                <input type="submit" name="view" value="View">
                <div class="icon">
                    <a href="edit_emp.jsp" class="fa fa-edit" style="font-size:40px;color:red"></a>
                </div>
            </form>
        </div>
        <script>
     function validate(){
		var u=document.getElementById('empd').value;
		var uregx=/[E]/;
		var ures=uregx.test(u);
		if(ures === false)
		{
			document.getElementById('error').style.color='red';
                        document.getElementById('error').innerHTML='Please enter valid Employee Id';
			return false;
		}
                document.getElementById('error').style.color='none';
                document.getElementById('error').innerHTML="";
		return true;
		}
                </script>

    </body>
</html>
