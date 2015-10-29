package lionsclubs.com.MM1.MM1_1.MM1_03;

import java.util.List;
import java.util.Map;

public interface MM1_03Service {
	public List<MM1_03VO> List(MM1_03VO vo) throws Exception;
	public MM1_03VO Select(MM1_03VO vo) throws Exception;
	public void Insert(MM1_03VO vo) throws Exception;
	public void Update(MM1_03VO vo) throws Exception;
	public void Delete(MM1_03VO vo) throws Exception;
	
	/**
	 * autocomplete 리스트
	 * @return
	 * @throws Exception
	 */
	public List<MM1_03VO> autoList(Map<String, Object> map) throws Exception;
	
	/**
	 * 최종이력 FLAG(LAST_YN) : Y,N
	 * 선임구분별 FLAG(KIND_FLAG) : 클럽직책 - C, 분과소속 - S, 지구직책 - D, 재입회 - R, 퇴회 - O
	 * @param vo
	 * @throws Exception
	 */
	public void flagSchedulingUpdate() throws Exception;
	
	/**
	 * 멤버 카운트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer memberCount(String memberNo) throws Exception;
	
	/**
	 * 입회 카운트
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Integer singCount(String memberNo) throws Exception;
	
	/**
	 * 최신 상태 정보
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public MM1_03VO lastStat(MM1_03VO vo) throws Exception;
	
	/**
	 * 최신 퇴회일자
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public String lastQuitDateStat(String memberNo) throws Exception;
	
	
	/**
	 * 퇴회시 유효한 선임 날짜를 퇴회날짜로 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer appDateUpdate(MM1_03VO vo) throws Exception;
	
	/**
	 * 최신 선임 flag업데이트
	 * @param vo
	 * @throws Exception
	 */
	public void flagUpdate(MM1_03VO vo) throws Exception;
	
	/**
	 * 최신 선임/위촉 flag으로 업데이트
	 * @param memberNo
	 * @throws Exception
	 */
	public void batchAppointmentUpdate() throws Exception;
}
