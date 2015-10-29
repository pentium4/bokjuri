package lionsclubs.com.MM2.MM2_2.MM2_16;

import java.util.List;
import lionsclubs.com.MM2.MM2_2.MM2_16.MM2_16VO;

public interface MM2_16Service {
	public MM2_16VO MM2_16(MM2_16VO vo) throws Exception;

	public List<MM2_16VO> List(MM2_16VO vo) throws Exception;

	public void otherIncomeInsert(MM2_16VO vo) throws Exception;
	
	public Integer otherIncomeUpdate(MM2_16VO vo) throws Exception;
	
	public Integer otherIncomeDelete(MM2_16VO vo) throws Exception;
	
	public MM2_16VO paymentSum(MM2_16VO vo) throws Exception;

	public Boolean checkClosedMonth(String organCode, String startDate, String endDate) throws Exception;

	public String withdraw(MM2_16VO vo) throws Exception;
	
	public String withdrawCancel(MM2_16VO vo) throws Exception;
}
