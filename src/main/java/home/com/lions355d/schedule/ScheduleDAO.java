package home.com.lions355d.schedule;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO extends LionsAbstractDAO{
	private String commonId = "home.com.lions355d.schedule.";
	
	@SuppressWarnings("unchecked")
	public List<ScheduleVO> listSchedule1(ScheduleVO vo) throws Exception {
		return list(commonId + "listSchedule1", vo);
	}	

	@SuppressWarnings("unchecked")
	public List<ScheduleVO> listSchedule2(ScheduleVO vo) throws Exception {
		return list(commonId + "listSchedule2", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<ScheduleVO> listClubCode(ScheduleVO vo) throws Exception {
		return list(commonId + "listClubCode", vo);
	}
}
