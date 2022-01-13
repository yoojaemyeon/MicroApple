package micro.apple.groupware.eDocument.service;

import java.util.Map;

import javax.servlet.http.HttpSession;


public interface EDocumentService {

	Map<String, Object> ajaxLineView();

	int ajaxSaveDocument(HttpSession session, Map<String, Object> param);

	Map<String, Object> ajaxGetCount(HttpSession session);

	Map<String, Object> ajaxGetDocumentList(HttpSession session, Map<String, Object> param);

	Map<String, Object> ajaxGetDocumentInfo(HttpSession session, Map<String, Object> param);

	Map<String, Object> ajaxDocumentConfirm(HttpSession session, Map<String, Object> param);

}
