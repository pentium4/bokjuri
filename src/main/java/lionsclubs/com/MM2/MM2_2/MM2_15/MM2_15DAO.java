package lionsclubs.com.MM2.MM2_2.MM2_15;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM2_15DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_15.";

	public MM2_15VO MM2_15(MM2_15VO vo){
		return (MM2_15VO)selectByPk(commonId + "MM2_15", vo);
	}

//	public Page List(MM2_15VO vo) throws Exception {
//		return listWithPaging(commonId + "List", vo);
//    }

	@SuppressWarnings("unchecked")
	public List<MM2_15VO> List(MM2_15VO vo) throws Exception {
		return (List<MM2_15VO>)list(commonId + "List", vo);
	}
	
	public void otherIncomeInsert(MM2_15VO vo) throws Exception {
		insert(commonId + "otherIncomeInsert", vo);
	}
	
	public Integer otherIncomeUpdate(MM2_15VO vo) throws Exception {
		return update(commonId + "otherIncomeUpdate", vo);
	}

	public Integer otherIncomeDelete(MM2_15VO vo) throws Exception {
		return update(commonId + "otherIncomeDelete", vo);
	}

	public MM2_15VO paymentSum(MM2_15VO vo) throws Exception {
		return (MM2_15VO)selectByPk(commonId + "paymentSum", vo);
	} 
	
	public MM2_15VO paymentDate(MM2_15VO vo) throws Exception {
		return (MM2_15VO)selectByPk(commonId + "paymentDate", vo);
	} 
	
	public Boolean selectClosedMonthFlag(MM2_15VO_CLOSE_PARAM vo) throws Exception {
		String confirmYn = (String)selectByPk(commonId + "selectClosedMonthFlag", vo); 
		return ("Y".equals(confirmYn));
	}
}

