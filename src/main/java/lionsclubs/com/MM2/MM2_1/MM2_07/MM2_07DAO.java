package lionsclubs.com.MM2.MM2_1.MM2_07;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_07DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_07.";
	
	@SuppressWarnings("unchecked")
	public List<MM2_07VO> List(MM2_07VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
}
