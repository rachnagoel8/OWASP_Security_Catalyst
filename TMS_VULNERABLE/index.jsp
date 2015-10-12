<%@include file="classes/template.jsp"%>
<%

	Template objTemplate=new Template();
	     
	String UserID=request.getParameter("UserID");
	String Password=request.getParameter("Password");   
	String Role;

    if((UserID!=null) && (Password!=null))    
		{         
%>

<%@include file="classes/user.jsp"%> 
                    
<%
    User objUser=new User();
    Role=objUser.checkLogin(UserID,Password);
       
	   if(Role!="")
        {
           session.setAttribute("UserID",UserID);
           session.setAttribute("Role",Role);
           response.sendRedirect("home.jsp");      
		}
   
		}

	String Data=" "+"<h2>Login Form</h2>"+
	"<form name=LoginForm action=index.jsp method=post>"+
	"<table>"+
	"<tr>"+
	"<td>Username</td>"+
	"<td><input type=text id=UserID name=UserID value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td>Password</td>"+
	"<td><input type=password id=Password name=Password value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td></td>"+
	"<td><input type=submit value=\"Login\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td></td>"+
	"<td><a href=\"forgot-password.jsp\">Forgot Password</a></td>"+
	"</tr>"+
	"</table>"+
	"</form>";

out.println(objTemplate.genPage(Data,false));
%>