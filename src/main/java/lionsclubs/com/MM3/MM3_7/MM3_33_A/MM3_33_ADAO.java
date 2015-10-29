package lionsclubs.com.MM3.MM3_7.MM3_33_A;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_33_ADAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_7.MM3_33_A.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_33_AVO> List(MM3_33_AVO vo) throws Exception{
		return list(commonId + "List", vo);
	}

	public MM3_33_AVO sum(MM3_33_AVO vo) throws Exception{
		return (MM3_33_AVO) selectByPk(commonId + "sum", vo);
	}
}
