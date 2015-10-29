package lionsclubs.com.MM4.MM4_2.MM4_06;

import java.util.List;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_06DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_06.";
	@SuppressWarnings("unchecked")
	public List<MM4_06VO> selectList(MM4_06VO_PARAM vo) {
		return (List<MM4_06VO>)list(commonId + "selectList", vo);
	}
}
