package home.com.lions355d.schedule;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class ScheduleServiceImpl extends AbstractServiceImpl implements ScheduleService{
	@Autowired private ScheduleDAO dao;
	
	@Override
	public List<ScheduleVO> listSchedule1(ScheduleVO vo) throws Exception {
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode("K26000");
		}
		
		return dao.listSchedule1(vo);
	}

	@Override
	public List<ScheduleVO> listSchedule2(ScheduleVO vo) throws Exception {
		if(StringUtils.isEmpty(vo.getClubCode())){
			String clubCode = listClubCode().get(0).getOrganCode();
			vo.setClubCode(clubCode);
		}
		
		return dao.listSchedule2(vo);
	}
	
	@Override
	public List<ScheduleVO> listClubCode() throws Exception {
		ScheduleVO vo = new ScheduleVO();
		vo.setOrganCode("K26000");
		
		return dao.listClubCode(vo);
	}
}
