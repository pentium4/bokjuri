package lionsclubs.com.MM2.MM2_1.MM2_06;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_06DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_06.";
	
	@SuppressWarnings("unchecked")
	public List<MM2_06VO> List(MM2_06VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public MM2_06VO paymentSum(MM2_06VO vo) throws Exception {
		return (MM2_06VO)selectByPk(commonId + "paymentSum", vo);
	} 
}
