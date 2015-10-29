package lionsclubs.com.MM2.MM2_4.MM2_27;

import java.util.List;
import java.util.Map;

import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24VO_PARAM;

public interface MM2_27Service {

	/**
	 * 행사안내 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteList(MM2_27VO_PARAM vo) throws Exception ;

	/**
	 * 행사안내 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	
	public int insertList(MM2_27VO_PARAM vo) throws Exception ;

	/**
	 * 행사안내 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_27VO_DATA> selectList(MM2_24VO_PARAM vo) throws Exception ;

	/**
	 * 행사안내 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateList(MM2_27VO_PARAM vo) throws Exception ;

	/**
	 * 파일첨부정보 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int fileInfoUpload(MM2_27VO_FILE vo) throws Exception ;

	/**
	 * 복사
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String copy(MM2_27VO_PARAM vo) throws Exception;
	
	/**
	 * 엑셀 다운로드
	 * @param vo
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> excelDownload(MM2_24VO_PARAM vo, Map<String, Object> modelMap) throws Exception;		
}
