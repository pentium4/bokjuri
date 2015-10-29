package lionsclubs.com.MM1.MM1_2.MM1_09;

import java.util.List;
import java.util.Map;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_09ServiceImpl extends AbstractServiceImpl implements MM1_09Service{
	@Autowired private MM1_09DAO dao;

	@Override
	public List<MM1_09VO> List(MM1_09VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public MM1_09VO Select(MM1_09VO vo) throws Exception {
		return dao.Select(vo);
	}

	@Override
	public MM1_09VO SelectPaymentSum(MM1_09VO vo) throws Exception {
		return dao.SelectPaymentSum(vo);
	}

	@Override
	public String insert(MM1_09VO vo) throws Exception {
		String message = insertProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.");
				sMessage = vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.";
				break;
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String insertProcess(MM1_09VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		vo.setCaYm(vo.getGenDate().substring(0,6));	/* 발생일자를 회기년월로 넣음 */
		/*
		 * 정산현황이 마감되지 않았을때만 저장 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		if("Y".equals(confirmyn)){
			return "90";
		}
		
		/*
		 * 정산현황 체크
		 */
		int calcount = dao.SelectCalCount(vo);
		if(calcount == 0) {
			dao.InsertCal(vo);
		}

		vo.setImpostMemberNo(user.getId());	/* 부과자 회원번호 */
		vo.setIdnNo(dao.InsertMaster(vo));
		dao.InsertImpost(vo);
		
		return "1";
	}

	@Override
	public String update(MM1_09VO vo) throws Exception {
		String message = updateProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 수정이 불가합니다.");
				sMessage = vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 수정이 불가합니다.";
				break;
			case 91:
				log.debug("납부내역이 있어서 수정이 불가능 합니다.\n납부내역을 모두 삭제하고 시도해 주세요.");
				sMessage = "납부내역이 있어서 수정이 불가능 합니다.\n납부내역을 모두 삭제하고 시도해 주세요.";
				break;
			default:
				log.debug("수정 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	public String updateProcess(MM1_09VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		MM1_09VO detail = dao.Select(vo);
		vo.setCaYm(detail.getGenDate().substring(0,6));	/* 발생일자를 회기년월로 넣음 */
		/*
		 * 정산현황이 마감되지 않았을때만 수정 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		if("Y".equals(confirmyn)){
			return "90";
		}

		// 납부내역이 있는지 체크한다.
		if(dao.SelectPaymentCount(vo) > 0){
			return "91";
		}
		
		dao.UpdateImpost(vo);
		
		return "1";		
	}
	
	@Override
	public String delete(MM1_09VO vo) throws Exception {
		String message = deleteProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 삭제가 불가합니다.");
				sMessage = vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 삭제가 불가합니다.";
				break;
			case 91:
				log.debug("납부내역이 있어서 삭제가 불가능 합니다.\n납부내역을 모두 삭제하고 시도해 주세요.");
				sMessage = "납부내역이 있어서 삭제가 불가능 합니다.\n납부내역을 모두 삭제하고 시도해 주세요.";
				break;
			default:
				log.debug("삭제 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	public String deleteProcess(MM1_09VO vo) throws Exception {
		MM1_09VO detail = dao.Select(vo);
		vo.setCaYm(detail.getGenDate().substring(0,6));	/* 발생일자를 회기년월로 넣음 */
		/*
		 * 정산현황이 마감되지 않았을때만 수정 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		if("Y".equals(confirmyn)){
			return "90";
		}
		
		// 납부내역이 있는지 체크한다.
		if(dao.SelectPaymentCount(vo) > 0){
			return "91";
		}
		
		// 1. 납부금 삭제
		dao.DeletePayment(vo);
		// 2. 부과 보조 마스터 삭제
		dao.DeleteImpost(vo);
		// 3. 부과 마스터 삭제
		dao.DeleteMaster(vo);
		
		return "1";		
	}	
	
	@Override
	public String SelectOrganCode(MM1_09VO vo) throws Exception {
		MM1_09VO aa = dao.SelectOrganCode(vo);
		return aa.getOrganCode();
	}

	@Override
	public Integer SelectMemberPay(Map<String, Object> map) throws Exception {
		return dao.SelectMemberPay(map);
	}

	@Override
	public String SelectDetailType(Map<String, Object> map) throws Exception {
		return dao.SelectDetailType(map);
	}

	@Override
	public String SelectCDate(Map<String, Object> map) throws Exception {
		return dao.SelectCDate(map);
	}

	@Override
	public List<MM1_09VO> SelectClassList(Map<String, Object> map)
			throws Exception {
		/* 사용페이지
		 * 	MM1_09
		 * 	MM2_14
		 */
		return dao.SelectClassList(map);
	}
	@Override
	public List<MM1_09VO> SelectDetailList(Map<String, Object> map)
			throws Exception {
		return dao.SelectDetailList(map);
	}
	
	@Override
	public List<MM1_09VO> listPayment(MM1_09VO vo) throws Exception {
		return dao.listPayment(vo);
	}
	
	@Override
	public String payment(MM1_09VO vo) throws Exception {
		String message = paymentProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 납부처리가 불가합니다.");
				sMessage = vo.getCaYm().substring(0,4) + "년" + vo.getCaYm().substring(4,6) + "월 정산처리 되어 납부처리가 불가합니다.";
				break;
			case 91:
				log.debug("납부금이 부과금 보다 많습니다.");
				sMessage = "납부금이 부과금 보다 많습니다.";
				break;
			default:
				log.debug("납부처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;	
	}
	
	public String paymentProcess(MM1_09VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(vo.getInsertPaymentArray() != null){
			for(MM1_09VO ip : vo.getInsertPaymentArray()){
				ip.setInsertName(user.getId());
				ip.setUpdateName(user.getId());
				
				/*
				 * 정산현황이 마감되지 않았을때만 납부처리 가능!! 
				 */
				ip.setOrganCode(vo.getOrganCode());
				ip.setCaYm(ip.getPaymentDate().substring(0,6));
				String confirmyn = dao.SelectCal(ip);
				
				if("Y".equals(confirmyn)){
					vo.setCaYm(ip.getPaymentDate().substring(0,6));
					return "90";
				}
			}			
		}
		
		if(vo.getUpdatePaymentArray() != null){
			for(MM1_09VO up : vo.getUpdatePaymentArray()){
				up.setUpdateName(user.getId());
				
				/*
				 * 정산현황이 마감되지 않았을때만 납부처리 가능!! 
				 */
				up.setOrganCode(vo.getOrganCode());
				up.setCaYm(up.getPaymentDate().substring(0,6));
				String confirmyn = dao.SelectCal(up);
				
				if("Y".equals(confirmyn)){
					vo.setCaYm(up.getPaymentDate().substring(0,6));
					return "90";
				}
			}
		}		
		
		int payment = 0;
		if(vo.getPaymentArray() != null){
			for(MM1_09VO p : vo.getPaymentArray()){
				payment += Integer.parseInt(p.getPayment().replaceAll("\\,", ""));
			}
		}
		
		MM1_09VO impostVO = dao.Select(vo);
		Double impost = Double.parseDouble(impostVO.getImpost());
		
		if(payment > impost){
			return "91";
		}
		
		if(vo.getDeletePaymentArray() != null){
			for(MM1_09VO dp : vo.getDeletePaymentArray()){
				dp.setIdnNo(vo.getIdnNo());
				dao.DeletePayment(dp);
			}
		}
		
		if(vo.getInsertPaymentArray() != null){
			for(MM1_09VO ip : vo.getInsertPaymentArray()){
				ip.setIdnNo(vo.getIdnNo());
				dao.InsertPayment(ip);
			}			
		}
		
		if(vo.getUpdatePaymentArray() != null){
			for(MM1_09VO up : vo.getUpdatePaymentArray()){
				up.setIdnNo(vo.getIdnNo());
				dao.UpdatePayment(up);
			}			
		}
		
		return "1";
	}
	
	@Override
	public MM1_09VO objectPayment(MM1_09VO vo) throws Exception {
		return dao.objectPayment(vo);
	}
	
	@Override
	public MM1_09VO objectTreasurer(MM1_09VO vo) throws Exception {
		return dao.objectTreasurer(vo);
	}
}
