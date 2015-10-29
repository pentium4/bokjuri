package lionsclubs.com.MM2.MM2_2.MM2_14;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_14DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_14.";
	
	@SuppressWarnings("unchecked")
	public List<MM2_14VO> MM2_14(MM2_14VO vo) throws Exception {
		return list(commonId + "MM2_14", vo);
    }
	
	public MM2_14VO total(MM2_14VO vo) throws Exception {
		return (MM2_14VO)selectByPk(commonId + "total", vo);
    }	
	
	@SuppressWarnings("unchecked")
	public List<MM2_14VO> listImpostMember(MM2_14VO vo) throws Exception {
		return list(commonId + "listImpostMember", vo);
    }
	
	public MM2_14VO detail(MM2_14VO vo) throws Exception {
		return (MM2_14VO)selectByPk(commonId + "detail", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_14VO> listMaster(MM2_14VO vo) throws Exception {
		return list(commonId + "listMaster", vo);
	}
	
	public boolean insertIncomeExpend(MM2_14VO vo) throws Exception {
		insert(commonId + "insertIncomeExpend", vo);
		return true;
	}
	
	public Integer updateIncomeExpend(MM2_14VO vo) throws Exception {
		return update(commonId + "updateIncomeExpend", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_14VO> listPaymentMember(MM2_14VO vo) throws Exception {
		return list(commonId + "listPaymentMember", vo);
	}

	public MM2_14VO detailImpostPayment(MM2_14VO vo) throws Exception {
		return (MM2_14VO)selectByPk(commonId + "detailImpostPayment", vo);
    }
	
	public Integer deleteIncomeExpend(MM2_14VO vo) throws Exception {
		return delete(commonId + "deleteIncomeExpend", vo);
	}
}
