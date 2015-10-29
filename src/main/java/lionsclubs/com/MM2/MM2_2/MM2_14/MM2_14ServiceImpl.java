package lionsclubs.com.MM2.MM2_2.MM2_14;

import java.util.List;

import lionsclubs.com.MM1.MM1_2.MM1_09.MM1_09DAO;
import lionsclubs.com.MM1.MM1_2.MM1_09.MM1_09VO;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_14ServiceImpl extends AbstractServiceImpl implements MM2_14Service{
	
	@Autowired private MM2_14DAO dao;
	@Autowired private MM1_09DAO mm109Dao;
	
	@Override
	public List<MM2_14VO> MM2_14(MM2_14VO vo) throws Exception {
		return dao.MM2_14(vo);
	}

	@Override
	public MM2_14VO total(MM2_14VO vo) throws Exception {
		return dao.total(vo);
	}
	
	@Override
	public List<MM2_14VO> listImpostMember(MM2_14VO vo) throws Exception {
		return dao.listImpostMember(vo);
	}
	
	@Override
	public String insertImpost(MM2_14VO vo) throws Exception {
		String message = insertImpostProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.");
				sMessage = vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.";
				break;
			case 91: 
				log.debug("중복된 부과일자의 수입분류항목, 수입세부항목이 있습니다.");
				sMessage = "중복된 부과일자의 수입분류항목, 수입세부항목이 있습니다.";
				break;
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String insertImpostProcess(MM2_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		MM1_09VO mm109VO = new MM1_09VO();
		mm109VO.setOrganCode(vo.getOrganCode());
		mm109VO.setCaYm(vo.getGenDate().substring(0,6));	/* 발생일자를 회기년월로 넣음 */
		/*
		 * 정산현황이 마감되지 않았을때만 저장 가능!! 
		 */
		String confirmyn = mm109Dao.SelectCal(mm109VO);
		if("Y".equals(confirmyn)){
			return "90";
		}
		
		MM2_14VO detail = dao.detail(vo);
		if(detail != null){
			return "91";
		}
		
		/*
		 * 정산현황 체크
		 */
		int calcount = mm109Dao.SelectCalCount(mm109VO);
		if(calcount == 0) {
			mm109Dao.InsertCal(mm109VO);
		}
		
		dao.insertIncomeExpend(vo);
		
		mm109VO.setImpostMemberNo(user.getId());	/* 부과자 회원번호 */
		mm109VO.setGenDate(vo.getGenDate());
		mm109VO.setClassItemCode(vo.getClassItemCode());
		mm109VO.setDetailItemCode(vo.getDetailItemCode());
		 
		if(vo.getInsertImpostArray() != null){
			for(MM2_14VO impost : vo.getInsertImpostArray()){
				mm109VO.setMemberNo(impost.getMemberNo());
				mm109VO.setImpost(impost.getImpost());
				mm109VO.setReference(impost.getReference());			
				mm109VO.setIdnNo(mm109Dao.InsertMaster(mm109VO));
				mm109Dao.InsertImpost(mm109VO);
			}
		}
		
		return "1";
	}
	
	@Override
	public String updateImpost(MM2_14VO vo) throws Exception {
		String message = updateImpostProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.");
				sMessage = vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.";
				break;
			case 91: 
				log.debug("납부가된 회원이 있어 수정이 불가능 합니다\n개인기록관리 > 개인 납부금 업무 > 납부금 입력/조회 에서 납부금을 모두 삭제하시고 다시 시도해 주세요.");
				sMessage = "납부가된 회원이 있어 수정이 불가능 합니다\n개인기록관리 > 개인 납부금 업무 > 납부금 입력/조회 에서 납부금을 모두 삭제하시고 다시 시도해 주세요.";
				break;	
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateImpostProcess(MM2_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		MM1_09VO mm109VO = new MM1_09VO();
		mm109VO.setOrganCode(vo.getOrganCode());
		mm109VO.setCaYm(vo.getGenDate().substring(0,6));	/* 발생일자를 회기년월로 넣음 */
		/*
		 * 정산현황이 마감되지 않았을때만 저장 가능!! 
		 */
		String confirmyn = mm109Dao.SelectCal(mm109VO);
		if("Y".equals(confirmyn)){
			return "90";
		}
	
		if(vo.getUpdateImpostArray() != null){
			for(MM2_14VO impost : vo.getUpdateImpostArray()){
				mm109VO.setIdnNo(impost.getIdnNo());
				
				if(mm109Dao.SelectPaymentCount(mm109VO) > 0){
					return "91";
				}
			}
		}
		
		if(vo.getDeleteImpostArray() != null){
			for(MM2_14VO impost : vo.getDeleteImpostArray()){
				mm109VO.setIdnNo(impost.getIdnNo());
				
				if(mm109Dao.SelectPaymentCount(mm109VO) > 0){
					return "91";
				}
			}
		}
		
		dao.updateIncomeExpend(vo);
		
		mm109VO.setImpostMemberNo(user.getId());	/* 부과자 회원번호 */
		mm109VO.setGenDate(vo.getGenDate());
		mm109VO.setClassItemCode(vo.getClassItemCode());
		mm109VO.setDetailItemCode(vo.getDetailItemCode());
	
		if(vo.getInsertImpostArray() != null){
			for(MM2_14VO impost : vo.getInsertImpostArray()){
				mm109VO.setMemberNo(impost.getMemberNo());
				mm109VO.setImpost(impost.getImpost());
				mm109VO.setReference(impost.getReference());			
				mm109VO.setIdnNo(mm109Dao.InsertMaster(mm109VO));
				mm109Dao.InsertImpost(mm109VO);
			}
		}
		
		if(vo.getUpdateImpostArray() != null){
			for(MM2_14VO impost : vo.getUpdateImpostArray()){
				mm109VO.setIdnNo(impost.getIdnNo());
				mm109VO.setImpost(impost.getImpost());
				mm109VO.setReference(impost.getReference());
				mm109Dao.UpdateImpost(mm109VO);
			}
		}
		
		if(vo.getDeleteImpostArray() != null){
			for(MM2_14VO impost : vo.getDeleteImpostArray()){
				mm109VO.setIdnNo(impost.getIdnNo());
				mm109Dao.DeleteImpost(mm109VO);	
				mm109Dao.DeleteMaster(mm109VO);
			}
		}
		
		return "1";
	}	
	
	@Override
	public String deleteImpost(MM2_14VO vo) throws Exception {
		String message = deleteImpostProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.");
				sMessage = vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.";
				break;
			case 91: 
				log.debug("납부가된 회원이 있어 삭제가 불가능 합니다\n개인기록관리 > 개인 납부금 업무 > 납부금 입력/조회 에서 납부금을 모두 삭제하시고 다시 시도해 주세요.");
				sMessage = "납부가된 회원이 있어 삭제가 불가능 합니다\n개인기록관리 > 개인 납부금 업무 > 납부금 입력/조회 에서 납부금을 모두 삭제하시고 다시 시도해 주세요.";
				break;				
			default:
				log.debug("삭제 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String deleteImpostProcess(MM2_14VO vo) throws Exception {
		MM1_09VO mm109VO = new MM1_09VO();
		MM2_14VO detail = dao.detail(vo);
		mm109VO.setCaYm(detail.getGenDate().substring(0,6));	/* 발생일자를 회기년월로 넣음 */
		mm109VO.setOrganCode(vo.getOrganCode());
		/*
		 * 정산현황이 마감되지 않았을때만 삭제 가능!! 
		 */
		String confirmyn = mm109Dao.SelectCal(mm109VO);
		if("Y".equals(confirmyn)){
			vo.setGenDate(detail.getGenDate());
			return "90";
		}
		
		for(MM2_14VO m : dao.listMaster(detail)){
			mm109VO.setIdnNo(m.getIdnNo());
			
			if(mm109Dao.SelectPaymentCount(mm109VO) > 0){
				return "91";
			}
		}
		
		for(MM2_14VO m : dao.listMaster(detail)){
			mm109VO.setIdnNo(m.getIdnNo());
			mm109Dao.DeleteMaster(mm109VO);
			mm109Dao.DeleteImpost(mm109VO);
		}
		
		dao.deleteIncomeExpend(detail);
		
		return "1";
	}
	
	@Override
	public MM2_14VO detail(MM2_14VO vo) throws Exception {
		return dao.detail(vo);
	}
	
	@Override
	public List<MM2_14VO> listPaymentMember(MM2_14VO vo) throws Exception {
		MM2_14VO detail = dao.detail(vo);
		return dao.listPaymentMember(detail);
	}
	
	@Override
	public String payment(MM2_14VO vo) throws Exception {
		String message = paymentProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getPaymentDate().substring(0,4) + "년" + vo.getPaymentDate().substring(4,6) + "월 정산처리 되어 납부가 불가합니다.");
				sMessage = vo.getPaymentDate().substring(0,4) + "년" + vo.getPaymentDate().substring(4,6) + "월 정산처리 되어 납부가 불가합니다.";
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
	
	
	public String paymentProcess(MM2_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		MM1_09VO mm109VO = new MM1_09VO();
		
		if(vo.getPaymentArray() != null){
			for(MM2_14VO p : vo.getPaymentArray()){
				/*
				 * 정산현황이 마감되지 않았을때만 납부처리 가능!! 
				 */
				mm109VO.setOrganCode(vo.getOrganCode());
				mm109VO.setCaYm(p.getPaymentDate().replaceAll("\\.", "").substring(0,6));
				
				String confirmyn = mm109Dao.SelectCal(mm109VO);
				if("Y".equals(confirmyn)){
					vo.setPaymentDate(p.getPaymentDate());
					return "90";
				}
				
				MM2_14VO detailImpostPayment = dao.detailImpostPayment(p);
				double impost = Double.parseDouble(detailImpostPayment.getImpost());
				double payment = Double.parseDouble(detailImpostPayment.getPayment()) + Double.parseDouble(p.getPayment().replaceAll("\\,", ""));
				
				if(payment > impost){
					return "91";
				}
			}
			
			for(MM2_14VO p : vo.getPaymentArray()){
				mm109VO.setInsertName(user.getId());
				mm109VO.setUpdateName(user.getId());
				mm109VO.setIdnNo(p.getIdnNo());
				mm109VO.setPayment(p.getPayment());
				mm109VO.setPaymentDate(p.getPaymentDate());
				mm109VO.setPaymentDefect(p.getPaymentDefect());
				mm109Dao.InsertPayment(mm109VO);	
			}
		}
		
		return "1";
	}
}
