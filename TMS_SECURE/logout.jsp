<%
session.invalidate();
out.println("<script type=\"text/javascript\">"+
"alert(\"You are successfully logged out.\");"+
"window.location=\"index.jsp\";"+
"</script>\"");
%>