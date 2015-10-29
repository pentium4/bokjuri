package lionsclubs.com.MM4.MM4_2.MM4_10;

import java.util.List;

import org.springframework.stereotype.Repository;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_10DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_10.";

	@SuppressWarnings("unchecked")
	public List<MM4_10VO> selectList(MM4_10VO_PARAM vo) {
		return (List<MM4_10VO>)list(commonId + "selectList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM4_10VO_ORG> selectOrgList(MM4_10VO_PARAM vo) {
		return (List<MM4_10VO_ORG>)list(commonId + "selectOrgList", vo);
	}
}
