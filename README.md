---------------------------------
OWASP Security Catalyst  
---------------------------------

OWASP Security Catalyst (TMS-JAVA-SECURE) is a Non - Vulnerable Web 
Application developed in JAVA/MySQL or JAVA/ORACLE. Its main goal is to help 
developers be able to pick up security libraries from our secure version of 
the applications, to use them in their own applications and projects.

The aim of OWASP Security Catalyst (TMS-JAVA-SECURE) version is that the developers 
will very easily be able to compare the vulnerable code with the secure code, 
from the secure version of the same application.

Thank you for downloading TMS_Secure from OWASP_Security_Catalyst!

This program is the demonstration of the implementation of 
OWASP's secure design and development guidelines as 
working application in JAVA programming language.

You can find more information about TMS_VULNERABLE at:
https://www.owasp.org/index.php/OWASP_Security_Catalyst

---------------------------------
Prerequisites for Developers  
---------------------------------

These tools must be installed:
- Java 1.6
    Java can ne downloaded at http://java.sun.com/javase/downloads/index.jsp
	You only need to download and install the "Java SE Development Kit (JDK)"
- TMS_SECURE source code
    TMS_SECURE source code can be downloaded at: 
          https://github.com/rachnagoel8/OWASP_Security_Catalyst/tree/TMS-JAVA-INSECURE
    
-------------------------------------------------------------------
Option 1: (Developers) Run the project on Tomcat within Eclipse
-------------------------------------------------------------------

Install a local Tomcat server (We use Tomcat 7)
1. Download and unzip Apache Tomcat from http://tomcat.apache.org. 
2. Open Eclipse (WTP version) -> File -> New -> Other -> Server -> Apache
3. Choose your Tomcat version
-> Click next "browse" to your tomcat install.
-> Make sure the "JRE" dropdown is pointing to your jdk. If it isn't listed, press
"Installed JREs" and add it.
-> Click next and add "TMS_SECURE" to the list of configured applications
-> Finish

4. Right Click on the project within eclipse -> Run As -> Run on server 
5. Execute the Queries mentioned in scripts.txt

Point your browser to http://localhost:8080/TMS_SECURE

------------------------------------------------------------------
Option 2: Using the  TMS_SECURE Folder Directly
------------------------------------------------------------------

Windows:

1. Download and install Java 1.6 and Tomcat 7 if needed
2. Download the TMS_SECURE and README file and scripts.txt from:
    - https://github.com/rachnagoel8/OWASP_Security_Catalyst/tree/TMS-JAVA-SECURE
3. Copy TMS_SECURE to <tomcat>/webapps/
4. Execute the Queries mentioned in scripts.txt
5. Start the tomcat server (default is usually port 8080)
6. Browse to http://localhost:8080/TMS_SECURE
7. Login to the TMS application using the User ID and password you created in the table.
(Username is admin and password is secure123)

