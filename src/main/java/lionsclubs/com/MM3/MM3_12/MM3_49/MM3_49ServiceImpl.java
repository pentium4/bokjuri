package lionsclubs.com.MM3.MM3_12.MM3_49;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM3.MM3_12.MM3_45.MM3_45Service;
import lionsclubs.com.MM3.MM3_12.MM3_45.MM3_45VO;
import lionsclubs.com.MM3.MM3_12.MM3_46.MM3_46Service;
import lionsclubs.com.MM3.MM3_12.MM3_46.MM3_46VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_49ServiceImpl extends AbstractServiceImpl implements MM3_49Service{
	@Autowired private MM3_49DAO dao;
	@Resource private MM3_45Service mm345Service;
	@Resource private MM3_46Service mm346Service;
	
	@Override
	public Page MM3_49(MM3_49VO vo) throws Exception {
		return dao.MM3_49(vo);
	}

	@Override
	public MM3_49VO total(MM3_49VO vo) throws Exception {
		return dao.total(vo);
	}
	
	@Override
	public List<MM3_49VO> listImpost(MM3_49VO vo) throws Exception {
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			vo = dao.objectImpost(vo);
		}
		
		vo.setSessionYear(CommonUtil.dateToSessionYear(vo.getGenDate().replaceAll(",", "")));
		
		return dao.listImpost(vo);
	}
	
	@Override
	public String saveImpost(MM3_49VO vo) throws Exception {
		String message = saveImpostProcess(vo);
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
	
	public String saveImpostProcess(MM3_49VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		MM3_45VO mm345VO = new MM3_45VO();
		mm345VO.setOrganCode(vo.getOrganCode());
		mm345VO.setGenDate(vo.getGenDate());
		mm345VO.setClassItemCode(vo.getClassItemCode());
		mm345VO.setDetailItemCode(vo.getDetailItemCode());
		if(vo.getSaveImpostArray() != null){
			for(MM3_49VO impost : vo.getSaveImpostArray()){
				mm345VO.setIdnNo(impost.getIdnNo());
				mm345VO.setClubCode(impost.getClubCode());
				mm345VO.setImpost(impost.getImpost());
				
				mm345Service.saveImpost(mm345VO);
			}
		}
		
		if(vo.getDeleteImpostArray() != null){
			for(MM3_49VO impost : vo.getDeleteImpostArray()){
				mm345VO.setIdnNo(impost.getIdnNo());
				mm345Service.deleteImpost(mm345VO);
			}
		}
		
		return "1";
	}
	
	@Override
	public String deleteImpost(MM3_49VO vo) throws Exception {
		String message = deleteImpostProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.");
				sMessage = vo.getGenDate().substring(0,4) + "년" + vo.getGenDate().substring(4,6) + "월 정산처리 되어 입력이 불가합니다.";
				break;
			case 91: 
				log.debug("납부가된 클럽이 있어 삭제가 불가능 합니다\n지구관리 > 수입 및 지출 > 납부금 입력/조회 에서 납부금을 모두 삭제하시고 다시 시도해 주세요.");
				sMessage = "납부가된 클럽이 있어 삭제가 불가능 합니다\n지구관리 > 수입 및 지출 > 납부금 입력/조회 에서 납부금을 모두 삭제하시고 다시 시도해 주세요.";
				break;				
			default:
				log.debug("삭제 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String deleteImpostProcess(MM3_49VO vo) throws Exception {
		
		MM3_45VO mm345VO = new MM3_45VO();
		
		MM3_49VO objectImpost = dao.objectImpost(vo);
		objectImpost.setOrganCode(vo.getOrganCode());
		objectImpost.setSessionYear(CommonUtil.dateToSessionYear(objectImpost.getGenDate().replaceAll(",", "")));
		for(MM3_49VO impost : dao.listImpost(objectImpost)){
			
			if(StringUtils.isNotEmpty(impost.getPaymentIdnNo())){
				return "91";
			}
			
			mm345VO.setIdnNo(impost.getIdnNo());
			mm345Service.deleteImpost(mm345VO);
		}
		
		return "1";
	}
	
	@Override
	public MM3_49VO objectImpost(MM3_49VO vo) throws Exception {
		return dao.objectImpost(vo);
	}
	
	@Override
	public List<MM3_49VO> listPayment(MM3_49VO vo) throws Exception {
		vo = dao.objectImpost(vo);
		vo.setSessionYear(CommonUtil.dateToSessionYear(vo.getGenDate().replaceAll(",", "")));
		
		return dao.listPayment(vo);
	}
	
	@Override
	public String payment(MM3_49VO vo) throws Exception {
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
	
	public String paymentProcess(MM3_49VO vo) throws Exception {
		MM3_46VO mm346VO = new MM3_46VO();
		if(vo.getPaymentArray() != null){
			for(MM3_49VO payment : vo.getPaymentArray()){
				mm346VO.setIdnNo(payment.getIdnNo());
				mm346VO.setPaymentDate(payment.getPaymentDate());
				mm346VO.setPayment(payment.getPayment());
				mm346VO.setPaymentDefect(payment.getPaymentDefect());
				
				mm346Service.savePayment(mm346VO);
			}
		}
		
		return "1";
	}
}
