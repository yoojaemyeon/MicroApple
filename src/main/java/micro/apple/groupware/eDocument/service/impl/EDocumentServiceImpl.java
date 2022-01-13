package micro.apple.groupware.eDocument.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import micro.apple.groupware.eDocument.mapper.EDocumentMapper;
import micro.apple.groupware.eDocument.service.EDocumentService;
import micro.apple.groupware.member.vo.MemberVO;

@Service
public class EDocumentServiceImpl implements EDocumentService {
	
	@Autowired
	EDocumentMapper eDocumentMapper;

	@Override
	public Map<String, Object> ajaxLineView() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> deptList = this.eDocumentMapper.getDeptList();
		
		for(Map<String, Object> deptInfo : deptList) {
			resultMap.put((deptInfo.get("DEPT_NM")).toString(), this.eDocumentMapper.getDeptMemberList(Integer.parseInt((deptInfo.get("DEPT_IDX")).toString())));
		}
		
		return resultMap;
	}

	@Override
	public int ajaxSaveDocument(HttpSession session, Map<String, Object> param) {
		int result = 0;
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = (HashMap<String, Object>) mapper.readValue((String) param.get("jsonData"), Map.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		map.put("APRV_WR", ((MemberVO)session.getAttribute("MEMBERVO")).getMemNm());
		map.put("MEM_IDX", Integer.parseInt(((MemberVO)session.getAttribute("MEMBERVO")).getMemIdx()));
		
		result = this.eDocumentMapper.insertDocument(map);
		
		for(String key : ((Map<String, Object>) map.get("LINE")).keySet()) {
			Map<String, Object> p = new HashMap<String, Object>();
			p.put("AL_MEM_NM", ((Map<String, Object>)((Map<String, Object>) map.get("LINE")).get(key)).get("MEM_NM").toString());
			p.put("AL_MEM_POSITION", ((Map<String, Object>)((Map<String, Object>) map.get("LINE")).get(key)).get("POSITION_NM").toString());
			p.put("AL_ORDER", Integer.parseInt(key));
			p.put("APRV_IDX", Integer.parseInt(map.get("APRV_IDX").toString()));
			p.put("MEM_IDX", Integer.parseInt(((Map<String, Object>)((Map<String, Object>) map.get("LINE")).get(key)).get("MEM_IDX").toString()));
			this.eDocumentMapper.insertLine(p);
		}
		
		return result;
	}

	@Override
	public Map<String, Object> ajaxGetCount(HttpSession session) {
		return this.eDocumentMapper.ajaxGetCount(Integer.parseInt(((MemberVO) session.getAttribute("MEMBERVO")).getMemIdx()));
	}

	@Override
	public Map<String, Object> ajaxGetDocumentList(HttpSession session, Map<String, Object> param) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		param.put("MEM_IDX", ((MemberVO)session.getAttribute("MEMBERVO")).getMemIdx().toString());
		
		if(param.get("type").toString().equals("start") || param.get("type").toString().equals("wait")) {
			param.put("stat", "W");
		}else {
			param.put("stat", "C");
		}
		
		resultMap.put("row", this.eDocumentMapper.ajaxGetDocumentList(param));
		
		return resultMap;
	}

	@Override
	public Map<String, Object> ajaxGetDocumentInfo(HttpSession session, Map<String, Object> param) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		param.put("MEM_IDX", ((MemberVO)session.getAttribute("MEMBERVO")).getMemIdx().toString());
		
		resultMap.put("info", this.eDocumentMapper.ajaxGetDocumentInfo(param));
		resultMap.put("line", this.eDocumentMapper.ajaxGetLine(param));
		
		return resultMap;
	}

	@Override
	public Map<String, Object> ajaxDocumentConfirm(HttpSession session, Map<String, Object> param) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		System.out.println("param >> ");
		System.out.println(param);
		
		param.put("APRV_IDX", Integer.parseInt(param.get("APRV_IDX").toString()));
		
		if(this.eDocumentMapper.ajaxLineConfirm(param) == 1) resultMap.put("check", true);
		else resultMap.put("check", false);
		
		this.eDocumentMapper.ajaxDocumentConfirm(param);
		
		return resultMap;
	}

}
