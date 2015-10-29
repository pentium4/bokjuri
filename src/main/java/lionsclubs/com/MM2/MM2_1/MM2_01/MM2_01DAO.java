package lionsclubs.com.MM2.MM2_1.MM2_01;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_01DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_01.";

    public MM2_01VO basicInfo(MM2_01VO vo)throws Exception {
    	return (MM2_01VO)selectByPk(commonId + "basicInfo", vo);
    }
	public Integer selectMM2_01TotalCount(MM2_01VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "selectMM2_01TotalCount", vo);
	}
	
	public Integer Update(MM2_01VO vo){
		return update(commonId + "Update", vo);
    }

	@SuppressWarnings("unchecked")
	public List<MM2_01VO> officerChangeHistoryList(MM2_01VO vo) throws Exception {
		return list(commonId + "officerChangeHistoryList", vo);
    }

	@SuppressWarnings("unchecked")
	public List<MM2_01VO> clubHistory(MM2_01VO vo) throws Exception {
		return list(commonId + "clubHistory", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_01VO> clubOrgan(MM2_01VO vo) throws Exception {
		return list(commonId + "clubOrgan", vo);
    }

	@SuppressWarnings("unchecked")
	public List<MM2_01VO> clubCross(MM2_01VO vo) throws Exception {
		return list(commonId + "clubCross", vo);
    }
}	
