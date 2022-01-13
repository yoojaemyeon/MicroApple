package micro.apple.groupware.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class memberCriteria {
	private int pageNum; // 페이지 번호
	private int amount; //한 페이지당 데이터 개수
	private String memDvsn;
	
	
	
	public memberCriteria() {
		this(1,10); //기본 값을 1페이지 10개
	}
	
	public memberCriteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}



