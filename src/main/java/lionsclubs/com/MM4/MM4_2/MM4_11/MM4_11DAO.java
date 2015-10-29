package lionsclubs.com.MM4.MM4_2.MM4_11;

import java.util.List;
import org.springframework.stereotype.Repository;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_11DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_11.";

	@SuppressWarnings("unchecked")
	public List<MM4_11VO> selectList(MM4_11VO_PARAM vo) {
		return (List<MM4_11VO>)list(commonId + "selectList", vo);
	}
}
