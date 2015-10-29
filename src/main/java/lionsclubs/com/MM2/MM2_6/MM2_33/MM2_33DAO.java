package lionsclubs.com.MM2.MM2_6.MM2_33;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_33DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM2.MM2_6.MM2_33.";

	@SuppressWarnings("unchecked")
	public List<MM2_33VO> classItemCode(MM2_33VO vo) throws Exception {
		return list(commonId + "classItemCode", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM2_33VO> MM2_33(MM2_33VO vo) throws Exception {
		return list(commonId + "MM2_33", vo);
	}
}
