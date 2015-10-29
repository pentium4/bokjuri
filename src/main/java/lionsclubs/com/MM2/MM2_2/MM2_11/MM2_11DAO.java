package lionsclubs.com.MM2.MM2_2.MM2_11;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_11DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_11.";
	
	/**
	 * 회비및납부금 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM2_11VO> selectList(MM2_11VO vo) throws Exception {
		return list(commonId + "selectList", vo);
	} 
	
	public MM2_11VO paymentSum(MM2_11VO vo) throws Exception {
		return (MM2_11VO) selectByPk(commonId + "paymentSum", vo);
	} 
	
	public String cDate(MM2_11VO vo) throws Exception {
		return (String) selectByPk(commonId + "cDate", vo);
	} 
}
