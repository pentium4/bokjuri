package lionsclubs.com.MM3.MM3_1.MM3_04;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_04DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_1.MM3_04.";
	
	/**
	 * 조회
	 * @param vo
	 * @return
	 * @throws Exception 
	 */
	public List<MM3_04VO> selectList(MM3_04VO vo) {
		return (List<MM3_04VO>)list(commonId + "selectList", vo);
	}
	
	public List<MM3_04VO> selectList2(MM3_04VO vo) {
		return (List<MM3_04VO>)list(commonId + "selectList2", vo);
	}
}
