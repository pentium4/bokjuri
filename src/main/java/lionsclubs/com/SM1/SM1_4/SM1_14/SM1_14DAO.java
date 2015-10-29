package lionsclubs.com.SM1.SM1_4.SM1_14;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_14DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.SM1.SM1_4.SM1_14.";
	
	@SuppressWarnings("unchecked")
	public List<SM1_14VO> SM1_14(SM1_14VO vo) throws Exception {
        return list(commonId + "SM1_14", vo);
    }
	
	public Integer duplicateChkDistrictTitleMange(SM1_14VO vo) throws Exception {
        return (Integer) selectByPk(commonId + "duplicateChkDistrictTitleMange", vo);
    }

	@SuppressWarnings("unchecked")
	public List<SM1_14VO> listDistrictTitle(SM1_14VO vo) throws Exception {
        return list(commonId + "listDistrictTitle", vo);
    }
	
	public Boolean insertDistrictTitleMange(SM1_14VO vo) throws Exception {
		insert(commonId + "insertDistrictTitleMange", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateDistrictTitleMange(SM1_14VO vo) throws Exception {
		return update(commonId + "updateDistrictTitleMange", vo);
	}
	
	public Integer deleteDistrictTitleMange(SM1_14VO vo) throws Exception {
		return delete(commonId + "deleteDistrictTitleMange", vo);
	}
}
