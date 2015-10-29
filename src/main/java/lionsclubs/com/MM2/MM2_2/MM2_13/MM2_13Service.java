package lionsclubs.com.MM2.MM2_2.MM2_13;

import java.util.List;

public interface MM2_13Service {

	public MM2_13VO MM2_13(MM2_13VO vo) throws Exception;

	public MM2_13HeadVO HeadList(MM2_13HeadVO vo) throws Exception;

	public MM2_13HeadVO codeInfo(MM2_13HeadVO vo) throws Exception;

	public List<MM2_13VO> List(MM2_13VO vo) throws Exception;

	public void otherIncomeInsert(MM2_13VO vo) throws Exception;
	
	public Integer otherIncomeUpdate(MM2_13VO vo) throws Exception;
	
	public Integer otherIncomeDelete(MM2_13VO vo) throws Exception;
	
	public void calculateInsert(MM2_13VO vo) throws Exception;
	
	public MM2_13VO calculateSearch(MM2_13VO vo) throws Exception;
	
	public MM2_13VO paymentSum(MM2_13VO vo) throws Exception;
	
	public MM2_13VO paymentDate(MM2_13VO vo) throws Exception;

}
