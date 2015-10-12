

<%@include file="classes/template.jsp"%>

<%
Template objTemplate=new Template();

String Data="<h2>Hello, "+session.getAttribute("UserID").toString()+"</h2>"+
"<h3>Welcome to the Training Management System</h3>"+
"<h4>Please use the navigation menu to choose the appropriate option</h4>"+"";
        


  
out.println(objTemplate.genPage(Data,true));
           
%>