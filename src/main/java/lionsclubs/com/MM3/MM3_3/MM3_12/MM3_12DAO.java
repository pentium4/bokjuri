package lionsclubs.com.MM3.MM3_3.MM3_12;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_12DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_3.MM3_12.";
	
	public List<MM3_12VO> selectList(MM3_12VO vo) {
		return (List<MM3_12VO>)list(commonId + "selectList", vo);
	}
}
