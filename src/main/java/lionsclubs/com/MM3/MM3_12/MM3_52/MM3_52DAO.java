package lionsclubs.com.MM3.MM3_12.MM3_52;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_52DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_52.";

	@SuppressWarnings("unchecked")
	public List<MM3_52VO> MM3_52(MM3_52VO vo) throws Exception {
		return list(commonId + "MM3_52", vo);
	}

	public MM3_52VO sum(MM3_52VO vo){
		return (MM3_52VO)selectByPk(commonId + "sum", vo);
	}
}
