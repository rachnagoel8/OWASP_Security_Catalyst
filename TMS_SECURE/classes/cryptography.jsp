<%@page  language="Java" import="java.security.*" %>
<%@ page language="Java" import="javax.crypto.*" %>
<%@ page language="Java" import="javax.crypto.spec.*" %>
<%@ page language="Java" import="sun.misc.BASE64Decoder" %>
<%@ page language="Java" import="sun.misc.BASE64Encoder" %>

<%

class Cryptography
	{
		public String byteToString(byte[] Text)
			{
				StringBuffer buf = new StringBuffer();
           
				for (int i = 0; i <Text.length; i++)
					{         
						if(((int) Text[i] & 0xff) < 0x10)
							{             
								buf.append("0");
							}
                
						buf.append(Long.toString((int) Text[i] & 0xff, 16));

					}

				return buf.toString(); 

			} 

public String genMD5(String Text)
	{
		byte[] unencodedPassword = Text.getBytes();
        
        try
        {
			MessageDigest md=MessageDigest.getInstance("MD5"); //this class is use to provide functionality of some secure algorithms

            //MessageDigest md=MessageDigest.getInstance("SHA-1");
            //MessageDigest md=MessageDigest.getInstance("SHA-256");
            //MessageDigest md=MessageDigest.getInstance("SHA-512");

            md.reset();   //this will reset the md for futurer use
            md.update(unencodedPassword); //this will update the md with a string 

			// byte[] encodedPassword =md.digest();
            
            //System.out.println("this is encrypted password "+byteToString(md.digest()));
            return byteToString(md.digest());  //this will encrypt the string
        }
		catch(Exception e)
        {
		
        }
		
		return ""; 	
	}
    
public String genPassword(String Text)
{

	String Salt=genMD5(Text);
	return genMD5(Salt+Text);
          
}
 
  
public String encryptData(String Text) throws Exception
	{
		String key = "this_is_key12345";//must be 16 long		
		String iv =  "this_is_iv123456";//must be 16 long
        
		String result_string;
        
		//get key stuff, using given key so we can encrypt and decrypt with it
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
		IvParameterSpec ivSpec = new IvParameterSpec(iv.getBytes());
        
		//get a cipher object.
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
        
		//get the raw bytes to encrypt, UTF8 is needed for having a standard character set
		byte[] stringBytes = Text.getBytes("UTF8");
 
		//encrypt using the cypher
		byte[] raw = cipher.doFinal(stringBytes);
 
		//convert to base64 for easier display (and string like in a database)
		BASE64Encoder encoder = new BASE64Encoder();
		result_string = encoder.encode(raw);

		return result_string;
	}

public String decryptData(String Text) throws Exception
	{
		String key ="this_is_key12345";//must be 16 long
		String iv ="this_is_iv123456";//must be 16 long

		String result_string;

		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(),"AES");
		IvParameterSpec ivSpec = new IvParameterSpec(iv.getBytes());


		//get a cipher object.
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE, keySpec,ivSpec);

		//decode the BASE64 coded message
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] raw = decoder.decodeBuffer(Text);

		//decode the message
		byte[] stringBytes = cipher.doFinal(raw);

		//convert the decoded message to a String
		result_string = new String(stringBytes, "UTF8");

		return result_string;
	}
	
	}
%>