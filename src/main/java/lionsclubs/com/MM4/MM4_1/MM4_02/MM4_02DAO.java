package lionsclubs.com.MM4.MM4_1.MM4_02;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM4_02DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_1.MM4_02.";

	@SuppressWarnings("unchecked")
	public List<MM4_02VO> selectList(MM4_02VO_PARAM vo) {
		return (List<MM4_02VO>)list(commonId + "selectList", vo);
	}

}
