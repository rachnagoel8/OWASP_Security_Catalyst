<%@page import="java.sql.*" %>
<%

class User
	{
    
    public void addUser(String UserID,String Password,String Fname,String Sname,String Role,String Email,String DOB,String Designation,String Department)
        {
        try
           { 
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
            Statement st=con.createStatement();
            st.executeUpdate("insert into users values('"+UserID+"','"+Fname+"','"+Sname+"','"+Password+"','"+Email+"','"+Designation+"','"+Department+"','"+DOB+"','"+Role+"','','','')");
			
			st.close();
			con.close();
			}
        catch(Exception e)
			{
				
               System.out.println(e.getMessage());
			}
		}
   
   
    public String  checkLogin(String UserID,String Password)
		{
		try
			{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
            Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select * from users where UserID='"+UserID+"'");
			
			String Role="";
			if( (rs.next()) && (rs.getString("Password").equals(Password)))
                {
					Role=rs.getString("Role");
                    return Role; 
                }
			
			st.close();
			con.close();
			
            return Role;
			}
		catch(Exception e)
			{
				System.out.println(e.getMessage());
            }
     
		return "";
		}

	public ResultSet getAllUsers()
		{
			 
			ResultSet rs=null;
			try
			{  
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
				
                rs=st.executeQuery("Select * from users");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}
		}

	public ResultSet getAllCourses()
        {
			ResultSet rs=null;
        
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from courses");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}   
		}

	public ResultSet getUser(String userID)
		{
			ResultSet rs=null;
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from users where userid='"+userID+"'");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}
		}

	public void setPassword(String Password,String userID)
	{
		
    try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
            Statement st=con.createStatement();
			
            System.out.println("hello niranjan pass "+Password);
			System.out.println("hello niranjan user "+userID);   
            
			st.executeQuery("update users set password='"+Password+"' where userid='"+userID+"'");
			st.close();
			con.close();
		}
    catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
}


	public void setUser(String userID,String Fname,String Sname,String Email,String Designation ,String Department,String DOB,String Role)
		{
    
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
                
				st.executeQuery("update users set Fname='"+Fname+"' , Sname='"+Sname+"' , Email='"+Email+"' ,designation='"+Designation+"', department='"+Department+"',dob='"+DOB+"',role='"+Role+"' where userid='"+userID+"'");  
				
				st.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}

	public void assignCourse(String CourseID,String UserID)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
                
				st.executeQuery("insert into course_user_map values('"+CourseID+"','"+UserID+"')");
				
				st.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}

        
	public void unassignCourse(String CourseID,String UserID)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
               
				st.executeQuery("delete from course_user_map where userid='"+UserID+"' and courseid='"+CourseID+"'");
				
				st.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}

	public ResultSet getRegisteredCourses(String UserId)
		{
			ResultSet rs=null;
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("select * from courses where name in(select courseid from course_user_map where userid='"+UserId+"')");
				return rs;
      
			}
			catch(Exception e)
            {
            return rs;
			}
		}


public ResultSet getSecurity(String UserId)
	{
		ResultSet rs=null;
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("select securityquestion,securityanswer from users where userid='"+UserId+"' ");
				
				return rs;
      
			}
			catch(Exception e)
            {
				return rs;
			}
	}

public void setSecurity(String UserId,String securityquestion,String securityanswer)
	{
       
		try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
               
                st.executeUpdate("update users set securityquestion='"+securityquestion+"' , securityanswer='"+securityanswer+"' where userid='"+UserId+"'");
				st.close();
				con.close();
			}
        catch(Exception e)
            {
				System.out.println(e.getMessage());
			}
	}


public void addPic(String UserID,String Profilepic)
{
    try
        {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
			Statement st=con.createStatement();
           
            st.executeUpdate("update users set profilepic='"+Profilepic+"' where userid='"+UserID+"'");
			st.close();
			con.close();
	   }
	catch(Exception e)
        {
			System.out.println(e.getMessage());
        }
}


}
%>