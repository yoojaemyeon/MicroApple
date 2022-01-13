package micro.apple.groupware.webDisk.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.webDisk.vo.WebDiskVO;

@Mapper
public interface WebDiskMapper {
	
	/**폴더 생성*/
	public int insertFolder(Map<String, Object> param);
	
	/**폴더 수정*/
	public int updateFolder(Map<String, Object> map);
	
	/**폴더 삭제*/
	public int deleteFolder(WebDiskVO webIdx);
	
	/**jstree 폴더*/
	public List<Map<String, Object>> getFolderList(Map<String, Object> param);
	
	public List<Map<String, Object>> getFileList(Map<String, Object> param);
	
	/**파일업로드*/
	public void uploadFile(WebDiskVO webDiskVO);
	
	/** 파일삭제 */
	public int deleteFile(WebDiskVO webIdx);
	
	/** 파일 상세보기 */
	public String selectFileDetail(WebDiskVO vo);
	
	/** 파일  정보 불러오기  /////////////////////////// */
	public Map<String, Object> getFileInfo(String webIdx);
	
	/**파일 수정*/
	public int updateFile(WebDiskVO vo);
	
	public String convertFileSize(long fileSize);
	
	
	//파일 불러오기
//	public List<Map<String, Object>> selectFiles(int folderIdx);

	//	//폴더 불러오기
	//	public List<Map<String, Object>> selectFolder(Map<String, Object> map);

}
