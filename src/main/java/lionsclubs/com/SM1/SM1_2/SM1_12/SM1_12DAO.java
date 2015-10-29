package lionsclubs.com.SM1.SM1_2.SM1_12;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class SM1_12DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.SM1.SM1_2.SM1_12.";

	@SuppressWarnings("unchecked")
	public List<SM1_12VO_DATA> selectList(SM1_12VO vo) {
		return (List<SM1_12VO_DATA>)list(commonId + "selectList", vo);
	}

	public int insertData(SM1_12VO_DATA vo) {
		return this.update(commonId + "insert", vo);
	}

	public int updateData(SM1_12VO_DATA vo) {
		return this.update(commonId + "update", vo);
	}

	public int deleteData(SM1_12VO_DATA vo) {
		return this.update(commonId + "delete", vo);
	}

	public int reorderList(SM1_12VO vo) {
		return this.update(commonId + "reorderList", vo);
	}
}
