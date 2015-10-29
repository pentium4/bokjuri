package lionsclubs.com.MM3.MM3_4.MM3_22;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_22DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_22.";

	@SuppressWarnings("unchecked")
	public List<MM3_22VO> MM3_22(MM3_22VO vo) throws Exception {
		return list(commonId + "MM3_22", vo);
	}	
	
	public Integer deleteDistrictItemPayment(MM3_22VO vo) throws Exception {
		return delete(commonId + "deleteDistrictItemPayment", vo);
	}

	public Boolean insertDistrictItemPayment(MM3_22VO vo) throws Exception {
		insert(commonId + "insertDistrictItemPayment", vo);
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<MM3_22VO> listClubPayment(MM3_22VO vo) throws Exception {
		return list(commonId + "listClubPayment", vo);
	}
}
