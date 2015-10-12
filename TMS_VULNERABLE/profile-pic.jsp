<%@include file="classes/user.jsp"%>
<%@include file="classes/template.jsp"%>

<%

Template objTemplate =new Template();

String Data="<form method=\"post\" action=\"fileUpload.jsp\" name=\"upform\" enctype=\"multipart/form-data\">"+ 
			"<table width=\"60%\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\" align=\"center\" class=\"style1\">"+   
			"<tr>"+   
			"<td align=\"left\"><b>Select a file to upload :</b></td>"+   
			"</tr>"+   
			"<tr>"+   
			"<td align=\"left\">"+   
			"<input type=\"file\" name=\"uplodfile\" size=\"50\">"+   
			"</td>"+   
			"</tr>"+   
			"<tr>"+   
			"<td align=\"left\">"+   
			"<input type=\"hidden\" name=\"todo\" value=\"upload\">"+   
			"<input type=\"submit\" name=\"Submit\" value=\"Upload\">"+   
			"<input type=\"reset\" name=\"Reset\" value=\"Cancel\">"+   
			"</td>"+   
			"</tr>"+   
			"</table>"+     
			"</form>"+   
			"</body>"+   
			"</html>";


 out.println(objTemplate.genPage(Data,true));
%>