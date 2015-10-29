package lionsclubs.com.MM3.MM3_10.MM3_58;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_58DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_10.MM3_58.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_58VO> MM3_58(MM3_58VO vo) throws Exception {
		return list(commonId + "MM3_58", vo);
	}

	public MM3_58VO sum(MM3_58VO vo) throws Exception {
		return (MM3_58VO) selectByPk(commonId + "sum", vo);
	}
	
	public MM3_58VO objectDistrictInfo(MM3_58VO vo) throws Exception {
		return (MM3_58VO) selectByPk(commonId + "objectDistrictInfo", vo);
	}
}
