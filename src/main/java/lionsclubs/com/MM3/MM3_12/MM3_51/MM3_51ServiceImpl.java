package lionsclubs.com.MM3.MM3_12.MM3_51;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_51ServiceImpl extends AbstractServiceImpl implements MM3_51Service{
	@Autowired private MM3_51DAO dao;

	@Override
	public List<MM3_51VO> listDeposit(MM3_51VO vo) throws Exception {
		return dao.listDeposit(vo);
	}

	@Override
	public MM3_51VO objectDeposit(MM3_51VO vo) throws Exception {
		return dao.objectDeposit(vo);
	}

	@Override
	public String saveDeposit(MM3_51VO vo) throws Exception {
		String message = saveDepositProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			default:
				log.debug("예금저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;		
	}
	
	public String saveDepositProcess(MM3_51VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.updateDeposit(vo);	
		} else {
			dao.insertDeposit(vo);	
		}
		
		return "1";
	}	
	
	@Override
	public Integer deleteDeposit(MM3_51VO vo) throws Exception {
		return dao.deleteDeposit(vo);
	}

	@Override
	public MM3_51VO sumDeposit(MM3_51VO vo) throws Exception {
		return dao.sumDeposit(vo);
	}
	
	@Override
	public String updateWithdraw(MM3_51VO vo) throws Exception {
		String message = updateWithdrawProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			default:
				log.debug("출금처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	public String updateWithdrawProcess(MM3_51VO vo) throws Exception {
		
		dao.updateWithDraw(vo);
		
		return "1";
	}
	
	@Override
	public String updateWithdrawCancel(MM3_51VO vo) throws Exception {
		String message = updateWithdrawCancelProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			default:
				log.debug("출금취소 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateWithdrawCancelProcess(MM3_51VO vo) throws Exception {
		
		dao.updateWithDrawCancel(vo);
		
		return "1";
	}
}
