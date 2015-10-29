package lionsclubs.com.SM1.SM1_4.SM1_15;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_15ServiceImpl extends AbstractServiceImpl implements SM1_15Service{
	@Autowired private SM1_15DAO dao;

	@Override
	public List<SM1_15VO> SM1_15(SM1_15VO vo) throws Exception {
		return dao.SM1_15(vo);
	}
	
	@Override
	public String calculateConfirm(SM1_15VO vo) throws Exception {
		String message = calculateConfirmProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("전월의 정산확정이 되지 않아 정산처리를 할 수 없습니다.");
				sMessage = "전월의 정산확정이 되지 않아 정산처리를 할 수 없습니다.";
			break;		
			default:
				log.debug("정산 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String calculateConfirmProcess(SM1_15VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		SM1_15VO objectPrevCalculate = dao.objectPrevCalculate(vo);
		if(!"Y".equals(objectPrevCalculate.getConfirmLockYn())){
			return "90";
		}
		
		dao.updateCalculateConfirm(vo);
		
		return "1";
	}
	
	@Override
	public Integer calculateConfirmCancel(SM1_15VO vo) throws Exception {
		return dao.updateCalculateConfirmCancel(vo);
	}
	
	@Override
	public Integer calculateConfirmLock(SM1_15VO vo) throws Exception {
		return dao.updateCalculateConfirmLock(vo);
	}
	
	@Override
	public String calculateConfirmLockCancel(SM1_15VO vo) throws Exception {
		String message = calculateConfirmLockCancelProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("다음달 정산이 되어있어 정산확정 취소를 할 수 없습니다.");
				sMessage = "다음달 정산이 되어있어 정산확정 취소를 할 수 없습니다.";
			break;		
			default:
				log.debug("정산확정 취소 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String calculateConfirmLockCancelProcess(SM1_15VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		SM1_15VO objectNextCalculate = dao.objectNextCalculate(vo);
		
		if(objectNextCalculate != null){
			if("Y".equals(objectNextCalculate.getConfirmYn())){
				return "90";
			}
		}
		
		dao.updateCalculateConfirmLockCancel(vo);
		
		return "1";
	}	
}
