package lionsclubs.com.MM2.MM2_2.MM2_16;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_16DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_16.";

	public MM2_16VO MM2_16(MM2_16VO vo){
		return (MM2_16VO)selectByPk(commonId + "MM2_16", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_16VO> List(MM2_16VO vo) throws Exception {
		return list(commonId + "List", vo);
	}
	
	public String otherIncomeInsert(MM2_16VO vo) throws Exception {
		return (String) insert(commonId + "otherIncomeInsert", vo);
	}
	
	public Integer otherIncomeUpdate(MM2_16VO vo) throws Exception {
		return update(commonId + "otherIncomeUpdate", vo);
	}

	public Integer otherIncomeDelete(MM2_16VO vo) throws Exception {
		return update(commonId + "otherIncomeDelete", vo);
	}

	public MM2_16VO paymentSum(MM2_16VO vo) throws Exception {
		return (MM2_16VO)selectByPk(commonId + "paymentSum", vo);
	}

	public Boolean selectClosedMonthFlag(MM2_16VO_CLOSE_PARAM vo) throws Exception {
		Integer confirmYn = (Integer)selectByPk(commonId + "selectClosedMonthFlag", vo); 
		return (confirmYn > 0);
	} 
	
	public Integer withDraw(MM2_16VO vo) throws Exception {
		return update(commonId + "withDraw", vo);
	}
	
	public Integer withDrawCancel(MM2_16VO vo) throws Exception {
		return update(commonId + "withDrawCancel", vo);
	}
	
	public Integer deleteIncomeExpend(MM2_16VO vo) throws Exception {
		return delete(commonId + "deleteIncomeExpend", vo);
    }
	
	public boolean insertIncomeExpend(MM2_16VO vo) throws Exception {
		insert(commonId + "insertIncomeExpend", vo);
		return true;
    }	
}
