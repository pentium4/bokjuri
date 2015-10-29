package lionsclubs.com.MM3.MM3_1.COMM;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class LIST_DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_1.COMM.";

	@SuppressWarnings("unchecked")
	public List<LIST_VO_DATA> selectList(LIST_VO vo) {
		return (List<LIST_VO_DATA>)list(commonId + "selectList", vo);
	}
}
