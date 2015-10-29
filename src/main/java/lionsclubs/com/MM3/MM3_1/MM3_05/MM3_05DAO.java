package lionsclubs.com.MM3.MM3_1.MM3_05;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_05DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_1.MM3_05.";
	
	public List<MM3_05VO> selectList(MM3_05VO vo) {
		return (List<MM3_05VO>)list(commonId + "selectList", vo);
	}
	
}
