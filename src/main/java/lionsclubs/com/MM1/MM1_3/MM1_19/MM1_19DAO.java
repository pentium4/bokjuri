package lionsclubs.com.MM1.MM1_3.MM1_19;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_19DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_3.MM1_19.";

	@SuppressWarnings("unchecked")
	public List<MM1_19VO> MM1_19(MM1_19VO vo) throws Exception {
		return list(commonId + "MM1_19", vo);
	}
}
