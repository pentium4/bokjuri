package lionsclubs.com.MM2.MM2_2.MM2_13;

import java.util.HashMap;
import java.util.List;

import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01VO;
import lionsclubs.com.MM1.MM1_1.MM1_02.MM1_02VO;
import lionsclubs.com.MM2.MM2_1.MM2_06.MM2_06VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_13DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_13.";
	
	public MM2_13VO MM2_13(MM2_13VO vo){
		return (MM2_13VO)selectByPk(commonId + "MM2_13", vo);
	}

	public MM2_13HeadVO HeadList(MM2_13HeadVO vo) throws Exception {
		return (MM2_13HeadVO)selectByPk(commonId + "headInfo", vo);
    }
	
	public MM2_13HeadVO codeInfo(MM2_13HeadVO vo) throws Exception {
		return (MM2_13HeadVO)selectByPk(commonId + "codeInfo", vo);
    }
	
	public List<MM2_13VO> List(MM2_13VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public void otherIncomeInsert(MM2_13VO vo) throws Exception {
		insert(commonId + "otherIncomeInsert", vo);
	}
	
	public Integer otherIncomeUpdate(MM2_13VO vo) throws Exception {
		return update(commonId + "otherIncomeUpdate", vo);
	}

	public Integer otherIncomeDelete(MM2_13VO vo) throws Exception {
		return update(commonId + "otherIncomeDelete", vo);
	}
	
	public void calculateInsert(MM2_13VO vo) throws Exception {
		insert(commonId + "calculateInsert", vo);
	}
	
	public MM2_13VO calculateSearch(MM2_13VO vo){
		return (MM2_13VO)selectByPk(commonId + "calculateSearch", vo);
	}
	
	@SuppressWarnings("unchecked")
	public MM2_13VO paymentSum(MM2_13VO vo) throws Exception {
		return  (MM2_13VO)selectByPk(commonId + "paymentSum", vo);
	} 
	
	@SuppressWarnings("unchecked")
	public MM2_13VO paymentDate(MM2_13VO vo) throws Exception {
		return (MM2_13VO)selectByPk(commonId + "paymentDate", vo);
	} 
	
/*	@SuppressWarnings("unchecked")
	public List<MM1_01VO> recommMemberList(MM1_01VO vo) throws Exception {
		return list(commonId + "recommMemberList", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM1_01VO> duplicate(MM1_01VO vo) throws Exception {
		return list(commonId + "duplicate", vo);
	}*/
}
