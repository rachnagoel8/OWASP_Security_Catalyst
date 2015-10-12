<%@include file="classes/user.jsp"%>
<%@include file="classes/template.jsp"%>

<%
	User  objUser = new User();
	Template  objTemplate = new Template();

	try
	{
		if(request.getParameter("id").equals("all"))
			{
				ResultSet rs=objUser.getAllUsers();
    
				String Data="<table>"+
							"<tr>"+
							"<td>User Id</td>"+
							"<td>First Name</td><td>"+
							"<td>Last Name</td>"+
							"</tr>";
	
				while(rs.next())
				{
					Data+="<tr>"+
						"<td>"+rs.getString("UserID") +"</td>"+
						"<td>"+rs.getString("Fname")+"</td><td>"+
						"<td>"+rs.getString("Sname") +"</td>"+
                        "<td><a href=view-user.jsp?id="+rs.getString("UserID")+">Details</a></td>"+
						"<td><a href=edit-user.jsp?id="+rs.getString("UserID")+">Edit User</a></td>"+
						"<td><a href=change-password.jsp?id="+rs.getString("UserID")+">Change Password</a></td>"+
						"<td><a href=enrolled-course.jsp?id="+rs.getString("UserID")+">Enrolled Courses</a></td>"+
						"</tr>";
				}

				Data+="</table>";
        
				out.println(objTemplate.genPage(Data,true));

			}

		else if(request.getParameter("id")==null)
			{
				ResultSet rs=objUser.getUser(session.getAttribute("UserID").toString());
				rs.next();
        
				String Data="<table>"+
						"<tr><td>Profile Pic</td><td><img width=70px height=80px src=\"uploads//"+rs.getString("profilepic") +"\"/></td></tr>"+
                        "<tr><td>UserID</td><td><img src=\""+rs.getString("profilepic") +"\"/></td></tr>"+
						"<tr><td>UserID</td><td>"+rs.getString("userid") +"</td></tr>"+
						"<tr><td>First Name</td><td>"+rs.getString("fname") +"</td></tr>"+
						"<tr><td>Last Name</td><td>"+rs.getString("sname") +"</td></tr>"+
						"<tr><td>Email</td><td>"+rs.getString("email") +"</td></tr>"+
						"<tr><td>Designation</td><td>"+rs.getString("designation") +"</td></tr>"+
						"<tr><td>Department</td><td>"+rs.getString("department") +"</td></tr>"+
						"<tr><td>Date of Birth</td><td>"+rs.getString("dob") +"</td></tr>"+
						"</table>";
        
				out.println(objTemplate.genPage(Data,true));
			}
		else 
			{
				String userID=request.getParameter("id");
				ResultSet rs=objUser.getUser(userID);
				rs.next();
        
				String Data="<table>"+ 
						"<tr><td>Profile Pic</td><td><img width=70px height=80px src=\"uploads//"+rs.getString("profilepic") +"\"/></td></tr>"+
						"<tr><td>UserID</td><td>"+rs.getString("userid") +"</td></tr>"+
						"<tr><td>First Name</td><td>"+rs.getString("fname") +"</td></tr>"+
						"<tr><td>Last Name</td><td>"+rs.getString("sname") +"</td></tr>"+
						"<tr><td>Email</td><td>"+rs.getString("email") +"</td></tr>"+
						"<tr><td>Designation</td><td>"+rs.getString("designation") +"</td></tr>"+
						"<tr><td>Department</td><td>"+rs.getString("department") +"</td></tr>"+
						"<tr><td>Date of Birth</td><td>"+rs.getString("dob") +"</td></tr>"+
						"</table>";
        
					out.println(objTemplate.genPage(Data,true));
			}
	}
	catch(Exception e)
	{
		ResultSet rs=objUser.getUser(session.getAttribute("UserID").toString());
        rs.next();
        
		String Data="<table>"+    
			"<tr><td>Profile Pic</td><td><img width=70px height=80px src=\"uploads//"+rs.getString("profilepic") +"\"/></td></tr>"+
			"<tr><td>UserID</td><td>"+rs.getString("userid") +"</td></tr>"+
			"<tr><td>First Name</td><td>"+rs.getString("fname") +"</td></tr>"+
			"<tr><td>Last Name</td><td>"+rs.getString("sname") +"</td></tr>"+
			"<tr><td>Email</td><td>"+rs.getString("email") +"</td></tr>"+
			"<tr><td>Designation</td><td>"+rs.getString("designation") +"</td></tr>"+
			"<tr><td>Department</td><td>"+rs.getString("department") +"</td></tr>"+
			"<tr><td>Date of Birth</td><td>"+rs.getString("dob") +"</td></tr>"+
			"</table>";
        
        out.println(objTemplate.genPage(Data,true));
	}
%>