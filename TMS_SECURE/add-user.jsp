<%@page errorPage="errorpage.jsp"%>
<%@include file="classes/template.jsp"%>
<%@include file="classes/cryptography.jsp"%>
<%@include file="classes/validation.jsp"%>

<%
String unamechk=session.getAttribute("UserID").toString();
Template objTemplate = new Template();
Cryptography objCryptography=new Cryptography();
Validation objValidation=new Validation();

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
	
	if(objValidation.isValidUserName(UserID) && objValidation.isValidDOB(DOB)  && objValidation.isValidEmailId(Email) && objValidation.isValidFirstName(Fname) && objValidation.isValidPassword(Password)   && objValidation.isValidsecondName(Sname))   
     {
	String encPassword=objCryptography.genPassword(Password);
	
%>
	<%@include file="classes/user.jsp"%> 
	<%@include file="classes/logging.jsp"%>
     
<%
	User objUser=new User();
	Logging objLogging=new Logging();
	
	objUser.addUser(UserID,encPassword,Fname,Sname,Role,Email,DOB,Designation,Department);
	String ipAddress=request.getRemoteAddr();
	String uname=session.getAttribute("UserID").toString();
	objLogging.logEvent(uname,"User Added","add-user.jsp",ipAddress);
	
	Data="<h2>User Added</h2>";	
	}
else
{
     Data="Some Fields Are Not Properly Filled....<br><br>";
     Data+="<h2>Add User Form</h2>"+
	"<form autocomplete=\"off\" action=\"\" method=post>"+
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
 }
else
	{
	Data="<h2>Add User Form</h2>"+
	"<form autocomplete=\"off\" action=\"\" method=post>"+
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