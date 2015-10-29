package lionsclubs.com.MM3.MM3_7.MM3_34;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_34DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_7.MM3_34.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_34VO> List(MM3_34VO vo) throws Exception{
		return list(commonId + "List", vo);
	}
	
	public MM3_34VO sum(MM3_34VO vo) throws Exception{
		return (MM3_34VO) selectByPk(commonId + "sum", vo);
	}
}
