<%@include file="classes/template.jsp"%>

<%
Template objTemplate = new Template();

String UserID=request.getParameter("UserID");
String Password=request.getParameter("Password");
String Fname=request.getParameter("Fname");
String Sname=request.getParameter("Sname");
String Role=request.getParameter("Role");
String Email=request.getParameter("Email");
String DOB=request.getParameter("DOB");
String Designation=request.getParameter("Designation");
String Department=request.getParameter("Department");

String Data;

if((UserID!=null) && (Password!=null) && (Fname!=null) && (Sname!=null) && (Role !=null) && (Email!=null) && (DOB!=null) && (Designation!=null) && (Department!=null))     
	{
%>
	<%@include file="classes/user.jsp"%> 
     
<%
	User objUser=new User();
	
	objUser.addUser(UserID,Password,Fname,Sname,Role,Email,DOB,Designation,Department);
	
	Data="<h2>User Added</h2>";	
	}
else
	{
	Data="<h2>Add User Form</h2>"+
	"<form action=\"\" method=post>"+
	"<table>"+
	"<tr><td>User ID</td><td><input type=text name=UserID></td></tr>"+
	"<tr><td>Password</td><td><input type=text name=Password></td></tr>"+
	"<tr><td>First Name</td><td><input type=text name=Fname></td></tr>"+
	"<tr><td>Second Name</td><td><input type=text name=Sname></td></tr>"+
	"<tr><td>Role</td><td>"+
	"<select name=Role>"+
	"<option vaule=\"User\">User</option>"+
	"<option vaule=\"Admin\">Admin</option>"+
	"</select>"+
	"</td></tr>"+
	"<tr><td>Email ID</td><td><input type=text name=Email></td></tr>"+
	"<tr><td>Date of Birth</td><td><input type=text name=DOB></td></tr>"+
	"<tr><td>Designation</td><td><input type=text name=Designation></td></tr>"+
	"<tr><td>Department</td><td><input type=text name=Department></td></tr>"+
	"<tr><td></td><td><input type=submit value=\"Add User\"></td></tr>"+
	"</table>"+
	"</form>"+"";
	}

out.println(objTemplate.genPage(Data,true));

%>