package lionsclubs.com.MM3.MM3_4.MM3_22;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21DAO;
import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21VO;
import lionsclubs.com.MM3.MM3_4.MM3_22_A.MM3_22_ADAO;
import lionsclubs.com.MM3.MM3_4.MM3_22_A.MM3_22_AVO;
import lionsclubs.com.MM3.MM3_4.MM3_24.MM3_24Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_22ServiceImpl extends AbstractServiceImpl implements MM3_22Service{
	@Autowired private MM3_22DAO dao;
	@Autowired private MM3_22_ADAO mm322Adao;
	@Autowired private MM3_21DAO mm321Dao;	
	@Resource private MM3_24Service mm324Service;
	
	@Override
	public List<MM3_22VO> MM3_22(MM3_22VO vo) throws Exception {
		return dao.MM3_22(vo);
	}
	
	@Override
	public String payment(MM3_22VO vo) throws Exception {
		String message = paymentProcess(vo);
		String sMessage = null;
		
    	/*
    	오류 메세지 정보
    	message = "90";	// 동일한 납일일자가 존재함.
    	message = "91";	// 납부할 금액이 초과함.
    	message = "92";	// 현재회기 정산이 완료되어 납부할수 없음.
    	message = "93";	// 미납금은 전회기 정산확정이 되어야 납부할수 있음.
    	message = "1";	// 납부금 입력 완료
		*/		
		switch(Integer.parseInt(message)){
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
	
	public String paymentProcess(MM3_22VO vo) throws Exception {
		for(MM3_22VO vo2 : vo.getClubPaymentArray()){
			if(vo2.getDollarYN().equals("Y")){
				if(StringUtils.isEmpty(vo2.getPaymentDate())
						&& StringUtils.isEmpty(vo2.getPaymentDollar())){
					continue;
				}
			} else {
				if(StringUtils.isEmpty(vo2.getPaymentDate())
						&& StringUtils.isEmpty(vo2.getPayment())){
					continue;
				}
			}
			
			MM3_22_AVO mm322AVO = new MM3_22_AVO();
			mm322AVO.setClubCode(vo2.getClubCode());
			mm322AVO.setSessionYear(vo2.getSessionYear());
			mm322AVO.setDistrictCode(vo2.getDistrictCode());
			mm322AVO.setFirstSecKind(vo2.getFirstSecKind());
			mm322AVO.setItemKindCode(vo2.getItemKindCode());
			mm322AVO.setItemCode(vo2.getItemCode());
			mm322AVO.setDollarYN(vo2.getDollarYN());
			mm322AVO.setPaymentDate(vo2.getPaymentDate());
			mm322AVO.setPaymentDollar(vo2.getPaymentDollar());
			mm322AVO.setPayment(vo2.getPayment());
		
			if(mm322Adao.dupPaymentDateCnt(mm322AVO) > 0){
				return "90";	// 동일한 납일일자가 존재함
			}
			
			if(mm322Adao.objectBalance(mm322AVO) < 0){
				return "91";	// 납부할 금액이 초과함
			}
			
			MM3_21VO mm321vo = new MM3_21VO();
			mm321vo.setDistrictCode(vo2.getDistrictCode());
			mm321vo.setSessionYear(vo2.getSessionYear());
			MM3_21VO objectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
			if(objectPaymentSettle != null){
				if("Y".equals(objectPaymentSettle.getConfirmYn())
						|| "Y".equals(objectPaymentSettle.getConfirmLockYn())){
					return "92";	// 현재회기 정산이 완료되어 납부할수 없음.
				}
			}
	
			mm321vo.setSessionYear(String.valueOf(Integer.parseInt(vo2.getSessionYear()) -1));
			MM3_21VO prevObjectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
			if(prevObjectPaymentSettle != null){
				if(vo2.getFirstSecKind().equals("1000")
						&& !"Y".equals(prevObjectPaymentSettle.getConfirmLockYn())){
					return "93";	// 미납금은 전회기 정산확정이 되어야 납부할수 있음.
				}
			}
			
			// 달러일 경우
			if(vo2.getDollarYN().equals("Y")){
				String yyyymm = vo2.getPaymentDate().replaceAll("\\.", "").substring(0,6);
				Integer rateWon = mm324Service.objectRates(yyyymm);
				
				if(rateWon <= 0){
					return "94";
				}	
			}
			
			if(!CommonUtil.dateToSessionYear(vo2.getPaymentDate()).equals(vo2.getSessionYear())){
				return "95";
			}
		}
		
		for(MM3_22VO vo2 : vo.getClubPaymentArray()){
			MM3_22_AVO mm322AVO = new MM3_22_AVO();
			mm322AVO.setClubCode(vo2.getClubCode());
			mm322AVO.setSessionYear(vo2.getSessionYear());
			mm322AVO.setDistrictCode(vo2.getDistrictCode());
			mm322AVO.setFirstSecKind(vo2.getFirstSecKind());
			mm322AVO.setItemKindCode(vo2.getItemKindCode());
			mm322AVO.setItemCode(vo2.getItemCode());
			mm322AVO.setDollarYN(vo2.getDollarYN());
			mm322AVO.setPaymentDate(vo2.getPaymentDate());
			mm322AVO.setPaymentDollar(vo2.getPaymentDollar());
			mm322AVO.setPayment(vo2.getPayment());
			
			// 달러일 경우
			if(vo2.getDollarYN().equals("Y")){
				String yyyymm = vo2.getPaymentDate().replaceAll("\\.", "").substring(0,6);
				Integer rateWon = mm324Service.objectRates(yyyymm);
				
				int payment = Integer.parseInt(vo2.getPaymentDollar().replace(",", "")) * rateWon;
				mm322AVO.setPayment(String.valueOf(payment));
			}
			
			mm322Adao.insertClubPayment(mm322AVO);
		}
		
		return "1";
	}
	
	@Override
	public Boolean insertDistrictItemPayment(MM3_22VO vo) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		dao.deleteDistrictItemPayment(vo);
		return dao.insertDistrictItemPayment(vo);
	}
	
	@Override
	public List<MM3_22VO> listClubPayment(MM3_22VO vo) throws Exception {
		return dao.listClubPayment(vo);
	}
}
