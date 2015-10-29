package lionsclubs.com.MM1.MM1_1.MM1_06;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_06DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_06.";
	
	/**
	 * 회원업체조회 리스트
	 * @return
	 * @throws Exception
	 */
	public Page selectList(MM1_06VO vo) throws Exception {
		return listWithPaging(commonId + "selectList", vo);
	} 
}
