package lionsclubs.com.MM2.MM2_5.MM2_30;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_30DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_5.MM2_30.";
	
	@SuppressWarnings("unchecked")
	public List<MM2_30VO> MM2_30(MM2_30VO vo) throws Exception {
		return list(commonId + "MM2_30", vo);
	}
	
	public MM2_30VO total(MM2_30VO vo) {
		return (MM2_30VO) selectByPk(commonId + "total", vo);
	}
}
