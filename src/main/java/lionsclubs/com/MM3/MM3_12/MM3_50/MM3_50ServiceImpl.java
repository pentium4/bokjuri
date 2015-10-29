package lionsclubs.com.MM3.MM3_12.MM3_50;

import java.util.List;

import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21DAO;
import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21VO;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_50ServiceImpl extends AbstractServiceImpl implements MM3_50Service{
	@Autowired private MM3_50DAO dao;
	@Autowired private MM3_21DAO mm321Dao;
	
	@Override
	public List<MM3_50VO> MM3_50(MM3_50VO vo) throws Exception {
		return dao.MM3_50(vo);
	}
	
	@Override
	public MM3_50VO amountSum(MM3_50VO vo) throws Exception {
		return dao.amountSum(vo);
	}
	
	@Override
	public MM3_50VO objectExpend(MM3_50VO vo) throws Exception {
		return dao.objectExpend(vo);
	}
	
	@Override
	public String saveExpend(MM3_50VO vo) throws Exception {
		String message = saveExpendProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("정산이 완료되어 저장할 수 없습니다.");
				sMessage = "정산이 완료되어 저장할 수 없습니다.";
			break;
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveExpendProcess(MM3_50VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		MM3_21VO mm321vo = new MM3_21VO();
		mm321vo.setDistrictCode(vo.getOrganCode());
		mm321vo.setSessionYear(vo.getSessionYear());
		MM3_21VO objectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(objectPaymentSettle != null){
			if("Y".equals(objectPaymentSettle.getConfirmYn())
					|| "Y".equals(objectPaymentSettle.getConfirmLockYn())){
				return "90";	// 현재회기 정산이 완료
			}
		}
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.updateExpend(vo);
		} else {
			dao.insertExpend(vo);
		}
		
		return "1";
	}	
	
	@Override
	public String deleteExpend(MM3_50VO vo) throws Exception {
		String message = deleteExpendProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("정산이 완료되어 삭제할 수 없습니다.");
				sMessage = "정산이 완료되어 삭제할 수 없습니다.";
			break;
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String deleteExpendProcess(MM3_50VO vo) throws Exception {
		
		MM3_21VO mm321vo = new MM3_21VO();
		mm321vo.setDistrictCode(vo.getOrganCode());
		mm321vo.setSessionYear(vo.getSessionYear());
		MM3_21VO objectPaymentSettle = mm321Dao.objectPaymentSettle(mm321vo);
		if(objectPaymentSettle != null){
			if("Y".equals(objectPaymentSettle.getConfirmYn())
					|| "Y".equals(objectPaymentSettle.getConfirmLockYn())){
				return "90";	// 현재회기 정산이 완료
			}
		}		
		
		dao.deleteExpend(vo);
		
		return "1";
	}
}
