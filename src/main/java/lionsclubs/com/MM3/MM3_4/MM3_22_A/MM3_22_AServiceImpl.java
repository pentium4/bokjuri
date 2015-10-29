package lionsclubs.com.MM3.MM3_4.MM3_22_A;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21DAO;
import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21VO;
import lionsclubs.com.MM3.MM3_4.MM3_24.MM3_24Service;
import lionsclubs.com.cmm.common.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_22_AServiceImpl extends AbstractServiceImpl implements MM3_22_AService{
	@Autowired private MM3_22_ADAO dao;
	@Autowired private MM3_21DAO mm321Dao;
	@Resource private MM3_24Service mm324Service;
	
	@Override
	public List<MM3_22_AVO> select(MM3_22_AVO vo) throws Exception {
		return dao.select(vo);
	}
	
	public String paymentValidationMessage(int errorCode){
		String sMessage = null;
		
    	/*
    	오류 메세지 정보
    	message = "90";	// 동일한 납일일자가 존재함.
    	message = "91";	// 납부할 금액이 초과함.
    	message = "92";	// 현재회기 정산이 완료되어 납부할수 없음.
    	message = "93";	// 미납금은 전회기 정산확정이 되어야 납부할수 있음.
    	message = "1";	// 납부금 입력 완료
		*/		
		switch(errorCode){
			case 90: 
				log.debug("동일한 납일일자가 존재함.");
				sMessage = "동일한 납부일자가 존재합니다.\n납부금액을 변경하시려면 납부금을 수정해 주세요.";
				break;
			case 91: 
				log.debug("납부할 금액이 초과함.");
				sMessage = "납부할 금액이 초과되었습니다.";
				break;
			case 92: 
				log.debug("현재회기 정산이 완료되어 납부할수 없음.");
				sMessage = "현재회기 정산이 완료되어 납부할수 없습니다.";
				break;
			case 93: 
				log.debug("미납금은 전회기 정산확정이 되어야 납부할수 있음.");
				sMessage = "미납금은 전회기 정산확정이 되어야 납부할수 있습니다.";
				break;
			case 94: 
				log.debug("환율정보가 존재하지 않습니다.");
				sMessage = "환율정보가 존재하지 않습니다.";
				break;
			case 95: 
				log.debug("납부일자가 현재회기가 아닙니다.\n납부일자를 확인해 주세요.");
				sMessage = "납부일자가 현재회기가 아닙니다.\n납부일자를 확인해 주세요.";
				break;				
			case 1:
				log.debug("납부금 입력 완료.");
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

	@Override
	public String insertClubPayment(MM3_22_AVO vo) throws Exception {
		int message = insertClubPaymentProcess(vo);
		
		return paymentValidationMessage(message);
	}
	
	public Integer insertClubPaymentProcess(MM3_22_AVO vo) throws Exception {
		int errorCode = 0;

		if(dao.dupPaymentDateCnt(vo) > 0){
			return 90;	// 동일한 납일일자가 존재함
		}
		
		if(dao.objectBalance(vo) < 0){
			return 91;	// 납부할 금액이 초과함
		}
		
		MM3_21VO mm321vo = new MM3_21VO();
		mm321vo.setDistrictCode(vo.getDistrictCode());
		mm321vo.setSessionYear(vo.getSessionYear());
		MM3_21VO objectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(objectPaymentSettle != null){
			if("Y".equals(objectPaymentSettle.getConfirmYn())
					|| "Y".equals(objectPaymentSettle.getConfirmLockYn())){
				return 92;	// 현재회기 정산이 완료되어 납부할수 없음.
			}
		}

		mm321vo.setSessionYear(String.valueOf(Integer.parseInt(vo.getSessionYear()) -1));
		MM3_21VO prevObjectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(prevObjectPaymentSettle != null){
			if(vo.getFirstSecKind().equals("1000")
					&& !"Y".equals(prevObjectPaymentSettle.getConfirmLockYn())){
				return 93;	// 미납금은 전회기 정산확정이 되어야 납부할수 있음.
			}
		}
		
		// 달러일 경우
		if(vo.getDollarYN().equals("Y")){
			String yyyymm = vo.getPaymentDate().replaceAll("\\.", "").substring(0,6);
			Integer rateWon = mm324Service.objectRates(yyyymm);
			
			if(rateWon <= 0){
				return 94;
			}
			
			int payment = Integer.parseInt(vo.getPaymentDollar().replace(",", "")) * rateWon;
			vo.setPayment(String.valueOf(payment));
		}
		
		if(!CommonUtil.dateToSessionYear(vo.getPaymentDate()).equals(vo.getSessionYear())){
			return 95;
		}
		
		if(dao.insertClubPayment(vo)){
			errorCode = 1;
		}
		
		return errorCode;
	}
	
	@Override
	public String updateClubPayment(MM3_22_AVO vo) throws Exception {
		int errorCode = updateClubPaymentProcess(vo);
		
		return paymentValidationMessage(errorCode);
	}
	
	public Integer updateClubPaymentProcess(MM3_22_AVO vo) throws Exception {
		if(dao.dupPaymentDateCnt(vo) > 0){
			return 90;	// 동일한 납일일자가 존재함
		}
		
		if(dao.objectBalance(vo) < 0){
			return 91;	// 납부할 금액이 초과함
		}
		
		MM3_21VO mm321vo = new MM3_21VO();
		mm321vo.setDistrictCode(vo.getDistrictCode());
		mm321vo.setSessionYear(vo.getSessionYear());
		MM3_21VO objectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(objectPaymentSettle != null){
			if("Y".equals(objectPaymentSettle.getConfirmYn())
					|| "Y".equals(objectPaymentSettle.getConfirmLockYn())){
				return 92;	// 현재회기 정산이 완료되어 납부할수 없음.
			}
		}

		mm321vo.setSessionYear(String.valueOf(Integer.parseInt(vo.getSessionYear()) -1));
		MM3_21VO prevObjectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(prevObjectPaymentSettle != null){
			if(vo.getFirstSecKind().equals("1000")
					&& !"Y".equals(prevObjectPaymentSettle.getConfirmLockYn())){
				return 93;	// 미납금은 전회기 정산확정이 되어야 납부할수 있음.
			}
		}
		
		// 달러일 경우
		if(vo.getDollarYN().equals("Y")){
			String yyyymm = vo.getPaymentDate().replaceAll("\\.", "").substring(0,6);
			Integer rateWon = mm324Service.objectRates(yyyymm);
			
			if(rateWon <= 0){
				return 94;
			}
			
			int payment = Integer.parseInt(vo.getPaymentDollar().replace(",", "")) * rateWon;
			vo.setPayment(String.valueOf(payment));
		}
		
		if(!CommonUtil.dateToSessionYear(vo.getPaymentDate()).equals(vo.getSessionYear())){
			return 95;
		}		
		
		return dao.updateClubPayment(vo);
	}
	
	@Override
	public String deleteClubPayment(MM3_22_AVO vo) throws Exception {
		String sMessage = null;
		int errorCode = deleteClubPaymentProcess(vo);
		
    	/*
    	오류 메세지 정보
    	message = "90";	// 현재회기 정산이 완료되어 납부할수 없음.
    	message = "91";	// 미납금은 전회기 정산확정이 되어야 납부할수 있음.
    	message = "1";	// 납부금 입력 완료
		*/		
		switch(errorCode){
			case 90: 
				log.debug("현재회기 정산이 완료되어 납부삭제 할 수 없음.");
				sMessage = "현재회기 정산이 완료되어 납부삭제 할 수 없습니다.";
				break;
			case 91: 
				log.debug("미납금은 전회기 정산확정이 되어야 납부삭제할 수 있음.");
				sMessage = "미납금은 전회기 정산확정이 되어야 납부삭제할 수 있습니다.";
				break;
			case 1:
				log.debug("납부금 삭제 완료.");
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
	
	public Integer deleteClubPaymentProcess(MM3_22_AVO vo) throws Exception {
		
		MM3_21VO mm321vo = new MM3_21VO();
		mm321vo.setDistrictCode(vo.getDistrictCode());
		mm321vo.setSessionYear(vo.getSessionYear());
		MM3_21VO objectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(objectPaymentSettle != null){
			if("Y".equals(objectPaymentSettle.getConfirmYn())
					|| "Y".equals(objectPaymentSettle.getConfirmLockYn())){
				return 90;	// 현재회기 정산이 완료되어 납부삭제 할 수 없음.
			}
		}

		mm321vo.setSessionYear(String.valueOf(Integer.parseInt(vo.getSessionYear()) -1));
		MM3_21VO prevObjectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(prevObjectPaymentSettle != null){
			if(vo.getFirstSecKind().equals("1000")
					&& !"Y".equals(prevObjectPaymentSettle.getConfirmLockYn())){
				return 91;	// 미납금은 전회기 정산확정이 되어야 납부삭제할 수 있음.
			}
		}		
		
		return dao.deleteClubPayment(vo);
	}
	
	@Override
	public MM3_22_AVO objectClubPayment(MM3_22_AVO vo) throws Exception {
		return dao.objectClubPayment(vo);
	}
}
