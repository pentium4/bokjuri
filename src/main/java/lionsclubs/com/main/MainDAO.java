package lionsclubs.com.main;

import java.util.HashMap;
import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MainDAO extends LionsAbstractDAO{

	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> getAnniversaryCountInfo(MainParamVO vo) throws Exception {
		return (List<HashMap<String,Object>>)list("lionsclubs.com.main.getAnniversaryCountInfo", vo);
	}

	public String getDistrictName(String organCode) throws Exception {
		String districtName =  (String)selectByPk("lionsclubs.com.main.getDistrictName", organCode);
		
		return districtName == null ? "" : districtName;
	}

	@SuppressWarnings("unchecked")
	public List<AnniversaryInfoDataVO> getAnniversaryInfo(MainParamVO vo) throws Exception {
		return (List<AnniversaryInfoDataVO>)list("lionsclubs.com.main.getAnniversaryInfo", vo);
	}

	@SuppressWarnings("unchecked")
	public List<EventVO> eventList(EventVO vo) throws Exception {
		return list("lionsclubs.com.main.eventList", vo);
	}
}
