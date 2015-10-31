<%@include file="classes/template.jsp"%>
<%@include file="classes/cryptography.jsp"%>
<%

	Template objTemplate=new Template();
	     
	String UserID=request.getParameter("UserID");
	String Password=request.getParameter("Password");
	String capNumber=request.getParameter("number");
	
	String Role;

    if((UserID!=null) && (Password!=null) && ((capNumber)!=null))    
		{         
%>
<%@include file="classes/user.jsp"%>
<%
    User objUser=new User();
	Cryptography objCryptography=new Cryptography();
	String encPassword=objCryptography.genPassword(Password);
    Role=objUser.checkLogin(UserID,encPassword);
	   if(Role!="")
        {
           session.setAttribute("UserID",UserID);
           session.setAttribute("Role",Role);
		   if(capNumber.equals(session.getAttribute("key")))
			{
				response.sendRedirect("home.jsp");
			}
		}
   
		}

	String Data=" "+"<h2>Login Form</h2>"+
	"<form autocomplete=\"off\" name=LoginForm action=index.jsp method=post>"+
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
	"<td><img src=\"Cap_Img.jsp\"></td>"+
	"<td><input name=\"number\" type=\"text\"></td>"+
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