package lionsclubs.com.MM2.MM2_4.MM2_26;

import java.util.List;

import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24VO_PARAM;
import lionsclubs.com.MM2.MM2_4.MM2_25.MM2_25VO_PARAM;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_26DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_4.MM2_26.";

	/**
	 * 행사안내 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteData(MM2_26VO_DATA vo) throws Exception {
		return this.update(commonId + "deleteData", vo);
	}

	/**
	 * 파일첨부정보 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int fileInfoUpload(MM2_26VO_FILE vo) throws Exception {
		return this.update(commonId + "fileInfoUpload", vo);
	}
	
	/**
	 * 행사안내 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	
	public int insertData(MM2_26VO_DATA vo) throws Exception {
		return this.update(commonId + "insertData", vo);
	}

	/**
	 * 행사안내 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM2_26VO_DATA> selectList(MM2_24VO_PARAM vo) throws Exception {
		return (List<MM2_26VO_DATA>)list(commonId + "selectList", vo);
	}

	/**
	 * 행사안내 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateData(MM2_26VO_DATA vo) throws Exception {
		return this.update(commonId + "updateData", vo);
	}

	public Integer deleteCopy(MM2_26VO_PARAM vo) throws Exception {
		return delete(commonId + "deleteCopy", vo);
	}
	
	public boolean insertCopy(MM2_26VO_PARAM vo) throws Exception {
		insert(commonId + "insertCopy", vo);
		return true;
	}
}
