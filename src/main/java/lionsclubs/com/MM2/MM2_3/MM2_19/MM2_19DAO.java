package lionsclubs.com.MM2.MM2_3.MM2_19;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_19DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_3.MM2_19.";

	public MM2_19VO MM2_19(MM2_19VO vo){
		return (MM2_19VO)selectByPk(commonId + "MM2_19", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_19VO> List(MM2_19VO vo) throws Exception {
		return list(commonId + "List", vo);
	}
	
	public void otherIncomeInsert(MM2_19VO vo) throws Exception {
		insert(commonId + "otherIncomeInsert", vo);
	}
	
	public Integer otherIncomeUpdate(MM2_19VO vo) throws Exception {
		return update(commonId + "otherIncomeUpdate", vo);
	}

	public Integer otherIncomeDelete(MM2_19VO vo) throws Exception {
		return update(commonId + "otherIncomeDelete", vo);
	}

	public MM2_19VO paymentSum(MM2_19VO vo) throws Exception {
		return (MM2_19VO)selectByPk(commonId + "paymentSum", vo);
	} 
	
	public MM2_19VO duplicateCheck(MM2_19VO vo) throws Exception {
		return (MM2_19VO)selectByPk(commonId + "duplicateCheck", vo);
	} 
}
