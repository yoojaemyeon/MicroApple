package micro.apple.groupware.mail.service;

import java.util.List;


import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import micro.apple.groupware.mail.vo.AttachFileVO;
import micro.apple.groupware.mail.vo.Criteria;
import micro.apple.groupware.mail.vo.MailVO;
import micro.apple.groupware.mail.vo.MessageDetailVO;
import micro.apple.groupware.mail.vo.MessageVO;
import micro.apple.groupware.mail.vo.SearchCriteria;

public interface MailService {

	public int mailInsert(MailVO mailVo) throws Exception;

//	public MessageDetailVO MailDetail(MessageDetailVO MDVo);
	public List<MessageDetailVO> MailDetail(MessageDetailVO MDVo);

	public int messageinsert(MessageVO messagVo) throws Exception;


	public List<MessageVO> mailToMeList(Criteria cri);
	
	public List<MessageVO> sentMailList(Criteria cri);

	public List<MessageVO> messageList();


	public List<MessageVO> listPage(Criteria cri);

	public int listCount();

	public List<MessageVO> listSearch(SearchCriteria scri);

	public List<MessageVO> list();

	public void garbage(MessageVO messageVo);

	public void messageImport(MessageVO messageVo);

	public List<MessageVO> ImportList(Criteria cri);

	public List<MessageVO> DeleteList(Criteria cri);

	public void Restoration(MessageVO messageVo);

	public void deleteComplete(MessageVO messageVo);

	public void messageFileInsert(AttachFileVO attachFileVo);

	public List<MessageVO> selectNm(MessageVO messageVo);

	public List<MessageDetailVO> mailDetail2(MessageDetailVO mDVo);

	public List<MessageDetailVO> fileSearch(MessageDetailVO mDVo);

	
	
}
