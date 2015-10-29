package lionsclubs.com.MM2.MM2_3.MM2_20;

import java.util.List;

import lionsclubs.com.MM2.MM2_3.MM2_20.MM2_20VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_20DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_3.MM2_20.";

	public MM2_20VO MM2_20(MM2_20VO vo){
		return (MM2_20VO)selectByPk(commonId + "MM2_20", vo);
	}

//	public Page List(MM2_20VO vo) throws Exception {
//		return listWithPaging(commonId + "List", vo);
//    }

	@SuppressWarnings("unchecked")
	public List<MM2_20VO> List(MM2_20VO vo) throws Exception {
		return list(commonId + "List", vo);
	}
	
	public void otherIncomeInsert(MM2_20VO vo) throws Exception {
		insert(commonId + "otherIncomeInsert", vo);
	}
	
	public Integer otherIncomeUpdate(MM2_20VO vo) throws Exception {
		return update(commonId + "otherIncomeUpdate", vo);
	}

	public Integer otherIncomeDelete(MM2_20VO vo) throws Exception {
		return update(commonId + "otherIncomeDelete", vo);
	}

	public MM2_20VO paymentSum(MM2_20VO vo) throws Exception {
		return (MM2_20VO)selectByPk(commonId + "paymentSum", vo);
	} 

	public MM2_20VO duplicateCheck(MM2_20VO vo) throws Exception {
		return (MM2_20VO)selectByPk(commonId + "duplicateCheck", vo);
	} 
}
