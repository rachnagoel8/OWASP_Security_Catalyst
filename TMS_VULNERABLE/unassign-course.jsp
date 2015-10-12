<%@include file="classes/template.jsp" %>
<%@include file="classes/user.jsp" %>


<%


String UserID=String.valueOf(request.getParameter("UserID"));
String Course=String.valueOf(request.getParameter("Course"));
String Data="";

User objUser=new User();
Template objTemplate=new  Template();

ResultSet rs1=objUser.getAllUsers();
ResultSet rs2=objUser.getAllCourses();


if((!(UserID.equals("null"))) && (!(Course.equals("null"))) )
{
    objUser.unassignCourse(Course, UserID);
    Data+="User Unassigned";
}

	Data+="<h2>Unassign Users to Course</h2>"+
		"<form action=\"\" method=post>"+
		"<table>"+
		"<tr><td>User ID</td><td><select name=UserID>+";


while(rs1.next())
	{
		Data+="<Option>"+rs1.getString("Fname")+"</option>";
	}
	
	Data+="</select></td></tr>"+
		"<tr><td>Course ID</td><td><select name=Course>";

while(rs2.next())
	{
		Data+="<Option>"+rs2.getString("name")+"</option>";	
	}

	Data+="</select></td></tr>"+
		"<tr><td></td><td><input type=submit value=\"Unassign User\"></td></tr>"+
		"</table>"+
		"</form>";

	out.println(objTemplate.genPage(Data,true));
%>
     