package lionsclubs.com.MM3.MM3_12.MM3_48;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import lionsclubs.com.MM3.MM3_11.MM3_42.MM3_42Service;
import lionsclubs.com.MM3.MM3_11.MM3_42.MM3_42VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_48ServiceImpl extends AbstractServiceImpl implements MM3_48Service{
	@Autowired private MM3_48DAO dao;
	@Resource private MM3_42Service mm342Service;
	@Autowired private ServletContext servletContext;
	
	@Override
	public List<MM3_48VO> MM3_48(MM3_48VO vo) throws Exception {
		return dao.MM3_48(vo);
	}
	
	@Override
	public MM3_48VO amountSum(MM3_48VO vo) throws Exception {
		return dao.amountSum(vo);
	}
	
	@Override
	public MM3_48VO objectIncome(MM3_48VO vo) throws Exception {
		return dao.objectIncome(vo);
	}
	
	@Override
	public String saveIncome(MM3_48VO vo) throws Exception {
		String message = saveIncomeProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("수입일자의 회기에 정산이 완료되어 저장할 수 없습니다.");
				sMessage = "수입일자의 회기에 정산이 완료되어 저장할 수 없습니다.";
			break;		
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveIncomeProcess(MM3_48VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		MM3_42VO mm342VO = new MM3_42VO();
		mm342VO.setOrganCode(vo.getOrganCode());
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			MM3_48VO objectIncome = dao.objectIncome(vo);
			String sessionYear = CommonUtil.dateToSessionYear(objectIncome.getIncomeDate());
			mm342VO.setSessionYear(sessionYear);
			MM3_42VO objectDistrictCalculate = mm342Service.objectDistrictCalculate(mm342VO);
			
			if(objectDistrictCalculate != null){
				if("Y".equals(objectDistrictCalculate.getConfirmYn())){
					return "90";
				}
			}
		} else {
			String sessionYear = CommonUtil.dateToSessionYear(vo.getIncomeDate());
			mm342VO.setSessionYear(sessionYear);
			MM3_42VO objectDistrictCalculate = mm342Service.objectDistrictCalculate(mm342VO);
			
			if(objectDistrictCalculate != null){
				if("Y".equals(objectDistrictCalculate.getConfirmYn())){
					return "90";
				}
			}
		}
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.updateIncome(vo);
		} else {
			dao.insertIncome(vo);
		}
		
		return "1";
	}
	
	@Override
	public String deleteIncome(MM3_48VO vo) throws Exception {
		String message = deleteIncomeProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String deleteIncomeProcess(MM3_48VO vo) throws Exception {
		
		dao.deleteIncome(vo);
		
		return "1";
	}
}
