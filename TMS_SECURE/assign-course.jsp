<%@include file="classes/template.jsp" %>
<%@include file="classes/user.jsp" %>

<%
	String UserID=String.valueOf(request.getParameter("UserID"));
	String Course=String.valueOf(request.getParameter("Course"));
	String Data="";

	Template objTemplate=new  Template();
	User objUser=new User();
	
	ResultSet rs1=objUser.getAllUsers();
	ResultSet rs2=objUser.getAllCourses();
	
	
	if((!(UserID.equals("null"))) && (!(Course.equals("null"))) )
		{
    
			objUser.assignCourse(Course, UserID);
			Data="Course Assigned";
		}  
	else
		{    
			
			Data="<h2>Add Users to Course</h2>"+
				"<form action=\"\" method=post>"+
				"<table>";

			Data+="<tr><td>User ID</td><td><input id=\"UserID\" type=\"text\" name=\"UserID\"></td><td><div id='country'> </div></td></tr>"+
				"<tr><td>Course ID</td><td><select name=Course>";

			while(rs2.next())
				{
					Data+="<Option>"+rs2.getString("name") +"</option>";
				}
				
			Data+="</select></tr>"+
				"<tr><td> </td><td><input type=submit value=\"Add User To Course\"></td></tr>"+
				"</table>"+
				"</form>";
		}
		
out.println(objTemplate.genPage(Data,true));       
%>