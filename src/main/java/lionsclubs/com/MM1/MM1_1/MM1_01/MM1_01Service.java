package lionsclubs.com.MM1.MM1_1.MM1_01;

import java.util.List;


public interface MM1_01Service {

	/**
	 * 개인기본사항 조회
	 * @param vo
	 * @throws Exception
	 */
	public MM1_01VO MM1_01(MM1_01VO vo) throws Exception;

	/**
	 * 프로필 기본사항 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String profileInsert(MM1_01VO vo) throws Exception;
	
	
	/**
	 * 프로필 기본사항 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer profileUpdate(MM1_01VO vo) throws Exception;
	
	/**
	 * 추천회원
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_01VO> recommMemberList(MM1_01VO vo) throws Exception;
	
	/**
	 * 생년월일 동일자 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM1_01VO> birthPopup(MM1_01VO vo) throws Exception;
	
	/**
	 * 중복체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer duplicateCheck(MM1_01VO vo) throws Exception;
	
	/**
	 * 인사기본 수정
	 * @param vo
	 * @throws Exception
	 */
	public Integer hrUpdate(MM1_01VO vo) throws Exception;
	
	/**
	 * 이전/다음 memberNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_01VO memberNo(MM1_01VO vo) throws Exception;
}
