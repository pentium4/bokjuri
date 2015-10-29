package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM2_24DAO_DATA extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_4.MM2_24.DATA.";
	
	
	/**
	 * 회의진행순서 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM2_24VO_DATA> selectList(MM2_24VO_PARAM vo) throws Exception {
		return (List<MM2_24VO_DATA>)list(commonId + "selectList", vo);
	}

	
	/**
	 * 회의진행순서 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	
	public int insertData(MM2_24VO_DATA vo) throws Exception {
		return this.update(commonId + "insertData", vo);
	}

	/**
	 * 회의진행순서 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateData(MM2_24VO_DATA vo) throws Exception {
		return this.update(commonId + "updateData", vo);
	}

	
	/**
	 * 회의진행순서 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteData(MM2_24VO_DATA vo) throws Exception {
		return this.update(commonId + "deleteData", vo);
	}
	
	/**
	 * 회의진행순서 전체 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteAll(MM2_24VO_PARAM vo) throws Exception {
		return this.update(commonId + "deleteAll", vo);
	}
	
	/**
	 * 회의진행순서 초기화
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int initList(MM2_24VO_PARAM vo) throws Exception {
		return this.update(commonId + "initList", vo);
	}


	/**
	 * 파일첨부정보 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int fileInfoUpload(MM2_24VO_FILE vo) throws Exception {
		return this.update(commonId + "fileInfoUpload", vo);
	}

}
