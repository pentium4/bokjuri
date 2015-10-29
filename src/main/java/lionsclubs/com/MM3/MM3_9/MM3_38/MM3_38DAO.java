package lionsclubs.com.MM3.MM3_9.MM3_38;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_38DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_9.MM3_38.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_38VO> MM3_38(MM3_38VO vo) throws Exception{
		return list(commonId + "MM3_38", vo);
	}
	
	public Long sum(MM3_38VO vo) throws Exception{
		return (Long) selectByPk(commonId + "sum", vo);
	}
}
