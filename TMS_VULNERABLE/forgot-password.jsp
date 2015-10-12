<%@page  import="java.sql.*"%>
<%@include file="classes/template.jsp"%>

<%

	String Data="";
	Template objTemplate=new Template();

	if((request.getParameter("UserID")==null) && (request.getParameter("SecurityAnswer")==null))
		{

			Data+="<h2>Account Password Recovery</h2>"+
				"<form action=\"\" method=post>"+
				"<table>"+
				"<tr>"+
				"<td>Username</td>"+
				"<td><input type=text id=UserID name=UserID></td>"+
				"</tr>"+
				"<tr>"+
				"<td></td>"+
				"<td><input type=submit value=\"Login\"></td></tr>"+
				"</table>"+
				"</form>";
		}
	else if(request.getParameter("UserID")!=null)
		{%>
			<%@include file="classes/user.jsp"%>
<%
	User objUser=new User();

	ResultSet rs=objUser.getUser(request.getParameter("UserID"));
	
	if(rs.next()==true)
		{
			session.setAttribute("SecurityAnswer", rs.getString("SecurityAnswer"));
			session.setAttribute("Password", rs.getString("password"));
    
			Data="<form action=\"\" method=POST>"+
					"<table>"+
					"<tr><td>Security Question</td><td><input type=text name=SecurityQuestion value=\""+rs.getString("securityquestion") +"\"></td></tr>"+
					"<tr><td>Answer</td><td><input type=text name=SecurityAnswer></td></tr>"+
					"<tr><td></td><td><input type=submit value=\"Check Answer\"></td></tr>"+
					"</table>"+
					"</form>";
		}
	else
		{
		Data="UserID does not exist <br><br><a href=\"forgot-password.jsp\">Try Again</a>";
		}

	}

	else if((request.getParameter("SecurityAnswer")!=null) && (request.getParameter("SecurityAnswer").equals(session.getAttribute("SecurityAnswer"))) )
		{
			Data="Your password is "+session.getAttribute("Password");
			Data+="<br><br><a href=\"index.jsp\">Account Login</a>";
			session.invalidate();
		}
	else
		{
			Data="Incorrect Answer Provided <br><br><a href=\"forgot-password.jsp\">Try Again</a>";
		}

	out.println(objTemplate.genPage(Data,false));

%>