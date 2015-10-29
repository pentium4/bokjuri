package lionsclubs.com.MM2.MM2_1.MM2_09;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_09DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_09.";
	
	@SuppressWarnings("unchecked")
	public List<MM2_09VO> List(MM2_09VO vo) throws Exception {
		return list(commonId + "List", vo);
	}
}
