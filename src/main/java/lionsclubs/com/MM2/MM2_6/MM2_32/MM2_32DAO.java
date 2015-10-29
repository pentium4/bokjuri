package lionsclubs.com.MM2.MM2_6.MM2_32;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_32DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM2.MM2_6.MM2_32.";

	@SuppressWarnings("unchecked")
	public List<MM2_32VO> classItemCode(MM2_32VO vo) throws Exception {
		return list(commonId + "classItemCode", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM2_32VO> MM2_32(MM2_32VO vo) throws Exception {
		return list(commonId + "MM2_32", vo);
	}
}
