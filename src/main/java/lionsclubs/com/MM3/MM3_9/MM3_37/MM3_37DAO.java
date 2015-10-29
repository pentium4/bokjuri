package lionsclubs.com.MM3.MM3_9.MM3_37;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_37DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_9.MM3_37.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_37VO> listMerit(MM3_37VO vo) throws Exception {
		return list(commonId + "listMerit", vo);
	}	

	public MM3_37VO objectBasicMerit(MM3_37VO vo) throws Exception {
		return (MM3_37VO) selectByPk(commonId + "objectBasicMerit", vo);
	}	

	public Integer deleteBasicMerit(MM3_37VO vo) throws Exception {
		return delete(commonId + "deleteBasicMerit", vo);
	}
	
	public Boolean insertBasicMerit(MM3_37VO vo) throws Exception {
		insert(commonId + "insertBasicMerit", vo);
		return true;
	}

	public Integer deleteClubMerit(MM3_37VO vo) throws Exception {
		return delete(commonId + "deleteClubMerit", vo);
	}

	public Integer insertClubMerit(Object list) throws Exception {
		return batchInsert(commonId + "insertClubMerit", list);
	}	
}
