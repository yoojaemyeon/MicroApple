package micro.apple.groupware.mail.service.impl;

import java.util.List;



import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import micro.apple.groupware.mail.mapper.MailMapper;
import micro.apple.groupware.mail.service.MailService;
import micro.apple.groupware.mail.vo.AttachFileVO;
import micro.apple.groupware.mail.vo.Criteria;
import micro.apple.groupware.mail.vo.MailVO;
import micro.apple.groupware.mail.vo.MessageDetailVO;
import micro.apple.groupware.mail.vo.MessageVO;
import micro.apple.groupware.mail.vo.SearchCriteria;

@Service
public class MailServiceImpl implements MailService {
	@Autowired
	MailMapper mailMapper;
	
	@Override
	public int mailInsert(MailVO mailVo) throws Exception{
		System.out.println("서비스 임플 여긴되나??");
		return this.mailMapper.mailInsert(mailVo);
	}


	@Override
	public List<MessageDetailVO> MailDetail(MessageDetailVO MDVo) {
		return this.mailMapper.mailDetail(MDVo);
	}

	
	@Override
	public int messageinsert(MessageVO messageVo) throws Exception{
		System.out.println("서비스 임플 여긴되나??");
		System.out.println(messageVo.toString());
		return this.mailMapper.messageinsert(messageVo);
	}



	@Override
	public List<MessageVO> mailToMeList(Criteria cri) {
		return this.mailMapper.mailToMeList(cri);
	}


	@Override
	public List<MessageVO> sentMailList(Criteria cri) {
		return this.mailMapper.sentMailList(cri);
	}


	@Override
	public List<MessageVO> messageList() {
		return this.mailMapper.messageList();
	}

//추가


	@Override
	public List<MessageVO> listPage(Criteria cri) {
		return this.mailMapper.listPage(cri);
	}


	@Override
	public int listCount() {
		return this.mailMapper.listCount();
	}


	@Override
	public List<MessageVO> listSearch(SearchCriteria scri) {
		return this.mailMapper.listSearch();
	}


	@Override
	public List<MessageVO> list() {
		return this.mailMapper.list();
	}


	@Override
	public void garbage(MessageVO messageVo) {
		this.mailMapper.garbage(messageVo);
	}

	@Override
	public void messageImport(MessageVO messageVo) {
		this.mailMapper.messageImport(messageVo);
	}
	
	@Override
	public void Restoration(MessageVO messageVo) {
		this.mailMapper.Restoration(messageVo);
	}


	@Override
	public List<MessageVO> ImportList(Criteria cri) {
		return this.mailMapper.ImportList(cri);
	}


	@Override
	public List<MessageVO> DeleteList(Criteria cri) {
		return this.mailMapper.DeleteList(cri);
	}


	@Override
	public void deleteComplete(MessageVO messageVo) {
		this.mailMapper.deleteComplete(messageVo);
	}


	@Override
	public void messageFileInsert(AttachFileVO attachFileVo) {
		this.mailMapper.messageFileInsert(attachFileVo);
	}


	@Override
	public List<MessageVO> selectNm(MessageVO messageVo) {
		return mailMapper.selectNm(messageVo);
	}


	@Override
	public List<MessageDetailVO> mailDetail2(MessageDetailVO mDVo) {
		return mailMapper.mailDetail2(mDVo);
	}


	@Override
	public List<MessageDetailVO> fileSearch(MessageDetailVO mDVo) {
		return mailMapper.fileSearch(mDVo);
	}




	



}
