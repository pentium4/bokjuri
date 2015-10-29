package lionsclubs.com.MM4.MM4_2.MM4_05;

import java.util.List;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_05DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_05.";
	@SuppressWarnings("unchecked")
	public List<MM4_05VO> selectList(MM4_05VO_PARAM vo) {
		return (List<MM4_05VO>)list(commonId + "selectList", vo);
	}
}
