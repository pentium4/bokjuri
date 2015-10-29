package lionsclubs.com.MM2.MM2_1.MM2_05;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_05DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_05.";
	
	public MM2_05VO MM2_05(MM2_05VO vo){
		return (MM2_05VO)selectByPk(commonId + "MM2_05", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_05VO> List(MM2_05VO vo) throws Exception {
		return list(commonId + "List", vo); 
    }
	
	public void awardInsert(MM2_05VO vo) throws Exception {
		insert(commonId + "awardInsert", vo);
	}
	
	public Integer awardUpdate(MM2_05VO vo) throws Exception {
		return update(commonId + "awardUpdate", vo);
	}

	public Integer awardDelete(MM2_05VO vo) throws Exception {
		return update(commonId + "awardDelete", vo);
	}
	
}
