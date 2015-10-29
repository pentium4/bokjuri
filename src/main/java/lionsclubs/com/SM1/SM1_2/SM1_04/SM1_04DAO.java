package lionsclubs.com.SM1.SM1_2.SM1_04;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_04DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_2.SM1_04.";
	/**
	 * 조직코드 조회
	 * @param vo
	 * @return
	 */
	public SM1_04VO SM1_04(SM1_04VO vo) throws Exception {
		return (SM1_04VO)selectByPk(commonId + "SM1_04", vo);
	}
	
	/**
	 * 조직코드 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void organInsert(SM1_04VO vo) throws Exception {
		insert(commonId + "organInsert", vo);
	}
	
	/**
	 * 조직코드 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organUpdate(SM1_04VO vo) throws Exception {
		return update(commonId + "organUpdate", vo);
	}
	
	/**
	 * 조직코드 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organDelete(SM1_04VO vo) throws Exception {
		return delete(commonId + "organDelete", vo);
	}
	
	/**
	 * 조직코드 체크
	 * @param vo
	 * @return
	 */
	public String organCodeCheck(SM1_04VO vo) {
		return (String) selectByPk(commonId + "organCodeCheck", vo);
	}
	
	/**
	 * 조직변경 입력
	 * @param vo
	 * @throws Exception
	 */
	public void organHistoryInsert(SM1_04VO vo) throws Exception {
		insert(commonId + "organHistoryInsert", vo);
	}
	
	/**
	 * 조직변경 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organHistoryUpdate(SM1_04VO vo) throws Exception {
		return update(commonId + "organHistoryUpdate", vo);
	}
	
	/**
	 * 조직검색
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page organSearchList(SM1_04VO vo) throws Exception {
		return listWithPaging(commonId + "organSearchList", vo);
	}
	
	/**
	 * 조직변경이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_04VO organHistory(SM1_04VO vo) throws Exception {
		return (SM1_04VO)selectByPk(commonId + "organHistory", vo);
	}	
	
	/**
	 * 조직변경이력 카운트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organHistoryCount(SM1_04VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "organHistoryCount", vo);
	}	

	/**
	 * 조직변경이력 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer organHistoryDelete(SM1_04VO vo) throws Exception {
		return delete(commonId + "organHistoryDelete", vo);
	}

	/**
	 * 등록번호 중복 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer registerNoCount(SM1_04VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "registerNoCount", vo);
	}
	
	/**
	 * 회원구분별 월회비
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_04VO> memberDivisionMonthDueList(SM1_04VO vo) throws Exception {
		return list(commonId + "memberDivisionMonthDueList", vo);
	}
	
	
	/**
	 * 회원구분별 월회비 삭제
	 */
	public Integer memberDivisionMonthDueDelete(SM1_04VO vo) throws Exception {
		return delete(commonId + "memberDivisionMonthDueDelete", vo);
	}
	
	/**
	 * 회원구분별 월회비 입력
	 */
	public void memberDivisionMonthDueInsert(SM1_04VO vo) throws Exception {
		insert(commonId + "memberDivisionMonthDueInsert", vo);
	}

	/**
	 * 조직마지막 FLAG 초기화
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer clearLastFlagUpdate(SM1_04VO vo) throws Exception {
		return update(commonId + "clearLastFlagUpdate", vo);
	}
	
	/**
	 * 조직마지막 FLAG 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer lastFlagUpdate(SM1_04VO vo) throws Exception {
		return update(commonId + "lastFlagUpdate", vo);
	}

	/**
	 * 이전/다음 조직코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_04VO organCode(SM1_04VO vo) throws Exception {
		return (SM1_04VO) selectByPk(commonId + "organCode", vo);
	}
	
	/**
	 * 이전/다음 조직이력 IdnNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public SM1_04VO organHistoryIdnNo(SM1_04VO vo) throws Exception {
		return (SM1_04VO) selectByPk(commonId + "organHistoryIdnNo", vo);
	}
}
