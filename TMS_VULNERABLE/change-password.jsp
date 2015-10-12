<%@include file="classes/user.jsp"%>
<%@include file="classes/template.jsp"%>

<%
String Data="";
User objUser = new User();
Template objTemplate = new Template();

String id=request.getParameter("id");
if(id!=null)
	{
		if(request.getParameter("Password")!=null)
			{
				objUser.setPassword(request.getParameter("Password"), id);
				Data="Password Changed Succesfully";
			}
	}
else
	{
		if(request.getParameter("Password")!=null)
			{
				objUser.setPassword(request.getParameter("Password"), session.getAttribute("UserID").toString());
				Data="Password Changed Succesfully";
			}
	}
	
Data+="<form action=\"\" method=POST>"+
		"<table>"+
		"<input type=hidden name=UserID value=\""+session.getAttribute("UserID")+"\">"+
		"<tr><td>New Password</td><td><input type=text name=Password></td></tr>"+
		"<tr><td></td><td><input type=submit value=\"Change Password\"></td></tr>"+
		"</table>"+
		"</form>"+"";
	
out.println(objTemplate.genPage(Data,true));
%>