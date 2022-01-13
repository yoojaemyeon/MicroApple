package micro.apple.groupware.webDisk.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.webDisk.controller.WebDiskController;
import micro.apple.groupware.webDisk.mapper.WebDiskMapper;
import micro.apple.groupware.webDisk.service.WebDiskService;
import micro.apple.groupware.webDisk.vo.WebDiskVO;

@Service
public class WebDiskServiceImpl implements WebDiskService {

	private static final Logger logger = LoggerFactory.getLogger(WebDiskController.class);
	
	@Autowired
	private WebDiskMapper webDiskMapper;
	
	/**폴더 생성*/
	@Override
	public int insertFolder(Map<String, Object> param) {
		int result = 0;
		if(param.get("webRead") == null) {
			param.put("webRead", "N");
		}
		if(param.get("webWrite") == null) {
			param.put("webWrite", "N");
		}
		result = this.webDiskMapper.insertFolder(param);
		
		return result;
	}
	
	/**폴더 수정*/
	@Override
	public int updateFolder(Map<String, Object> map) {
		int result = 0;
		WebDiskVO folderInfo = new WebDiskVO();
		folderInfo.setWebIdx((String)map.get("webIdx2"));
		folderInfo.setWebNm((String)map.get("webNm2"));
		folderInfo.setWebExpl((String)map.get("webExpl2"));
		folderInfo.setWebRead((String)map.get("webRead"));
		folderInfo.setWebWrite((String)map.get("webWrite"));
		
		result = this.webDiskMapper.updateFolder(map);
		
		return result;
	}
	/**폴더 삭제*/
	@Override
	public int deleteFolder(WebDiskVO webIdx) {
		return this.webDiskMapper.deleteFolder(webIdx);
	}

	/** 폴더 트리구조 */ 
	@Override
	public List<Map<String, Object>> getJSTree(int memIdx) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("memIdx", memIdx);
		param.put("webUptoIdx", 0);
		List<Map<String, Object>> list = researchJSTree(param, new ArrayList<Map<String, Object>>());
		return list;
	}
	//	"id" : "ajson1", "parent" : "#", "text" : "Simple root node"
	private List<Map<String, Object>> researchJSTree(Map<String, Object> param, List<Map<String, Object>> list){
		List<Map<String, Object>> tmpList = this.webDiskMapper.getFolderList(param);
		Map<String, Object> tmpMap = new HashMap<String, Object>();
		
		boolean flag = false;
		if(Integer.parseInt(param.get("webUptoIdx").toString()) == 0) flag = true;
		
		for(Map<String, Object> item : tmpList) {
//			System.out.println(item);
			
			tmpMap = new HashMap<String, Object>();
			tmpMap.put("WEB_IDX", item.get("WEB_IDX"));
			tmpMap.put("WEB_NM", item.get("WEB_NM"));
			tmpMap.put("WEB_EXPL", item.get("WEB_EXPL"));
			
			tmpMap.put("id", "WEB_IDX_"+item.get("WEB_IDX"));
			tmpMap.put("text", item.get("WEB_NM"));
			
			if(flag) tmpMap.put("parent", "#");
			else tmpMap.put("parent", "WEB_IDX_"+item.get("WEB_UPTO_IDX"));
			
			list.add(tmpMap);
			
			if(Integer.parseInt(item.get("CNT").toString()) > 0) {
				param.replace("webUptoIdx", item.get("WEB_IDX"));
				researchJSTree(param, list);
			}
		}
		return list;
	}
	/** 파일,폴더 tree contents*/
	@Override
	public Map<String, Object> ajaxGetContents(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println(param);
		result.put("FOLDER_LIST", this.webDiskMapper.getFolderList(param));
		result.put("FILE_LIST", this.webDiskMapper.getFileList(param));
		
		return result;
	}
	
	/** 파일업로드
	 * @throws IOException 
	 * @throws IllegalStateException */
	@Override
	public void uploadFile(WebDiskVO webDiskVO, MultipartFile multiFile) throws Exception {
		//강주희 폴더
		//String filePath = "C:\\ddit\\JspSpring\\MicroApple\\src\\main\\webapp\\resources\\webDiskFile";
		//유재면 폴더		 
		String filePath = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\webDiskFile"; 
		
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "_" + multiFile.getOriginalFilename();
		
		File saveFile = new File(filePath, fileName);
		
		multiFile.transferTo(saveFile);
		webDiskVO.setWebSaveNm(saveFile.getName());
//		webDiskVO.setWebOriginNm(saveFile.getName());
		webDiskMapper.uploadFile(webDiskVO);
	}
	
	/** 파일업로드 확장자 구하기  */
	@Override
	public String convertFileSize(long fileSize) {
        String str = "";
         
		if (fileSize >= 1024 * 1024) {
              fileSize = fileSize / (1024 * 1024);
              str = fileSize + "MB";
            }
            //KB 단위 이상일때 KB 단위로 환산
            else if (fileSize >= 1024) {
              fileSize = fileSize / 1024;
              str = fileSize + "KB";
            }
            //KB 단위보다 작을때 byte 단위로 환산
            else {
              str = fileSize + "byte";
            }
            return str;
          
	}
	
	/** 파일삭제 */
	@Override
	public int removeFile(WebDiskVO webIdx) {
		return this.webDiskMapper.deleteFile(webIdx);
	}

	/** 파일 상세보기 */
	@Override
	public String selectFileDetail(WebDiskVO vo) {
		return this.webDiskMapper.selectFileDetail(vo);
	}

	/** 파일  정보 불러오기 ///////////////////////////// */
	@Override
	public Map<String, Object> getFileInfo(String webIdx) {
		
		return this.webDiskMapper.getFileInfo(webIdx);
	}
	
	/**파일 수정*/
	public int updateFile(Map<String, Object> map) {
		int result = 0;
		WebDiskVO fileInfo = new WebDiskVO();
		fileInfo.setWebIdx((String)map.get("webIdx5"));
		fileInfo.setWebNm((String)map.get("webNm5"));
		fileInfo.setWebExpl((String)map.get("webExpl5"));
		fileInfo.setWebOriginNm((String)map.get("webOriginNm5"));
		fileInfo.setWebSaveNm((String)map.get("webSaveNm5"));
		fileInfo.setWebRead((String)map.get("webRead5"));
		fileInfo.setWebWrite((String)map.get("webWrite"));
//		
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("WEB_IDX", );
		
//		@getter, @setter사용시
//		WebDiskVO fileInfo = WebDiskVO.builder()
//				.webIdx(map.get("webIdx5").toString())
//				.webNm(map.get("webNm5").toString())
//				.webExpl(map.get("webExpl5").toString())
//				.webOriginNm(map.get("webOriginNm5").toString())
//				.webSaveNm(map.get("webSaveNm5").toString())
//				.webRead(map.get("webRead5").toString())
//				.webWrite(map.get("webWrite").toString())
//				.build();
//		logger.info("파일명  : " + fileInfo);
		
		result = this.webDiskMapper.updateFile(fileInfo);
		
		return result;
	}
	
//	//파일 불러오기
//	@Override
//	public List<Map<String, Object>> selectFiles(int folderIdx) {
//		return this.webDiskMapper.selectFiles(folderIdx);
//	}


	//	//폴더 불러오기
//	@Override
//	public List<Map<String, Object>> selectFolder(Map<String, Object> map) {
//		return this.webDiskMapper.selectFolder(map);
//	}

}
