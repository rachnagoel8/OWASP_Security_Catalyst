<%@page  import="java.sql.*" %>
<%@include file="classes/course.jsp"%>
<%@include file="classes/template.jsp"%>

<%
	Course objCourse=new Course();
	Template objTemplate=new Template();
	String Data="";

	if(request.getParameter("id")==null)
		{
			ResultSet rs=objCourse.getAllCourses();

			Data="<table>"+
					"<tr>"+
					"<td>Name</td>"+
					"<td>Trainer</td><td>"+
					"<td>Manager</td>"+
					"</tr>";
	
			while(rs.next())
				{
					Data+="<tr>"+
					"<td>"+rs.getString("Name") +"</td>"+
					"<td>"+rs.getString("Trainer")+"</td><td>"+
					"<td>"+rs.getString("Manager") +"</td>"+
					"<td><a href=view-course.jsp?id="+rs.getString("Name") +">Details</a></td>"+
					"<td><a href=edit-course.jsp?id="+rs.getString("Name") +">Edit</a></td>"+	
					"</tr>";
				}
					
					Data+="</table>";
		} 
	else
		{
			ResultSet rs=objCourse.getCourse(request.getParameter("id"));
			
			while(rs.next())
				{
					Data="<table>"+
					"<tr><td>Name</td><td>"+rs.getString("Name")+"</td></tr>"+
					"<tr><td>Description</td><td>"+rs.getString("Description") +"</td></tr>"+
					"<tr><td>Trainer</td><td>"+rs.getString("Trainer") +"</td></tr>"+
					"<tr><td>Coordinator</td><td>"+rs.getString("Coordinator") +"</td></tr>"+
					"<tr><td>Manager</td><td>"+rs.getString("Manager") +"</td></tr>"+
					"<tr><td>Start Date</td><td>"+rs.getString("StartDate") +"</td></tr>"+
					"<tr><td>Duration (in months)</td><td>"+rs.getString("Duration") +"</td></tr>"+
					"</table>";
				}
		}      
    
	out.println(objTemplate.genPage(Data,true));
%>