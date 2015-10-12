<%@page language="java" import="java.sql.*"%>  
<%  
	
	String name=request.getParameter("q");  
 
	String buffer="<div>";
  
	if(name!="")
		{
			try
			{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdf");
			Statement st=con.createStatement();
 
			ResultSet rs = stmt.executeQuery("SELECT userid FROM USERS where userid like '"+name+"%'");  

			out.println("<div>");
			out.println("<select name=UserID size=5>");
 
			while(rs.next())
				{
					String result=rs.getString("userid");
					out.println("<option value="+result+">"+result+"</option>");
				}
 
			out.println("</select>");
			out.println("</div>");
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
	
		}
   
 %>