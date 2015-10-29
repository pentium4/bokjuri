package lionsclubs.com.MM3.MM3_12.MM3_51;

import java.util.List;


public interface MM3_51Service {
	public List<MM3_51VO> listDeposit(MM3_51VO vo) throws Exception;

	public MM3_51VO objectDeposit(MM3_51VO vo) throws Exception;

	public String saveDeposit(MM3_51VO vo) throws Exception;
	
	public Integer deleteDeposit(MM3_51VO vo) throws Exception;
	
	public MM3_51VO sumDeposit(MM3_51VO vo) throws Exception;

	public String updateWithdraw(MM3_51VO vo) throws Exception;
	
	public String updateWithdrawCancel(MM3_51VO vo) throws Exception;	
}
