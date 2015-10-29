package lionsclubs.com.include.organprofile;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class OrganProfileServiceImpl extends AbstractServiceImpl implements OrganProfileService{

	@Autowired private OrganProfileDAO dao;
	
	/**
	 * 현재클럽 정보를 가져온다.
	 */
	@Override
	public OrganProfileVO clubProfile(OrganProfileVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchClubCode());
		} else {
			user.setSearchClubCode(vo.getOrganCode());
		}
		vo.setLvl("4");	// 클럽레벨
		return organProfile(vo);
	}
	
	/**
	 * 현재지구 정보를 가져온다.
	 */
	@Override
	public OrganProfileVO districtProfile(OrganProfileVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchDistrictCode());
		} else {
			user.setSearchDistrictCode(vo.getOrganCode());
		}
		vo.setLvl("3");	// 지구레벨
		return organProfile(vo);
	}
	
	/**
	 * 복합/연합회 정보를 가져온다.
	 */
	@Override
	public OrganProfileVO complexProfile(OrganProfileVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchComplexCode());
		} else {
			user.setSearchComplexCode(vo.getOrganCode());
		}
		vo.setLvlEnd("2");	// 복합/연합회 레벨
		return organProfile(vo);
	}
	
	/**
	 * 조직 정보를 가져온다. 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public OrganProfileVO organProfile(OrganProfileVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setAuthMemberNo(user.getId());
		
		OrganProfileVO cvo = null;
		OrganProfileVO ovo = null;
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			cvo = dao.organProfileIdnNo(vo);
			
			if(StringUtils.isNotEmpty(vo.getYear())){
				ovo = dao.organCodeYear(vo);
			} else if(StringUtils.isNotEmpty(vo.getYearMonth())){
				ovo = dao.organCodeYearMonth(vo);
			}
		} else if(StringUtils.isNotEmpty(vo.getYear())){
			cvo = dao.organProfileYear(vo);
			ovo = dao.organCodeYear(vo);
		} else if(StringUtils.isNotEmpty(vo.getYearMonth())){
			cvo = dao.organProfileYearMonth(vo);
			ovo = dao.organCodeYearMonth(vo);
		} else {
			cvo = dao.organProfile(vo);
			ovo = dao.organCode(vo);
		}
		
		if(cvo != null){
			if(StringUtils.isNotEmpty(cvo.getOrganOfficerMemberNo())){
				OrganProfileVO mvo = dao.memberInfo(cvo);
				
				if(mvo != null){
					cvo.setOrganOffcerMemberBirth(mvo.getOrganOffcerMemberBirth());	/* 생년월일 */
					cvo.setOrganOffcerMemberSingDate(mvo.getOrganOffcerMemberSingDate());	/* 입회일자 */
					cvo.setOrganOffcerMemberSingYearTerm(mvo.getOrganOffcerMemberSingYearTerm());	/* 입회일자차이(년) */
					cvo.setOrganOffcerMemberSingMonthTerm(mvo.getOrganOffcerMemberSingMonthTerm());	/* 입회일자차이(월) */
				}
			}
			
			if(StringUtils.isNotEmpty(cvo.getGuidingMemeberNo())){
				cvo.setGuidingClubCodeName(dao.guidingClubCodeName(cvo));	/* 스폰클럽 */	
			}
			
			if(ovo != null){
				cvo.setPrevOrganCode(ovo.getPrevOrganCode());
				cvo.setNextOrganCode(ovo.getNextOrganCode());
			}
		}
		
		return cvo;
	}
}
