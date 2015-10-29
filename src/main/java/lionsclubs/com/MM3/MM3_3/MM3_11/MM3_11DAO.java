package lionsclubs.com.MM3.MM3_3.MM3_11;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_11DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_3.MM3_11.";

	public List<MM3_11VO> selectList(MM3_11VO vo) {
		// TODO Auto-generated method stub
		return (List<MM3_11VO>)list(commonId + "selectList", vo);
	}
}
