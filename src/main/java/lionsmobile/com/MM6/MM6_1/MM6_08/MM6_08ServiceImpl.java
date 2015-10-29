package lionsmobile.com.MM6.MM6_1.MM6_08;

import java.util.List;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM6_08ServiceImpl extends AbstractServiceImpl implements MM6_08Service{
	@Autowired private MM6_08DAO dao;

	@Override
	public List<MM6_08VO> listServicePersonal(MM6_08VO vo) throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());

		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(StringUtils.isEmpty(vo.getMonth())){
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		return dao.listServicePersonal(vo);
	}
	
	@Override
	public MM6_08VO sumServicePersonal(MM6_08VO vo) throws Exception {
		return dao.sumServicePersonal(vo);
	}
	
	@Override
	public List<MM6_08VO> listServiceCommitmentOfficer(MM6_08VO vo) throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getMonth() == null){
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		vo.setClassItemType("2");
		
		return dao.listServiceCommitmentOfficer(vo);
	}
}
