package lionsclubs.com.MM4.MM4_2.MM4_08;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM4_08DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_08.";

	@SuppressWarnings("unchecked")
	public List<MM4_08VO_PARAM> selectList(MM4_08VO_PARAM vo) {
		return (List<MM4_08VO_PARAM>)list(commonId + "selectList", vo);
	}
	
}
