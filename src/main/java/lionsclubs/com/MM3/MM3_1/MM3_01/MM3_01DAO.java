package lionsclubs.com.MM3.MM3_1.MM3_01;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_01DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_1.MM3_01.";
	
    public MM3_01VO basicInfo(MM3_01VO vo)throws Exception {
    	return (MM3_01VO)selectByPk(commonId + "basicInfo", vo);
    }
    
    @SuppressWarnings("unchecked")
	public List<MM3_01VO> officerChangeHistoryList(MM3_01VO vo)throws Exception {
    	return list(commonId + "officerChangeHistoryList", vo);
    }
	
    @SuppressWarnings("unchecked")
	public List<MM3_01VO> districtMemberList(MM3_01VO vo)throws Exception {
    	return list(commonId + "districtMemberList", vo);
    }
}
