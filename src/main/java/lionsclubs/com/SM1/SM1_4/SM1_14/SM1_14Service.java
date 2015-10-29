package lionsclubs.com.SM1.SM1_4.SM1_14;

import java.util.List;

public interface SM1_14Service {
	/**
	 * 회기별 지구직책관리 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<SM1_14VO> SM1_14(SM1_14VO vo) throws Exception;

	/**
	 * 지구직책리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<SM1_14VO> listDistrictTitle(SM1_14VO vo) throws Exception;
	
	/**
	 * 회기별 지구직책 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveDistrictTitleMange(SM1_14VO vo) throws Exception;
	
	/**
	 * 회기별 지구직책 순서 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveDistrictTitleMangeOrd(SM1_14VO vo) throws Exception;
	
	/**
	 * 회기별 지구직책 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean deleteDistrictTitleMange(SM1_14VO vo) throws Exception;
}
