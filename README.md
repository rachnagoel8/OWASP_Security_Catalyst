---------------------------------
OWASP Security Catalyst  
---------------------------------

OWASP Security Catalyst (TMS-JAVA-INSECURE) is a Vulnerable Web 
Application developed in JAVA/MySQL or JAVA/ORACLE. Its main goal is to 
help security professionals to test their skills and tools in a 
legal environment, help web developers better understand the 
processes of securing web applications and to aid both students & 
teachers to learn about web application security in a controlled 
class room environment.

The aim of OWASP Security Catalyst (TMS-JAVA-INSECURE) version is to practice some of 
the most common web vulnerability using a simple straightforward web application that 
is Training Management. Please note, we have try to inject OWASP Top 10 vulnerabilties 
in this application. This is intentional. You are encouraged to try and 
discover as many issues as possible.


OWASP_Security_Catalyst/TMS_VULNERABLE 1.0
October/12/2015
Home Page:    https://www.owasp.org/index.php/OWASP_Security_Catalyst
Source Code:  https://github.com/rachnagoel8/OWASP_Security_Catalyst/tree/TMS-JAVA-INSECURE

Thank you for downloading TMS_VULNERABLE from OWASP_Security_Catalyst!

This program is the demonstration of the implementation of 
OWASP's secure design and development guidelines as 
working application in JAVA programming language.
This version will highlight the application security vulnerabilities, 
and can be used for Hands-on practice for application VAPT.

You can find more information about TMS_VULNERABLE at:
https://www.owasp.org/index.php/OWASP_Security_Catalyst

---------------------------------
Prerequisites for Developers  
---------------------------------

These tools must be installed:
- Java 1.6
    Java can ne downloaded at http://java.sun.com/javase/downloads/index.jsp
	You only need to download and install the "Java SE Development Kit (JDK)"
- TMS_VULNERABLE source code
    TMS_VULNERABLE source code can be downloaded at: 
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
-> Click next and add "TMS_VULNERABLE" to the list of configured applications
-> Finish

4. Right Click on the project within eclipse -> Run As -> Run on server 

Point your browser to http://localhost:8080/TMS_VULNERABLE
** Note - When running in eclipse, the default url will be lowercase "TMS_VULNERABLE"

------------------------------------------------------------------
Option 2: Using the  TMS_VULNERABLE Folder Directly
------------------------------------------------------------------

Windows:

1. Download and install Java 1.6 and Tomcat 7 if needed
2. Download the TMS_VULNERABLE and README file from:
    - https://github.com/rachnagoel8/OWASP_Security_Catalyst/tree/TMS-JAVA-INSECURE
3. Copy TMS_VULNERABLE.war to <tomcat>/webapps/TMS_VULNERABLE.war
4. Start the tomcat server (default is usually port 8080)
5. Browse to http://localhost:8080/TMS_VULNERABLE
