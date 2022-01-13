package micro.apple.groupware.mcaShop.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUploadUtil2 {

	private static final Logger logger = 
			LoggerFactory.getLogger(FileUploadUtil.class);
	
	public static String uploadFolder 
	//= "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\conferenceFile";
	= "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\conferenceFile";
	
	//날짜 계층형 폴더
	public static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		//str : 2021-11-02
		String str = sdf.format(date);
		//2021폴더 > 11폴더 > 02폴더
		return str.replace("-", File.separator);
	}
	
}
