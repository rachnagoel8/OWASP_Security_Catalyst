<%@page import="java.sql.*" %>
<%@include file="classes/template.jsp"%>
<%@include file="classes/user.jsp"%>

<%
String Data="";
User objUser =new User();
Template objTemplate=new Template();

String UserID=request.getParameter("UserID");

if(UserID!=null)
{
    objUser.setSecurity(session.getAttribute("UserID").toString(),request.getParameter("SecurityQuestion").toString(),request.getParameter("SecurityAnswer").toString());
    Data+="Security Settings Updated Successfully";
}

ResultSet rs=objUser.getSecurity(session.getAttribute("UserID").toString());
rs.next();

Data+="<form action=\"\" method=POST>"+
		"<table>"+
		"<input type=hidden name=UserID value="+session.getAttribute("UserID").toString()+">"+
		"<tr><td>Security Question</td><td><input type=text name=SecurityQuestion value=\""+rs.getString("securityquestion") +"\"></td></tr>"+
		"<tr><td>Answer</td><td><input type=text name=SecurityAnswer value=\""+rs.getString("securityanswer") +"\"></td></tr>"+
		"<tr><td></td><td><input type=submit value=\"Update User\"></td></tr>"+
		"</table>"+
		"</form>";

out.println(objTemplate.genPage(Data,true));

%>

