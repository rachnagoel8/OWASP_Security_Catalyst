<%@page  isErrorPage="true"%>

<%@include file="classes/template.jsp"%>

<%

session.invalidate();
Template objTemplate=new Template();


String Data="<h2>ERROR!!!!!!!!!!</h2><br><br>Page Not Found Click <a href=index.jsp>Here</a> To Go Home ";
	


out.println(objTemplate.genPage(Data,false));




%>

