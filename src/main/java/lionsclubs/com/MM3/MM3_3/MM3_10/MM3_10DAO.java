package lionsclubs.com.MM3.MM3_3.MM3_10;

import java.util.List;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM3_10DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_3.MM3_10.";
	@SuppressWarnings("unchecked")
	public List<MM3_10VO> selectList(MM3_10VO_PARAM vo) {
		return (List<MM3_10VO>)list(commonId + "selectList", vo);
	}
}
