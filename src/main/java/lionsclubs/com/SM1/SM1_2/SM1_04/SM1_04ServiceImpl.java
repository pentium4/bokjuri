package lionsclubs.com.SM1.SM1_2.SM1_04;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_04ServiceImpl extends AbstractServiceImpl implements SM1_04Service{

	@Autowired
	private SM1_04DAO dao;
	
	/**
	 * 조직코드 조회
	 */
	@Override
	public SM1_04VO SM1_04(SM1_04VO vo) throws Exception {
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchOrganCode());
		} else {
			user.setSearchOrganCode(vo.getOrganCode());
		}
		
		return dao.SM1_04(vo);
	}
	
	/**
	 * 조직코드 입력
	 */
	@Override
	public void organInsert(SM1_04VO vo) throws Exception {
		dao.organInsert(vo);
	}
	
	/**
	 * 조직코드 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public Integer organUpdate(SM1_04VO vo) throws Exception {
		return dao.organUpdate(vo);
	}
	
	/**
	 * 조직코드 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public Integer organDelete(SM1_04VO vo) throws Exception {
		return dao.organDelete(vo);
	}
	
	/**
	 * 조직코드 체크
	 */
	@Override
	public String organCodeCheck(SM1_04VO vo) throws Exception {
		return dao.organCodeCheck(vo);
	}
	
	/**
	 * 조직변경 입력
	 */
	@Override
	public boolean organHistoryInsert(SM1_04VO vo) throws Exception {
		dao.clearLastFlagUpdate(vo);	// 조직마지막 FLAG 초기화
		dao.organHistoryInsert(vo);
		dao.lastFlagUpdate(vo);	// 조직마지막 FLAG 업데이트
		return true;
	}
	
	/**
	 * 조직변경 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean organHistoryUpdate(SM1_04VO vo) throws Exception {
		dao.clearLastFlagUpdate(vo);	// 조직마지막 FLAG 초기화
		dao.organHistoryUpdate(vo);
		dao.lastFlagUpdate(vo);	// 조직마지막 FLAG 업데이트
		return true;
	}
	
	/**
	 * 조직검색
	 */
	@Override
	public Page organSearchList(SM1_04VO vo) throws Exception {
		return dao.organSearchList(vo);
	}
	
	/**
	 * 조직변경이력
	 */
	@Override
	public SM1_04VO organHistory(SM1_04VO vo) throws Exception {
		return dao.organHistory(vo);
	}
	
	/**
	 * 조직변경이력 카운트
	 */
	@Override
	public Integer organHistoryCount(SM1_04VO vo) throws Exception {
		return dao.organHistoryCount(vo);
	}
	
	/**
	 * 조직변경이력 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean organHistoryDelete(SM1_04VO vo) throws Exception {
		dao.organHistoryDelete(vo);
		dao.lastFlagUpdate(vo);	// 조직마지막 FLAG 업데이트
		return true;
	}
	
	/**
	 * 등록번호 중복 체크
	 */
	@Override
	public Integer registerNoCount(SM1_04VO vo) throws Exception {
		return dao.registerNoCount(vo);
	}
	
	/**
	 * 회원구분별 월회비
	 */
	@Override
	public List<SM1_04VO> memberDivisionMonthDueList(SM1_04VO vo)
			throws Exception {
		return dao.memberDivisionMonthDueList(vo);
	}
	
	/**
	 * 회원구분별 월회비 삭제 및 입력
	 */
	@Override
	public void memberDivisionMonthDueInsert(SM1_04VO vo) throws Exception {
		
		dao.memberDivisionMonthDueDelete(vo);	// 회원구분별 월회비 삭제
		
		// 회원구분별 월회비 입력
		for(SM1_04VO dueVO : vo.getMonthDueArray()){
			dueVO.setOrganCode(vo.getOrganCode());
			dao.memberDivisionMonthDueInsert(dueVO);
		}
	}
	
	/**
	 * 이전/다음 조직코드
	 */
	@Override
	public SM1_04VO organCode(SM1_04VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setAuthMemberNo(user.getId());
		
		return dao.organCode(vo);
	}
	
	/**
	 * 이전/다음 조직이력 IdnNo
	 */
	@Override
	public SM1_04VO organHistoryIdnNo(SM1_04VO vo) throws Exception {
		return dao.organHistoryIdnNo(vo);
	}
}
