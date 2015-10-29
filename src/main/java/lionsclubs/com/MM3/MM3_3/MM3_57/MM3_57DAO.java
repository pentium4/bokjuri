package lionsclubs.com.MM3.MM3_3.MM3_57;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_57DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_3.MM3_57.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_57VO> MM3_57(MM3_57VO vo) throws Exception {
		return list(commonId + "MM3_57", vo);
	}
}
