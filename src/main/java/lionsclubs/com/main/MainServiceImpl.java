package lionsclubs.com.main;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MainServiceImpl extends AbstractServiceImpl implements MainService{

	@Autowired
	private MainDAO dao;
    
    @Override
	public List<HashMap<String,Object>> getAnniversaryCountInfo(MainParamVO vo) throws Exception {
		return dao.getAnniversaryCountInfo(vo);
	}

    @Override
    public String getDistrictName(String organCode) throws Exception {
    	return dao.getDistrictName(organCode);
    }

    @Override
	public List<AnniversaryInfoDataVO> getAnniversaryInfo(MainParamVO vo) throws Exception {
    	return dao.getAnniversaryInfo(vo);
	}
    
    @Override
    public List<EventVO> eventList(EventVO vo) throws Exception {
    	return dao.eventList(vo);
    }
}
