package lionsclubs.com.MM2.MM2_3.MM2_20;

import java.util.List;
import lionsclubs.com.MM2.MM2_3.MM2_20.MM2_20VO;

public interface MM2_20Service {
	public MM2_20VO MM2_20(MM2_20VO vo) throws Exception;

	public List<MM2_20VO> List(MM2_20VO vo) throws Exception;

	public void otherIncomeInsert(MM2_20VO vo) throws Exception;
	
	public Integer otherIncomeUpdate(MM2_20VO vo) throws Exception;
	
	public Integer otherIncomeDelete(MM2_20VO vo) throws Exception;
	
	public MM2_20VO paymentSum(MM2_20VO vo) throws Exception;

	public MM2_20VO duplicateCheck(MM2_20VO vo) throws Exception;
}
