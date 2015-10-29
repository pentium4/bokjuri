package lionsclubs.com.MM3.MM3_9.MM3_37;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_37ServiceImpl extends AbstractServiceImpl implements MM3_37Service{
	@Autowired private MM3_37DAO dao;
	
	@Override
	public MM3_37VO objectBasicMerit(MM3_37VO vo) throws Exception {
		return dao.objectBasicMerit(vo);
	}
	
	@Override
	public List<MM3_37VO> listMerit(MM3_37VO vo) throws Exception {
		return dao.listMerit(vo);
	}
	
	@Override
	public String saveMerit(MM3_37VO vo) throws Exception {
		String message = saveMeritProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveMeritProcess(MM3_37VO vo) throws Exception {
		
		// 기본 공적점수
		dao.deleteBasicMerit(vo);
		dao.insertBasicMerit(vo);
		
		// 공적점수 입력
		dao.deleteClubMerit(vo);
		dao.insertClubMerit(vo.getMeritArray());
		
		return "1";
	}
	
}
