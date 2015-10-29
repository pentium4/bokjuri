package lionsclubs.com.MM3.MM3_10.MM3_36;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_36DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_10.MM3_36.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_36VO> clubMemberShip(MM3_36VO vo) throws Exception {
		return list(commonId + "clubMemberShip", vo);
	}	

	@SuppressWarnings("unchecked")
	public List<MM3_36VO> serviceStatus(MM3_36VO vo) throws Exception {
		return list(commonId + "serviceStatus", vo);
	}	

	@SuppressWarnings("unchecked")
	public List<MM3_36VO> lcifStatus(MM3_36VO vo) throws Exception {
		return list(commonId + "lcifStatus", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_36VO> serviceHistory(MM3_36VO vo) throws Exception {
		return list(commonId + "serviceHistory", vo);
	}

	public MM3_36VO reportSummary(MM3_36VO vo) throws Exception {
		return (MM3_36VO) selectByPk(commonId + "reportSummary", vo);
	}

	public MM3_36VO lcifStatusSummary(MM3_36VO vo) throws Exception {
		return (MM3_36VO) selectByPk(commonId + "lcifStatusSummary", vo);
	}
}
