<%@page import="java.sql.*"%>
<%@include file="classes/template.jsp"%>
<%@include file="classes/course.jsp"%>

<%

	Template objTemplate=new Template();
	Course objCourse=new Course();
	String Data="";

if(request.getParameter("Name")==null)
	{
		ResultSet rs=objCourse.getCourse(request.getParameter("id"));    
		Data="<form action=\"\" method=POST>";
 
		rs.next();
	
		Data+="<table>"+
			"<input type=hidden name=Name value=\""+rs.getString("Name") +"\">"+
			"<tr><td>Description</td><td><input type=text name=Description value=\""+rs.getString("Description") +"\"></td></tr>"+
			"<tr><td>Trainer</td><td><input type=text name=Trainer value=\""+rs.getString("Trainer") +"\"></td></tr>"+
			"<tr><td>Coordinator</td><td><input type=text name=Cord value=\""+rs.getString("coordinator") +"\"></td></tr>"+
			"<tr><td>Manager</td><td><input type=text name=Manager value=\""+rs.getString("Manager") +"\"></td></tr>"+
			"<tr><td>Start Date</td><td><input type=text name=StartDate value=\""+rs.getString("startDate") +"\"></td></tr>"+
			"<tr><td>Duration (in days)</td><td><input type=text name=Duration value=\""+rs.getString("Duration") +"\"></td></tr>"+
			"<tr><td></td><td><input type=submit value=\"Update Course\"></td></tr>"+
			"</table>";
               
		Data+="</form>";
        
    }
else
	{
		objCourse.setCourse(request.getParameter("Name"), request.getParameter("Description"), request.getParameter("Trainer"), request.getParameter("Cord"), request.getParameter("Manager"), request.getParameter("StartDate"), request.getParameter("Duration"));
		Data="Course Update Successfully!!!";
	}

out.println(objTemplate.genPage(Data,true));
%>