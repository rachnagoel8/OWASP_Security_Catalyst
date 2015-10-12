<%@include file="classes/user.jsp"%>
<%@include file="classes/template.jsp"%>

<%@ page import="java.util.*,java.io.*,java.sql.*,javax.servlet.http.HttpServletRequest,javax.servlet.ServletInputStream" %>  
<%@ page import="java.io.FileWriter,java.io.IOException" %>  
<%      String Data="";
        Template objTemplate=new Template();
        User objUser=new User();
		String savePath = "", filepath = "", filename = "";  
		String contentType = "", fileData = "", strLocalFileName = "";  
		int startPos = 0, endPos = 0;  
		int BOF = 0, EOF = 0;  
%>  
<%!  
		//copy specified number of bytes from main data buffer to temp data buffer  
		void copyByte(byte [] fromBytes, byte [] toBytes, int start, int len)  
		{  
			for(int i=start;i<(start+len);i++) 
                { 
                    toBytes[i-start]=fromBytes[i]; 

                }  
		}  
%>  
<%	  
		contentType = request.getContentType();  
		//out.println("<br>Content type is :: " +contentType);  
		if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))   
			{  
				DataInputStream in = new DataInputStream(request.getInputStream());  
				DataInputStream in1 = in;  
				int formDataLength = request.getContentLength();  
				byte dataBytes[] = new byte[formDataLength];  
				int byteRead = 0;  
				int totalBytesRead = 0;  
				
				while (totalBytesRead < formDataLength)  
					{	  
						byteRead = in1.read(dataBytes, totalBytesRead, formDataLength);  
						totalBytesRead += byteRead;  
					}	  
		
				byte[] line = new byte[128];  
				if (totalBytesRead < 3)	  
				{  
					return;	  
				}  
  
				String boundary = "";  
				String s = "";  
				int count = 0;		  
				int pos = 0;  
		  
				//loop for extracting boundry of file  
				//could also be extracted from request.getContentType()  
		
				do  
				{  
					copyByte(dataBytes, line, count ,1);	//read 1 byte at a time  
					count+=1;  
					s = new String(line, 0, 1);  
					fileData = fileData + s;  
					pos = fileData.indexOf("Content-Disposition: form-data; name=\""); //set the file name  
					if(pos != -1)  
					endPos = pos;  
				}while(pos == -1);  
		
				boundary = fileData.substring(startPos, endPos);  
  
				//loop for extracting filename  
				startPos = endPos;  
				
				do  
				{  
					copyByte(dataBytes, line, count ,1);	//read 1 byte at a time  
					count+=1;  
					s = new String(line, 0, 1);  
					fileData = fileData + s;  
					pos = fileData.indexOf("filename=\"", startPos); //set the file name  
			
					if(pos != -1)  
					startPos = pos;  
				}while(pos == -1);					  
		
				do  
				{  
					copyByte(dataBytes, line, count ,1);	//read 1 byte at a time  
					count+=1;  
					s = new String(line, 0, 1);  
					fileData = fileData + s;  
					pos = fileData.indexOf("Content-Type: ", startPos);  
					
					if(pos != -1)  
					endPos = pos;						  
				}while(pos == -1);  
		
				filename = fileData.substring(startPos + 10, endPos - 3);	//to eliminate " from start & end  
				strLocalFileName = filename;  
				int index = filename.lastIndexOf("\\");  
		
				if(index != -1)  
					filename = filename.substring(index + 1);  
				else  
					filename = filename;  
		  
				//loop for extracting ContentType  
				boolean blnNewlnFlag = false;  
				startPos = endPos;	//added length of "Content-Type: "  
				do  
				{  
					copyByte(dataBytes, line, count ,1);	//read 1 byte at a time  
				count+=1;  
				s = new String(line, 0, 1);  
				fileData = fileData + s;			  
				pos = fileData.indexOf("\n", startPos);  
				if(pos != -1)  
				{  
					if(blnNewlnFlag == true)  
					endPos = pos;					  
				else  
				{  
					blnNewlnFlag = true;  
					pos = -1;  
				}  
				}  
		}while(pos == -1);  
		
		contentType = fileData.substring(startPos + 14, endPos);  
		  
		//loop for extracting actual file data (any type of file)  
		BOF = count + 1;  
		do  
		{  
			copyByte(dataBytes, line, count ,1);	//read 1 byte at a time  
			count+=1;  
			s = new String(line, 0, 1);  
			fileData = fileData + s;  
			pos = fileData.indexOf(boundary, startPos);	//check for end of file data i.e boundry value			  
		}while(pos == -1);  
		
		EOF = count - boundary.length();  
		
  
		 
		String appPath = application.getRealPath("/");
		String destFolder = appPath + "uploads\\";	//change this as required  
		
		String name=filename;
		StringTokenizer st=new StringTokenizer(name,".");
		String extension="";
		while(st.hasMoreTokens())
			{		
				 extension=st.nextToken();
			}

		filename=session.getId()+"."+extension;
		String filenameDB=filename;
		filename= destFolder + filename;  
		FileOutputStream fileOut = new FileOutputStream(filename);  
		fileOut.write(dataBytes, BOF, (EOF - BOF));  
		fileOut.flush();  
		fileOut.close();  
		  
        Data="Pic Uploaded Successfully!!!";
		Data+="<br>File saved as "+ filenameDB;
		objUser.addPic(session.getAttribute("UserID").toString(), filenameDB);
		out.println(objTemplate.genPage(Data,true));
        
        }  
	else  
		{  
			out.println("Error in uploading ");  
		}  
	  
%> 