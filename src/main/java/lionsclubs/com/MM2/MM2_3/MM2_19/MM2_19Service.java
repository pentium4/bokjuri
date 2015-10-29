package lionsclubs.com.MM2.MM2_3.MM2_19;

import java.util.List;

public interface MM2_19Service {
	public MM2_19VO MM2_19(MM2_19VO vo) throws Exception;

	public List<MM2_19VO> List(MM2_19VO vo) throws Exception;

	public void otherIncomeInsert(MM2_19VO vo) throws Exception;
	
	public Integer otherIncomeUpdate(MM2_19VO vo) throws Exception;
	
	public Integer otherIncomeDelete(MM2_19VO vo) throws Exception;
	
	public MM2_19VO paymentSum(MM2_19VO vo) throws Exception;

	public MM2_19VO duplicateCheck(MM2_19VO vo) throws Exception;
}
