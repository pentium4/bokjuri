package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.util.List;

public interface MM2_24Service {
	/**
	 * 회의일자 콤보 option 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */  
	public List<MM2_24VO_OPT> loadConfIdnNo(MM2_24VO_PARAM vo) throws Exception;
	
	/**
	 * 회의정보 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_24VO_CONF_INFO loadConferenceBasicInfo(MM2_24VO_PARAM vo) throws Exception;
	
	/**
	 * 회의추가
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	public String insertConferenceBasicInfo(MM2_24VO_CONF_INFO_INSERT vo) throws Exception ;
	
	/**
	 * 회의수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	public String updateConferenceBasicInfo(MM2_24VO_CONF_INFO_UPDATE vo) throws Exception ;
	
	/**
	 * 회의삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	public String deleteConferenceBasicInfo(MM2_24VO_PARAM vo) throws Exception ;


	/**
	 * 회의진행순서 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_24VO_DATA> selectList(MM2_24VO_PARAM vo) throws Exception;

	/**
	 * 회의진행순서 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertList(MM2_24VO_PARAM vo) throws Exception;

	/**
	 * 회의진행순서 수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateList(MM2_24VO_PARAM vo) throws Exception;

	/**
	 * 회의진행순서 삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteList(MM2_24VO_PARAM vo) throws Exception;

	/**
	 * 회의진행순서 초기화
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int initList(MM2_24VO_PARAM vo) throws Exception;
	
	/**
	 * 파일첨부정보 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int fileInfoUpload(MM2_24VO_FILE vo) throws Exception ;

}
