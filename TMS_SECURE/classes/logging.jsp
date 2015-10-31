<%@page import="java.sql.*" %>

<%

class Logging 
	{
    
		public void logEvent(String username,String action ,String where,String ip )
			{
        
			try
			{		
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@cfq96.comfin.ge.com:1521:cfq96","pvv","bnx73cxty");
				Statement st=con.createStatement();
				
				st.executeQuery("insert into tms_log values('"+username+"','"+action+"','"+where+"',sysdate,'"+ip+"')");
			}
			catch(Exception e)
            {
				System.out.println(e.getMessage());
			}   
            
			}     
	}
%>