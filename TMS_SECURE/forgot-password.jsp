<%@page  import="java.sql.*"%>
<%@include file="classes/template.jsp"%>
<%@ page import="java.util.*"%>
<%@include file="classes/cryptography.jsp"%>

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
			session.setAttribute("uname",request.getParameter("UserID"));
    
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
			Cryptography objCryptography=new Cryptography();
			
			Random rdm=new Random();  //Random class is used to generate a random number
			int rl=rdm.nextInt();    //this line will generate a random integer number
			
			String hash1 = Integer.toHexString(rl); //Integer is converted into hexadecimal String
			String newPass=hash1.substring(0,5); // substring method is used to generate a substring from the existing string 
			String encPassword=objCryptography.genPassword(newPass);
		%>
			<%@include file="classes/user.jsp"%>
		<%
			User objUser=new User();
			objUser.setPassword(encPassword,session.getAttribute("uname").toString());

			//Data="Your new password is "+session.getAttribute("Password");
			Data="Your new password is "+newPass;
			Data+="<br><br><a href=\"index.jsp\">Account Login</a>";
			session.invalidate();
		}
	else
		{
			Data="Incorrect Answer Provided <br><br><a href=\"forgot-password.jsp\">Try Again</a>";
		}

	out.println(objTemplate.genPage(Data,false));

%>