<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>

<%

	class Validation
		{
            public boolean isValidUserName(String Text)
            {
              //  username should only contain characters and length should be betwwen 4-16
              Pattern pattern=Pattern.compile("^[A-Za-z0-9]{4,16}$"); //this will set a pattern 



               //Pattern pattern=Pattern.compile("^[A-Za-z0-9]{16}$");
              //for date "^([0-9]{4})-([0-9]{2})-([0-9]2)$"
              //for numeric  "^[0-9]$"
              //for string   "^([A-Z]{1})([a-zA-Z])$"
              //for text "^[a-z0-9 _.]$/i"
              //for email "^([a-z]{1})([a-z0-9_.]+)@([0-9a-z-]+).([a-z.]{2,8})$"
              //for password    "[a-z]+"
              //for password    "[A-Z]+"
              //for password    "[0-9]+"
              //for password    "[@#$%^*()_-+]"
			  
              Matcher matcher=pattern.matcher(Text);

              return matcher.matches();
            }



            public boolean isValidPassword(String Text)
            {
              //atleast one numeric ////one charater..length 4-8
              Pattern pattern=Pattern.compile("^(?=.*\\d)(?=.*[a-zA-Z]).{4,8}$");  

              Matcher matcher=pattern.matcher(Text);

              return matcher.matches();
            }


            public boolean isValidFirstName(String Text)
            {
                  //  username should only contain characters and length should be betwwen 4-16
                  Pattern pattern=Pattern.compile("^[A-Za-z]{4,16}$");  

                  Matcher matcher=pattern.matcher(Text);

              return matcher.matches();
            }


            public boolean isValidsecondName(String Text)
            {
              //  username should only contain characters and length should be betwwen 4-16
              Pattern pattern=Pattern.compile("^[A-Za-z]{4,16}$");  

              Matcher matcher=pattern.matcher(Text);

              return matcher.matches();
            }

            public boolean isValidEmailId(String Text)
              {
                  //for email "^([a-z]{1})([a-z0-9_.]+)@([0-9a-z-]+).([a-z.]{2,8})$"
                  Pattern pattern=Pattern.compile("^([a-z]{1})([a-z0-9_.]+)@([0-9a-z-]+).([a-z.]{2,8})$");

                  Matcher matcher=pattern.matcher(Text);

              return matcher.matches();
            }

            public boolean  isValidDOB(String Text)
            {

                //for date "^([0-9]{4})-([0-9]{2})-([0-9]2)$"   
				Pattern pattern=Pattern.compile("^([0-9]{4})-([0-9]{2})-([0-9]2)$");  //for date 

                Matcher matcher=pattern.matcher(Text);

				return matcher.matches();
            }    

        }        
%>
