package lionsclubs.com.MM2.MM2_1.MM2_03;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_03DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_03.";

	@SuppressWarnings("unchecked")
	public List<MM2_03VO> List(MM2_03VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
}
