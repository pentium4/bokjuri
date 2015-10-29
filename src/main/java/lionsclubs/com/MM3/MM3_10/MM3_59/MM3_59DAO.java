package lionsclubs.com.MM3.MM3_10.MM3_59;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_59DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_10.MM3_59.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_59VO> MM3_59(MM3_59VO vo) throws Exception {
		return list(commonId + "MM3_59", vo);
	}

	public MM3_59VO sum(MM3_59VO vo) throws Exception {
		return (MM3_59VO) selectByPk(commonId + "sum", vo);
	}
	
	public MM3_59VO objectDistrictInfo(MM3_59VO vo) throws Exception {
		return (MM3_59VO) selectByPk(commonId + "objectDistrictInfo", vo);
	}
}
