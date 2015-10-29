package lionsclubs.com.MM2.MM2_2.MM2_15;

import java.util.List;
import lionsclubs.com.MM2.MM2_2.MM2_15.MM2_15VO;

public interface MM2_15Service {
	public MM2_15VO MM2_15(MM2_15VO vo) throws Exception;

	public List<MM2_15VO> List(MM2_15VO vo) throws Exception;

	public void otherIncomeInsert(MM2_15VO vo) throws Exception;
	
	public Integer otherIncomeUpdate(MM2_15VO vo) throws Exception;
	
	public Integer otherIncomeDelete(MM2_15VO vo) throws Exception;
	
	public MM2_15VO paymentSum(MM2_15VO vo) throws Exception;

	public MM2_15VO paymentDate(MM2_15VO vo) throws Exception;

	public Boolean selectClosedMonthFlag(MM2_15VO_CLOSE_PARAM vo) throws Exception;
}
