package micro.apple.groupware.eDocument.mapper;

import java.util.List;
import java.util.Map;

public interface EDocumentMapper {

	List<Map<String, Object>> getDeptList();

	List<Map<String, Object>> getDeptMemberList(int deptIdx);

	int insertDocument(Map<String, Object> param);

	int insertLine(Map<String, Object> p);

	Map<String, Object> ajaxGetCount(int memIdx);

	List<Map<String, Object>> ajaxGetDocumentList(Map<String, Object> param);

	Map<String, Object> ajaxGetDocumentInfo(Map<String, Object> param);
	
	List<Map<String, Object>> ajaxGetLine(Map<String, Object> param);

	int ajaxDocumentConfirm(Map<String, Object> param);

	int ajaxLineConfirm(Map<String, Object> param);

}
