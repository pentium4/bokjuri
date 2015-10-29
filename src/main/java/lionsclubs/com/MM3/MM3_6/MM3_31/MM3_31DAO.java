package lionsclubs.com.MM3.MM3_6.MM3_31;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_31DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_6.MM3_31.";

	@SuppressWarnings("unchecked")
	public List<MM3_31VO> List(MM3_31VO vo) throws Exception {
		return list(commonId + "List", vo);
	}
}
