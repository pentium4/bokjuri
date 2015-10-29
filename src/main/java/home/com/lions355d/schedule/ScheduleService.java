package home.com.lions355d.schedule;

import java.util.List;

public interface ScheduleService {

	/**
	 * 지구 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> listSchedule1(ScheduleVO vo) throws Exception;

	/**
	 * 클럽 행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> listSchedule2(ScheduleVO vo) throws Exception;

	/**
	 * 클럽코드 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> listClubCode() throws Exception;

}
