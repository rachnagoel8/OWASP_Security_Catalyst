<%@include file="classes/user.jsp"%>
<%@include file="classes/template.jsp"%>

<%
Template objTemplate=new Template();
User objuserUser=new User();
ResultSet rs;
String id=request.getParameter("id");
if(id!=null)
{
rs=objuserUser.getRegisteredCourses(id);	
}
else
{ 
rs=objuserUser.getRegisteredCourses(session.getAttribute("UserID").toString());
}

String Data="<table>"+
			"<tr>"+
			"<td>Name</td>"+
			"<td>Description</td>"+
			"<td>Trainer</td>"+
			"<td>Coordinator</td>"+
			"<td>Manager</td>"+
			"<td>StartDate</td>"+
			"<td>Duration</td>"+
			"</tr>";
			
	while(rs.next())
		{
			Data+="<tr>"+
			"<td>"+rs.getString("Name") +"</td>"+
			"<td>"+rs.getString("description") +"</td>"+
			"<td>"+rs.getString("Trainer")+"</td>"+
			"<td>"+rs.getString("Coordinator")+"</td>"+
			"<td>"+rs.getString("Manager") +"</td>"+
			"<td>"+rs.getString("StartDate") +"</td>"+
			"<td>"+rs.getString("Duration") +"</td>"+
			"</tr>";
		}  

	Data+="</table>";

	out.println(objTemplate.genPage(Data,true));
%>