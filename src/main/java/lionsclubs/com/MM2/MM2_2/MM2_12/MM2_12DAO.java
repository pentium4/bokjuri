package lionsclubs.com.MM2.MM2_2.MM2_12;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_12DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_12.";
	
	/**
	 * 수입항목별금액조회 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM2_12VO> MM2_12(MM2_12VO vo) throws Exception {
		return list(commonId + "MM2_12", vo);
	} 
	
	public MM2_12VO sum(MM2_12VO vo) throws Exception {
		return (MM2_12VO) selectByPk(commonId + "sum", vo);
	}
}
