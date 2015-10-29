package lionsclubs.com.SM1.SM1_2.SM1_04;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;


public interface SM1_04Service {

	/**
	 * 조직코드 조회
	 * @param vo
	 * @throws Exception
	 */
	public SM1_04VO SM1_04(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 입력 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void organInsert(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organUpdate(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organDelete(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String organCodeCheck(SM1_04VO vo) throws Exception;

	/**
	 * 조직변동 입력
	 * @param vo
	 * @throws Exception
	 */
	public boolean organHistoryInsert(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직변동 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean organHistoryUpdate(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직검색
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page organSearchList(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 변경이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_04VO organHistory(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 변경이력 건수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organHistoryCount(SM1_04VO vo) throws Exception;
	
	/**
	 * 조직코드 변경이력 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean organHistoryDelete(SM1_04VO vo) throws Exception;
	
	/**
	 * 등록번호 중복 체크
	 * @return
	 */
	public Integer registerNoCount(SM1_04VO vo) throws Exception;
	
	/**
	 * 회원구분별 월회비
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<SM1_04VO> memberDivisionMonthDueList(SM1_04VO vo) throws Exception;
	
	/**
	 * 회원구분별 월회비 입력
	 * @param vo
	 * @throws Exception
	 */
	public void memberDivisionMonthDueInsert(SM1_04VO vo) throws Exception;
	
	/**
	 * 이전/다음 조직코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_04VO organCode(SM1_04VO vo) throws Exception;
	
	/**
	 * 이전/다음 조직이력 IdnNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_04VO organHistoryIdnNo(SM1_04VO vo) throws Exception;	
}
