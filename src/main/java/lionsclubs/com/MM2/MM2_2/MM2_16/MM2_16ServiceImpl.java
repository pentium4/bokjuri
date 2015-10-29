package lionsclubs.com.MM2.MM2_2.MM2_16;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_2.MM2_13.MM2_13Service;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_16ServiceImpl extends AbstractServiceImpl implements MM2_16Service{
	@Autowired private MM2_16DAO dao;
	@Resource private MM2_13Service mm213Service;

	@Override
	public MM2_16VO MM2_16(MM2_16VO vo) throws Exception {
		return dao.MM2_16(vo);
	}
	
	@Override
	public List<MM2_16VO> List(MM2_16VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public void otherIncomeInsert(MM2_16VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		vo.setIdnNo(dao.otherIncomeInsert(vo));
		dao.insertIncomeExpend(vo);
	}
	
	@Override
	public Integer otherIncomeUpdate(MM2_16VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());

		dao.deleteIncomeExpend(vo);
		MM2_16VO detail = dao.MM2_16(vo);
		dao.insertIncomeExpend(detail);
		
		return dao.otherIncomeUpdate(vo);
	}

	@Override
	public Integer otherIncomeDelete(MM2_16VO vo) throws Exception {
		dao.deleteIncomeExpend(vo);
		return dao.otherIncomeDelete(vo);
	}

	@Override
	public MM2_16VO paymentSum(MM2_16VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	/* 월마감여부 확인 */
	@Override
	public Boolean checkClosedMonth(String organCode, String startDate, String endDate) throws Exception {
		MM2_16VO_CLOSE_PARAM vo = new MM2_16VO_CLOSE_PARAM();
		vo.setOrganCode(organCode);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		
		// 정산이 확정되면 LIONS_CALCULATE.CONFIRM_YN에 'Y'가 들어갑니다.
		// 정산이 확정되었으면 true, 미확정이면 false를 반환함.		
		return dao.selectClosedMonthFlag(vo);
	}
	
	@Override
	public String withdraw(MM2_16VO vo) throws Exception {
		String message = withdrawProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("해당 회기의 월정산이 이미 확정되어 출금할 수 없습니다.");
				sMessage = "해당 회기의 월정산이 이미 확정되어 출금할 수 없습니다.";
				break;
			default:
				log.debug("출금처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	public String withdrawProcess(MM2_16VO vo) throws Exception {
		if(checkClosedMonth(vo.getOrganCode(),vo.getEndDate(),vo.getEndDate())) {
			return "90";
		}
		
		dao.withDraw(vo);
		
		return "1";
	}
	
	@Override
	public String withdrawCancel(MM2_16VO vo) throws Exception {
		String message = withdrawCancelProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	// 예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.
    	message = "1";	// 출금완료
    	*/		
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("해당 회기의 월정산이 이미 확정되어 출금취소할 수 없습니다.");
				sMessage = "해당 회기의 월정산이 이미 확정되어 출금취소할 수 없습니다.";
				break;
			default:
				log.debug("출금취소 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String withdrawCancelProcess(MM2_16VO vo) throws Exception {
		if(checkClosedMonth(vo.getOrganCode(),vo.getEndDate(),vo.getEndDate())) {
			return "90";
		}
		
		dao.withDrawCancel(vo);
		
		return "1";
	}	
}
