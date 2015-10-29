package lionsclubs.com.MM2.MM2_5.MM2_31;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_31DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_5.MM2_31.";

	@SuppressWarnings("unchecked")
	public List<MM2_31VO> list(MM2_31VO vo) throws Exception {
		return list(commonId + "list", vo);
	}
}
