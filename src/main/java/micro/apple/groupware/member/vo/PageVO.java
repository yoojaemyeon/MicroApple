package micro.apple.groupware.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO{
	
    private int startPage;
    private int endPage;
    
    private boolean prev,next;
    //페이지 번호(pageNum), 데이터수(amount)
    private int total;
    private memberCriteria cri;
    
    public PageVO(memberCriteria cri,int total){
    	this.cri =cri;
        this.total = total;
        
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        this.startPage = this.endPage - 9;
        
        int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
        
        if(realEnd < this.endPage){
        	this.endPage = realEnd;
        }
        if(startPage <= 0) startPage = 1;
        
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
		
    }
 }