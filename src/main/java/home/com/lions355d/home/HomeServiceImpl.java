package home.com.lions355d.home;

import java.util.List;

import lionsclubs.com.cmm.common.CommonUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class HomeServiceImpl extends AbstractServiceImpl implements HomeService{
	@Autowired private HomeDAO dao;

	@Override
	public List<HomeVO> listClubEventPhoto(HomeVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode("K26000");
		}
		
		return dao.listClubEventPhoto(vo);
	}

	@Override
	public List<HomeVO> listClubEvent(HomeVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode("K26000");
		}
		
		return dao.listClubEvent(vo);
	}
	
	@Override
	public String governorsPictureFile(HomeVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		return dao.governorsPictureFile(vo);
	}
}
