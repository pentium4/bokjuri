package lionsclubs.com.MM2.MM2_4.MM2_28;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_28DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_4.MM2_28.";
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIncomeHead(MM2_28VO vo) throws Exception {
		return list(commonId + "selectIncomeHead", vo);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIncome(MM2_28VO vo) throws Exception {
		return list(commonId + "selectIncome", vo);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectIncomeSum(MM2_28VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "selectIncomeSum", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDefectHead(MM2_28VO vo) throws Exception {
		return list(commonId + "selectDefectHead", vo);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDefect(MM2_28VO vo) throws Exception {
		return list(commonId + "selectDefect", vo);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDefectSum(MM2_28VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "selectDefectSum", vo);
	}	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDebtHead(MM2_28VO vo) throws Exception {
		return list(commonId + "selectDebtHead", vo);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDebt(MM2_28VO vo) throws Exception {
		return list(commonId + "selectDebt", vo);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDebtSum(MM2_28VO vo) throws Exception {
		return (Map<String, Object>)selectByPk(commonId + "selectDebtSum", vo);
	}
}