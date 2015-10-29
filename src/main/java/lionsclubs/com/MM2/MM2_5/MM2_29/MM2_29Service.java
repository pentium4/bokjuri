package lionsclubs.com.MM2.MM2_5.MM2_29;

import java.util.List;

public interface MM2_29Service {

	/**
	 * 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_29VO> list(MM2_29VO vo) throws Exception;

	/**
	 * 행사총 인원/시간/점수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_29VO total(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_29VO detail(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사 삭제
	 * @param vo
	 * @throws Exception
	 */
	public Boolean delete(MM2_29VO vo) throws Exception;
	
	/**
	 * 조직하위 클럽코드 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_29VO> subTreeYearClubCodeList(MM2_29VO vo) throws Exception;
	
	/**
	 * 클럽하위 멤버리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_29VO> eventClubMemberList(MM2_29VO vo) throws Exception;	
	
	/**
	 * 행사입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean insertEventSponsor(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateEventSponsor(MM2_29VO vo) throws Exception;
	
	
	/**
	 * 행사인원 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveEventMemberProcess(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사클럽
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_29VO eventClubObject(MM2_29VO vo) throws Exception;
	
	/**
	 * 입력된 행사클럽 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_29VO> eventClubList(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사클럽 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean deleteEventClub(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사인원 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_29VO> eventMemberList(MM2_29VO vo) throws Exception;

	/**
	 * 총행사 인원/시간/점수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_29VO eventMemberTotal(MM2_29VO vo) throws Exception;
	
	/**
	 * 행사사진 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM2_29VO> eventPhotoList(MM2_29VO vo) throws Exception;
}
