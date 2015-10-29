package lionsclubs.com.MM7.MM7_1.MM7_02;

import java.util.List;


public interface MM7_02Service {

	/**
	 * 문서템플릿 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM7_02VO> MM7_02(MM7_02VO vo) throws Exception;

	/**
	 * 문서템플릿 상세보기
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM7_02VO objectDocTemplate(MM7_02VO vo) throws Exception;
	
	/**
	 * 문서템플릿 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveDocTemplate(MM7_02VO vo) throws Exception;

	/**
	 * 문서템플릿 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteDocTemplate(MM7_02VO vo) throws Exception;
}
