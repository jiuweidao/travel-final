import java.io.File;
import java.io.IOException;


public class FileTest {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		
		/*
		 * 创建目录
		 */
	/*	File txt=new File("E:/imag.txt");
	    if (!txt.exists()) {  
	    	txt.mkdir();  
	     } */
		
		
		
		/*File txt=new File("E:/88/imag.txt");
		if (!txt.exists()) {  
			txt.mkdir();  
		} */
		
		/*File txt=new File("E:/log1.txt");
        if(!txt.exists()){  
            txt.createNewFile();  

       }  */
		
		/*File txt=new File("E:/77/imag77.txt");
		if (!txt.exists()) {  
		    txt.mkdirs();  
		}*/
		
		
		File f = new File("E:/a/b/test.txt");
		if (!f.exists()) {
			f.getParentFile().mkdirs();
			f.createNewFile();
		}
	}

}
