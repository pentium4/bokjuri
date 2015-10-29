package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class SM1_10DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.SM1.SM1_2.SM1_10.";

	@SuppressWarnings("unchecked")
	public List<SM1_10VO_DATA> selectList(SM1_10VO vo) {
		return (List<SM1_10VO_DATA>)list(commonId + "selectList", vo);
	}

	public int insertData(SM1_10VO_DATA vo) {
		return this.update(commonId + "insert", vo);
	}

	public int updateData(SM1_10VO_DATA vo) {
		return this.update(commonId + "update", vo);
	}

	public int deleteData(SM1_10VO_DATA vo) {
		return this.update(commonId + "delete", vo);
	}

	public int fileInfoUpload(SM1_10VO_FILE vo) {
		return this.update(commonId + "fileInfoUpload", vo);
	}
	
	public int reorderList(SM1_10VO vo) {
		return this.update(commonId + "reorderList", vo);
	}
}
