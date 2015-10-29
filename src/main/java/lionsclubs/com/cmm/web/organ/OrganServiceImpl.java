package lionsclubs.com.cmm.web.organ;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class OrganServiceImpl extends AbstractServiceImpl implements OrganService{

	@Autowired private OrganDAO dao;

	/**
	 * 조직Tree구조 리스트
	 */
	@Override
	public List<OrganVO> organTreeList(OrganVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user != null){
			vo.setAuthMemberNo(user.getId());
			vo.setAssociationCode(user.getAssociationCode());
			vo.setComplexCode(user.getComplexCode());
			vo.setDistrictCode(user.getDistrictCode());
		}
		
		return dao.organTreeList(vo);
	}

	/**
	 * 조직검색
	 */
	@Override
	public List<OrganVO> organSearch(OrganVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setAuthMemberNo(user.getId());		
		return dao.organSearch(vo);
	}
	
	@Override
	public String getOrgLevel(String orgCode) throws Exception {
		return dao.getOrgLevel(orgCode);
	}

	@Override
	public String getDistrictCode(String clubCode) throws Exception {
		return dao.getDistrictCode(clubCode);
	}
	/**
	 * 검색유지 조직코드를 저장한다.
	 */
	@Override
	public void saveSearchOrganCode(OrganVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		OrganVO byLvlOrganCode = dao.byLvlOrganCode(vo);

		/**
		 * 연합회
		 */
		if("1".equals(vo.getLvl())){
			user.setSearchAssociationCode(vo.getSearchOrganCode());
		/**
		 * 복합지구
		 */
		} else if("2".equals(vo.getLvl())){
			user.setSearchAssociationCode(byLvlOrganCode.getAssociationCode());
			user.setSearchComplexCode(byLvlOrganCode.getComplexCode());
		/**
		 * 지구
		 */
		} else if("3".equals(vo.getLvl())){
			user.setSearchAssociationCode(byLvlOrganCode.getAssociationCode());
			user.setSearchComplexCode(byLvlOrganCode.getComplexCode());
			user.setSearchDistrictCode(byLvlOrganCode.getDistrictCode());
		/**
		 * 클럽
		 */
		} else if("4".equals(vo.getLvl())){
			user.setSearchAssociationCode(byLvlOrganCode.getAssociationCode());
			user.setSearchComplexCode(byLvlOrganCode.getComplexCode());
			user.setSearchDistrictCode(byLvlOrganCode.getDistrictCode());
			user.setSearchClubCode(byLvlOrganCode.getClubCode());
		/*
		 * 여러 레벨에서 선택해야 할 때 즉 여러 레벨의 조직코드를 마구 넣을 때
		 */
		} else {
			user.setSearchOrganCode(vo.getSearchOrganCode());
			vo.setLvl(this.getOrgLevel(vo.getSearchOrganCode()));
			this.saveSearchOrganCode(vo);
		}
	}
	
	@Override
	public String organCodetoName(String organCode) throws Exception {
		return dao.organCodetoName(organCode);
	}
}
