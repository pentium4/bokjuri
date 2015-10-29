package lionsclubs.com.MM3.MM3_11.MM3_42;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_42ServiceImpl extends AbstractServiceImpl implements MM3_42Service{
	@Autowired private MM3_42DAO dao;

	@Override
	public List<MM3_42VO> MM3_42(MM3_42VO vo) throws Exception {
		return dao.MM3_42(vo);
	}
	
	@Override
	public MM3_42VO amountSum(MM3_42VO vo) throws Exception {
		return dao.amountSum(vo);
	}
	
	@Override
	public MM3_42VO objectDistrictCalculate(MM3_42VO vo) throws Exception {
		return dao.objectDistrictCalculate(vo);
	}
	
	@Override
	public String districtCalculateConfirm(MM3_42VO vo) throws Exception {
		String message = districtCalculateConfirmProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("이전회기에 정산확정이 되지 않아 정산할 수 없습니다.");
				sMessage = "이전회기에 정산확정이 되지 않아 정산할 수 없습니다.";
			break;
			default:
				log.debug("정산 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String districtCalculateConfirmProcess(MM3_42VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		String sessionYear = vo.getSessionYear();
		vo.setSessionYear(String.valueOf(Integer.parseInt(sessionYear) - 1));
		MM3_42VO objectDistrictCalculate = dao.objectDistrictCalculate(vo);
		
		if(objectDistrictCalculate == null){
			return "90";
		}
		
		if(!"Y".equals(objectDistrictCalculate.getConfirmLockYn())){
			return "90";
		}
		
		vo.setSessionYear(sessionYear);
		dao.saveDistrictCalculateConfirm(vo);
		
		return "1";
	}
	
	@Override
	public String districtCalculateConfirmCancel(MM3_42VO vo) throws Exception {
		String message = districtCalculateConfirmCancelProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			default:
				log.debug("정산취소 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	public String districtCalculateConfirmCancelProcess(MM3_42VO vo) throws Exception {
		
		dao.updateDistrictCalculateConfirmCancel(vo);
		
		return "1";
	}
	
	@Override
	public String districtCalculateConfirmLock(MM3_42VO vo) throws Exception {
		String message = districtCalculateConfirmLockProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			default:
				log.debug("정산확정 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String districtCalculateConfirmLockProcess(MM3_42VO vo) throws Exception {
		
		dao.updateDistrictCalculateConfirmLock(vo);
		
		return "1";
	}	
	
	@Override
	public String districtCalculateConfirmLockCancel(MM3_42VO vo) throws Exception {
		String message = districtCalculateConfirmLockCancelProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("다음회기에 정산확정이 되어 있어 정산확정 취소를할 수 없습니다.");
				sMessage = "다음회기에 정산확정이 되어 있어 정산확정 취소를할 수 없습니다.";
			break;		
			default:
				log.debug("정산확정취소 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String districtCalculateConfirmLockCancelProcess(MM3_42VO vo) throws Exception {
		String sessionYear = vo.getSessionYear();
		vo.setSessionYear(String.valueOf(Integer.parseInt(sessionYear) + 1));
		MM3_42VO objectDistrictCalculate = dao.objectDistrictCalculate(vo);
		
		if(objectDistrictCalculate != null){
			if("Y".equals(objectDistrictCalculate.getConfirmLockYn())){
				return "90";
			}
		}
		
		vo.setSessionYear(sessionYear);
		dao.updateDistrictCalculateConfirmLockCancel(vo);
		
		return "1";
	}	
}
