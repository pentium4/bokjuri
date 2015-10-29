package lionsclubs.com.MM3.MM3_12.MM3_47;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_47DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_47.";
	
	/**
	 * 수입항목별금액조회 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_47VO> MM3_47(MM3_47VO vo) throws Exception {
		return list(commonId + "MM3_47", vo);
	} 
	
	public MM3_47VO sum(MM3_47VO vo) throws Exception {
		return (MM3_47VO) selectByPk(commonId + "sum", vo);
	}	
}
