package micro.apple.groupware.mail.mapper;

import java.util.List;


import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import micro.apple.groupware.mail.vo.AttachFileVO;
import micro.apple.groupware.mail.vo.Criteria;
import micro.apple.groupware.mail.vo.MailVO;
import micro.apple.groupware.mail.vo.MessageDetailVO;
import micro.apple.groupware.mail.vo.MessageVO;

public interface MailMapper {
	
	int mailInsert(MailVO mailVo);

	List<MessageDetailVO> mailDetail(MessageDetailVO MDVo);
	
	int messageinsert(MessageVO messageVo);

	List<MessageVO> messageList();

	List<MessageVO> mailToMeList(Criteria cri);

	List<MessageVO> sentMailList(Criteria cri);
	
	//추가

	List<MessageVO> listSearch();

	int listCount();

	List<MessageVO> listPage(Criteria cri);

	List<MessageVO> list();

	void garbage(MessageVO messageVo);

	void messageImport(MessageVO messageVo);

	List<MessageVO> ImportList(Criteria cri);

	List<MessageVO> DeleteList(Criteria cri);

	void Restoration(MessageVO messageVo);

	void deleteComplete(MessageVO messageVo);

	void messageFileInsert(AttachFileVO attachFileVo);

	List<MessageVO> selectNm(MessageVO messageVo);

	List<MessageDetailVO> mailDetail2(MessageDetailVO mDVo);

	List<MessageDetailVO> fileSearch(MessageDetailVO mDVo);


}
