<%
final String role=String.valueOf(session.getAttribute("Role"));
         
class Template
 {  
    public  String navMenu()
		{
        
			String menu="<ul id=\"navmenu-h\">"+
						"<li><a href=\"#\">My Profile</a>"+
						"<ul>"+
						"<li><a href=\"view-user.jsp\">View Profile</a></li>"+
						"<li><a href=\"edit-user.jsp\">Edit Profile</a></li>"+
                        "<li><a href=\"profile-pic.jsp\">Add Profile pic</a></li>"+
                        "<li><a href=\"enrolled-course.jsp\">Enrolled Courses</a></li>"+
						"<li><a href=\"change-password.jsp\">Change Password</a></li>"+
						"<li><a href=\"change-security.jsp\">Account Security</a></li>"+
						"</ul>"+
						"</li>";
      
					if(role.equals("Admin"))
						{
						menu+="<li><a href=\"#\">Manager Users</a>"+
						"<ul>"+
						"<li><a href=\"add-user.jsp\">Add User</a></li>"+
						"<li><a href=\"view-user.jsp?id=all\">View All Users</a></li>"+
						"</ul>"+
						"</li>"+
						"<li><a href=\"#\">Manage Courses</a>"+
						"<ul>"+
						"<li><a href=\"add-course.jsp\">Add Course</a></li>"+
						"<li><a href=\"view-course.jsp\">View Courses</a></li>"+
                        "<li><a href=\"assign-course.jsp\">Assign Courses</a></li>"+
						"<li><a href=\"unassign-course.jsp\">Unassign Courses</a></li>"+
						"</ul>"+
						"</li>";        
						}    
                        menu+="<li><a href=\"logout.jsp\">Logout</a>"+
						"</li>"+
						"</ul>"+"";
                
                
					return menu;
		}
   
    public String genPage(String content,boolean menu)
        {
			if(menu)
				{
					String page="<html><head>"+
								"<link rel=\"stylesheet\" href=\"style/style.css\" type=\"text/css\" media=\"screen\" />"+
								"<script type=\"text/javascript\" src=\"scripts/ajax.js\"></script>"+
								"</head><body>"+
								"<div class=wrapper>"+
								"<div class=head>"+
								"<div class=heading>"+
								"<h1>Training Management System</h1>"+
								"</div>"+
                                navMenu()+"</div>"+
                                "<div class=content>"+content+
                                "</div>"+
                                "<div class=foot>"+
                                " Powered by <a style=\"color:#FFFFFF;\" href=\"\">OWASP Security Catalyst</a>"+
								"</div>"+
								"</div>"+
								"</body>"+
								"</html>"+"";
                                         
					return page;
                }
			else
                {
					String page="<html>"+
								"<link rel=\"stylesheet\" href=\"style/style.css\" type=\"text/css\" media=\"screen\" />"+
								"<body>"+
								"<div class=wrapper>"+
								"<div class=head>"+
								"<div class=heading>"+
								"<h1>Training Management System</h1>"+
								"</div>"+
                                "</div>"+
                                "<div class=content>"+content+
                                "</div>"+
                                "<div class=foot>"+
                                " Powered by <a style=\"color:#FFFFFF;\" href=\"#\">OWASP Security Catalyst</a>"+
								"</div>"+
								"</div>"+
								"</body>"+
								"</html>"+"";
                                         
                        return page;
                }
       
		}   
	}
%>