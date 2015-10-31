<%@page import="java.sql.*" %>

<%

class Course
{
   
    
    public void addCourse(String Name,String Description,String Trainer,String Cord,String Manager,String date,String Duration)
        {
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
				st.executeUpdate("insert into courses values('"+Name+"','"+Description+"','"+Trainer+"','"+Cord+"','"+Manager+"','"+date+"','"+Duration+"')");
			
				st.close();
				con.close();
			}
           catch(Exception e)
            {
               System.out.println(e.getMessage());
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
				System.out.println(e.getMessage());
				return rs;
			}   
        
		}
    
    
    public ResultSet getCourse(String id)
        {
			ResultSet rs=null;
        
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
                
				rs=st.executeQuery("Select * from courses where name='"+id+"'");
				return rs;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				return rs;
			}   
		}
      
    public void setCourse(String Name,String Description,String trainer,String coordinator,String manager,String startDate,String duration)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
				
				st.executeUpdate("update courses set Description='"+Description+"',trainer='"+trainer+"',coordinator='"+coordinator+"',manager='"+manager+"',startdate='"+startDate+"',duration='"+duration+"' where name='"+Name+"'");
               
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