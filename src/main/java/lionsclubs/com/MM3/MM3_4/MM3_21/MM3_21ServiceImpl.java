package lionsclubs.com.MM3.MM3_4.MM3_21;

import java.util.List;

import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_21ServiceImpl extends AbstractServiceImpl implements MM3_21Service{
	
	@Autowired private MM3_21DAO dao;

	@Override
	public List<MM3_21VO> selectList(MM3_21VO vo) {
		return dao.selectList(vo);
	}
	/**
	 * 입주클럽관리비부과 합계
	 */
	@Override
	public MM3_21VO expensesSum(MM3_21VO vo) throws Exception {
		return dao.expensesSum(vo);
	}
	
	/**
	 * 클럽납부금 정산여부 상세
	 */
	@Override
	public MM3_21VO objectPaymentSettle(MM3_21VO vo) throws Exception {
		return dao.objectPaymentSettle(vo);
	}
	
	@Override
	public String confirm(MM3_21VO vo) throws Exception {
		
		String sMessage = null;
		int errorCode = confirmProcess(vo);
		
    	/*
    	오류 메세지 정보
    	message = "90";	// 중복 정산처리 오류.
    	message = "91";	// 전회기 정산확정이 되지 않음.
    	message = "1";	// 정산처리 완료.
		*/		
		switch(errorCode){
			case 90: 
				log.debug("중복 정산처리 오류.");
				sMessage = "정산처리가 이미 되었습니다.";
				break;
			case 91: 
				log.debug("전회기 정산확정이 되지 않음.");
				sMessage = "전회기에 정산확정이 되지 않아 정산처리를 할 수 없습니다.";
				break;
			case 1:
				log.debug("정산처리 완료.");
				sMessage = "1";
				break;
			default:
				log.debug("알수 없는 오류.");
				sMessage = "알수 없는 오류.";
				break;
		}
		
		log.debug(sMessage);
		return sMessage;		
	}
	
	
	public Integer confirmProcess(MM3_21VO vo) throws Exception {
		String sessionYear = vo.getSessionYear();
		
		vo.setSessionYear(String.valueOf(Integer.parseInt(sessionYear) - 1));
		MM3_21VO prevObjectPaymentSettle = dao.objectPaymentSettle(vo);
		
		if(prevObjectPaymentSettle == null){
			return 91;	// 전회기 정산확정이 되지 않음.
		}
		
		if(!"Y".equals(prevObjectPaymentSettle.getConfirmLockYn())){
			return 91;	// 전회기 정산확정이 되지 않음.
		}
		
		vo.setSessionYear(sessionYear);
		MM3_21VO objectPaymentSettle = dao.objectPaymentSettle(vo);
		
		if(objectPaymentSettle != null){
			
			if("Y".equals(objectPaymentSettle.getConfirmYn())){
				return 90;	// 중복 정산처리 오류.
			}
			
			// 정산처리
			vo.setSessionYear(sessionYear);
			dao.deleteDistrictItemPaymentUnPaid(vo);
			dao.insertDistrictItemPaymentUnPaid(vo);
			
			vo.setConfirmYn("Y");
			vo.setConfirmCount(objectPaymentSettle.getConfirmCount() + 1);
			return dao.updatePaymentSettleConfirm(vo);
		} else {
			// 정산처리
			return dao.insertPaymentSettleConfirm(vo) == true ? 1 : 0;
		}
	}
	
	@Override
	public String confirmCancel(MM3_21VO vo) throws Exception {
		String sMessage = null;
		int errorCode = confirmCancelProcess(vo);
		
    	/*
    	오류 메세지 정보
    	message = "90";	// 정산처리가 되지 않았음.
    	message = "1";	// 정산취소 완료.
		*/		
		switch(errorCode){
			case 90: 
				log.debug("정산처리가 되지 않았음.");
				sMessage = "정산처리가 되지 않았습니다.\n정산취소 하려면 정산처리를 해주세요.";
				break;
			case 91: 
				log.debug("정산확정되어 정산취소할수 없음.");
				sMessage = "정산확정되어 정산취소 할 수 없습니다.";
				break;
			case 1:
				log.debug("정산취소 완료.");
				sMessage = "1";
				break;
			default:
				log.debug("알수 없는 오류.");
				sMessage = "알수 없는 오류.";
				break;
		}
		
		log.debug(sMessage);
		return sMessage;
	}
	
	public Integer confirmCancelProcess(MM3_21VO vo) throws Exception {

		MM3_21VO objectPaymentSettle = dao.objectPaymentSettle(vo);
		
		if(objectPaymentSettle == null){
			return 90;	// 정산처리가 되지 않았음.
		}
		
		if(!"Y".equals(objectPaymentSettle.getConfirmYn())){
			return 90;	// 정산처리가 되지 않았음.
		}
		
		if("Y".equals(objectPaymentSettle.getConfirmLockYn())){
			return 91;	// 정산확정되어 정산취소할수 없음.
		}
		
		// 정산취소
		dao.deleteDistrictItemPaymentUnPaid(vo);
		
		vo.setConfirmYn("N");
		vo.setConfirmCount(objectPaymentSettle.getConfirmCount());
		return dao.updatePaymentSettleConfirm(vo);
		
	}
	
	@Override
	public String confirmLock(MM3_21VO vo) throws Exception {
		
		String sMessage = null;
		int errorCode = confirmLockProcess(vo);
		
    	/*
    	오류 메세지 정보
    	message = "90";	// 정산처리가 되지 않았음.
    	message = "1";	// 정산확정 완료.
		*/		
		switch(errorCode){
			case 90: 
				log.debug("정산처리가 되지 않았음.");
				sMessage = "정산처리가 되지 않았습니다.\n정산확정 하려면 정산처리를 해주세요.";
				break;
			case 91: 
				log.debug("중복 정산확정 오류.");
				sMessage = "정산확정이 이미 되었습니다.";
				break;
			case 1:
				log.debug("정산확정 완료.");
				sMessage = "1";
				break;
			default:
				log.debug("알수 없는 오류.");
				sMessage = "알수 없는 오류.";
				break;
		}
		
		log.debug(sMessage);
		return sMessage;
	}
	
	public Integer confirmLockProcess(MM3_21VO vo) throws Exception {

		MM3_21VO objectPaymentSettle = dao.objectPaymentSettle(vo);
		
		if(objectPaymentSettle == null){
			return 90;	// 정산처리가 되지 않았음.
		}
		
		if(!"Y".equals(objectPaymentSettle.getConfirmYn())){
			return 90;	// 정산처리가 되지 않았음.
		}
		
		if("Y".equals(objectPaymentSettle.getConfirmLockYn())){
			return 91;	// 중복 정산확정 오류.
		}
		
		// 정산확정
		dao.deleteDistrictItemPaymentUnPaid(vo);
		dao.insertDistrictItemPaymentUnPaid(vo);
		
		vo.setConfirmLockYn("Y");
		return dao.updatePaymentSettleConfirmLock(vo);
	}	
}
