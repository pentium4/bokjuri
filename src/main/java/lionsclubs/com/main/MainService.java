package lionsclubs.com.main;

import java.util.HashMap;
import java.util.List;

public interface MainService {

	public List<HashMap<String,Object>> getAnniversaryCountInfo(MainParamVO vo) throws Exception;
	
	public String getDistrictName(String organCode) throws Exception ;
	
	public List<AnniversaryInfoDataVO> getAnniversaryInfo(MainParamVO vo) throws Exception ;
	
	/**
	 * 조직행사 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<EventVO> eventList(EventVO vo) throws Exception;
}
