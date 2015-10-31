<%@include file="classes/template.jsp"%>

<%
Template objTemplate = new Template();

String Name=request.getParameter("Name");
String Description=request.getParameter("Description");
String Trainer=request.getParameter("Trainer");
String Cord=request.getParameter("Cord");
String Manager=request.getParameter("Manager");
String Date=request.getParameter("Date");
String Duration=request.getParameter("Duration");

String Data;
if((Name!=null) && (Description!=null) && (Trainer!=null) && (Cord!=null) && (Manager !=null) && (Date!=null) && (Duration!=null))     
	{
%>
	<%@include file="classes/course.jsp"%> 
<%
Course objCourse=new Course();
objCourse.addCourse(Name,Description,Trainer,Cord,Manager,Date,Duration);

Data="<h2>Course Added</h2>";
	}
else
	{
		Data="<h2>Add Course Form</h2>"+
			"<form action=\"\" method=post>"+
			"<table>"+
			"<tr><td>Name</td><td><input type=text name=Name></td></tr>"+
			"<tr><td>Description</td><td><input type=text name=Description></td></tr>"+
			"<tr><td>Trainer</td><td><input type=text name=Trainer></td></tr>"+
			"<tr><td>Cord </td><td><input type=text name=Cord></td></tr>"+
			"<tr><td>Manager</td><td><input type=text name=Manager></td></tr>"+
			"<tr><td>Start Date </td><td><input type=text name=Date></td></tr>"+
			"<tr><td>Duration</td><td><input type=text name=Duration></td></tr>"+
			"<tr><td></td><td><input type=submit value=\"Add Course\"></td></tr>"+
			"</table>"+
			"</form>"+"";
	}

	out.println(objTemplate.genPage(Data, true));

%>