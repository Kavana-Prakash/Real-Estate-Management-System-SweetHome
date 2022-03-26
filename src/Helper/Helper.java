/** Copyright Kavana to present
All Rights reserved.
*/
package Helper;

import java.io.*;

public class Helper {
    public static boolean deleteFile(String path) {
    	boolean flag=false;
    	try {
    		File file=new File(path);
    		flag=file.delete();
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return flag;
    }
    public static boolean saveFile(InputStream is,String path) {
    	boolean flag=false;
    	try {
    		byte b[]=new byte[is.available()];
    		is.read(b);
    		FileOutputStream fos=new FileOutputStream(path);
    		fos.write(b);
    		fos.flush();
    		fos.close();
    		flag=true;
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return flag;
    }
}
