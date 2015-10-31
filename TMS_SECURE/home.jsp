<%@page errorPage="errorpage.jsp"%>
<%
response.setHeader("Cache-Control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%@include file="classes/template.jsp"%>

<%
Template objTemplate=new Template();

String Data="<h2>Hello, "+session.getAttribute("UserID").toString()+"</h2>"+
"<h3>Welcome to the Training Management System</h3>"+
"<h4>Please use the navigation menu to choose the appropriate option</h4>"+"";
        


  
out.println(objTemplate.genPage(Data,true));
           
%>