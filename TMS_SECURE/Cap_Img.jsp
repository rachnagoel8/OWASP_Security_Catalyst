<%@ page import="java.io.*" %>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.util.*"%>


<%
int width=75;
int height=35;


Random rdm=new Random();  //Random class is used to generate a random number
int rl=rdm.nextInt();    //this line will generate a random integer number


        

String hash1 = Integer.toHexString(rl); //Integer is converted into hexadecimal String



String capstr=hash1.substring(0,5); // substring method is used to generate a substring from the existing string 


Color background = new Color(100,14,50);  //this line is use to set background color of the captcha image

Color fbl = new Color(200,140,50);    // use to set the color of the captcha string

Font fnt=new Font("Garamond",2,17);  // this is used to set the font of a captcha image..first argument is the font type,second is used for style and third is font size

BufferedImage cpimg =new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

Graphics g = cpimg.createGraphics();

g.setColor(background);

g.fillRect(0,0,width,height);

g.setColor(fbl);

g.setFont(fnt);

g.drawString(capstr,10,25);

g.setColor(background);

g.drawLine(10,17,80,17);

g.drawLine(10,22,80,22);


response.setContentType("image/jpeg");

OutputStream strm = response.getOutputStream();

ImageIO.write(cpimg,"jpeg",strm);
strm.close();


session.setAttribute("key",capstr);

%>
