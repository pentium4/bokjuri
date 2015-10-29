package lionsclubs.com.MM7.MM7_1.MM7_02;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM7_02DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM7.MM7_1.MM7_02.";

	@SuppressWarnings("unchecked")
	public List<MM7_02VO> MM7_02(MM7_02VO vo) throws Exception {
		return list(commonId + "MM7_02", vo);
	}

	public MM7_02VO objectDocTemplate(MM7_02VO vo) throws Exception {
		return (MM7_02VO) selectByPk(commonId + "objectDocTemplate", vo);
	}

	public String insertDocTemplate(MM7_02VO vo) throws Exception {
		return (String) insert(commonId + "insertDocTemplate", vo);
	}
	
	public Integer updateDocTemplate(MM7_02VO vo) throws Exception {
		return update(commonId + "updateDocTemplate", vo);
	}
	
	public Integer deleteDocTemplate(MM7_02VO vo) throws Exception {
		return delete(commonId + "deleteDocTemplate", vo);
	}
}