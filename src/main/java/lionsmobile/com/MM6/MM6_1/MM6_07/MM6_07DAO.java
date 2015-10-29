package lionsmobile.com.MM6.MM6_1.MM6_07;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM6_07DAO extends LionsAbstractDAO{
	private String commonId = "lionsmobile.com.MM6.MM6_1.MM6_07.";
	
	/**
	 * 회원업체조회 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM6_07VO> selectList(MM6_07VO vo) throws Exception {
		return list(commonId + "selectList", vo);
	} 
}
