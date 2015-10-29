package lionsclubs.com.SM1.SM1_4.SM1_14;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_14ServiceImpl extends AbstractServiceImpl implements SM1_14Service{

	@Autowired private SM1_14DAO dao;

	@Override
	public List<SM1_14VO> SM1_14(SM1_14VO vo) throws Exception {
		return dao.SM1_14(vo);
	}
	
	@Override
	public List<SM1_14VO> listDistrictTitle(SM1_14VO vo) throws Exception {
		return dao.listDistrictTitle(vo);
	}
	
	@Override
	public String saveDistrictTitleMange(SM1_14VO vo) throws Exception {
		String message = saveDistrictTitleMangeProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "1";	// 완료
    	*/		
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("중복된 직책코드가 있습니다.");
				sMessage = "중복된 직책코드가 있습니다.";
			break;		
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveDistrictTitleMangeProcess(SM1_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		for(SM1_14VO dt : vo.getDistrictTitleArray()){
			vo.setTitleCode(dt.getTitleCode());
			
			if(dao.duplicateChkDistrictTitleMange(vo) > 0){
				return "90";	
			}
		}
		
		for(SM1_14VO dt : vo.getDistrictTitleArray()){
			vo.setTitleCode(dt.getTitleCode());
			vo.setTitleOrd(dt.getTitleOrd());
			dao.insertDistrictTitleMange(vo);
		}
		
		return "1";
	}
	
	@Override
	public String saveDistrictTitleMangeOrd(SM1_14VO vo) throws Exception {
		String message = saveDistrictTitleMangeOrdProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "1";	// 완료
    	*/		
		switch(Integer.parseInt(message)){
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveDistrictTitleMangeOrdProcess(SM1_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		for(SM1_14VO dt : vo.getDistrictTitleArray()){
			vo.setIdnNo(dt.getIdnNo());
			vo.setTitleOrd(dt.getTitleOrd());
			dao.updateDistrictTitleMange(vo);
		}
		
		return "1";
	}
	
	@Override
	public Boolean deleteDistrictTitleMange(SM1_14VO vo) throws Exception {
		for(SM1_14VO dt : vo.getDistrictTitleArray()){
			vo.setIdnNo(dt.getIdnNo());
			dao.deleteDistrictTitleMange(vo);
		}
		
		return Boolean.TRUE;
	}
}
