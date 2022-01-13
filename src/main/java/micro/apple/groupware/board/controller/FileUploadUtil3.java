package micro.apple.groupware.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUploadUtil3 {

	private static final Logger logger = 
			LoggerFactory.getLogger(FileUploadUtil3.class);
	
	public static String uploadFolder 
	//한주연 폴더
//	= "D:\\A_teaching\\workspace\\microApple\\src\\main\\webapp\\resources\\announceFile";
	//유재면 폴더
	= "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\announceFile";
	
	
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
