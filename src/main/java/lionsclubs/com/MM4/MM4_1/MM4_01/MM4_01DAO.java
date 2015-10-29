package lionsclubs.com.MM4.MM4_1.MM4_01;

import java.util.List;

import lionsclubs.com.MM3.MM3_1.MM3_01.MM3_01VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM4_01DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_1.MM4_01.";

    public MM4_01VO basicInfo(MM4_01VO vo) throws Exception {
    	return (MM4_01VO)selectByPk(commonId + "basicInfo", vo);
    }

	@SuppressWarnings("unchecked")
	public List<MM4_01VO> complexList(MM4_01VO vo) throws Exception {
		return list(commonId + "complexList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM3_01VO> officerChangeHistoryList(MM4_01VO vo) throws Exception {
		return list(commonId + "officerChangeHistoryList", vo);
	}
}
