package micro.apple.groupware.member.vo;


import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	private String memIdx;
	
	@NotBlank(message = " ")
	private String memId;
	
	@NotBlank(message = " ")
	private String memPw;
	
	@NotBlank(message = " ")
	private String memNm;
	
	@NotBlank(message = " ")
	private String memEm;
	
	@NotBlank(message = " ")
	private String memPh;
	
	@NotBlank(message = " ")
	private String memZipcode;
	
	@NotBlank(message = " ")
	private String memAddr1;
	
	@NotBlank(message = " ")
	private String memAddr2;
	
	private String memDvsn; 
	private String memStart;
	private String memEnd;
	private String memPicture;
	private MultipartFile multipartFile;
	
	private String memPoint;
	private String memSign;
	private String deptIdx;
	private String athrIdx;
	private String positionIdx;
	private String memDnreason;
	

	
	private String deptNm;
	private String positionNm;
	

	
	
}
