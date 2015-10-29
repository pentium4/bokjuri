package home.com.lions355d.photo;

import home.com.lions355d.schedule.ScheduleService;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class PhotoServiceImpl extends AbstractServiceImpl implements PhotoService{
	@Autowired private PhotoDAO dao;
    @Resource private ScheduleService scheduleService;
	
	@Override
	public Page listPhoto1(PhotoVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode("K26000");
		}
		
		return dao.listPhoto1(vo);
	}

	@Override
	public Page listPhoto2(PhotoVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		if(StringUtils.isEmpty(vo.getClubCode())){
			String clubCode = scheduleService.listClubCode().get(0).getOrganCode();
			vo.setClubCode(clubCode);
		}
		
		return dao.listPhoto2(vo);
	}
	
	@Override
	public Page listPhoto3(PhotoVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode("K26000");
		}
		
		return dao.listPhoto3(vo);
	}
	
	@Override
	public Page listPhoto4(PhotoVO vo) throws Exception {
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());	
		}
		/** 회기년도 세팅 */
		
		if(StringUtils.isEmpty(vo.getClubCode())){
			String clubCode = scheduleService.listClubCode().get(0).getOrganCode();
			vo.setClubCode(clubCode);
		}
		
		return dao.listPhoto4(vo);
	}
}
