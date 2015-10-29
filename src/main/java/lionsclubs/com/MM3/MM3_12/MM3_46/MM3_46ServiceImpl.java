package lionsclubs.com.MM3.MM3_12.MM3_46;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import lionsclubs.com.MM3.MM3_11.MM3_42.MM3_42Service;
import lionsclubs.com.MM3.MM3_11.MM3_42.MM3_42VO;
import lionsclubs.com.MM3.MM3_12.MM3_45.MM3_45Service;
import lionsclubs.com.MM3.MM3_4.MM3_24.MM3_24Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_46ServiceImpl extends AbstractServiceImpl implements MM3_46Service{
	@Autowired private MM3_46DAO dao;
	@Resource private MM3_24Service mm324Service;
	@Resource private MM3_45Service mm345Service;
	@Resource private MM3_42Service mm342Service;
	@Autowired private ServletContext servletContext;
	
	@Override
	public Page MM3_46(MM3_46VO vo) throws Exception {
		return dao.MM3_46(vo);
	}
	
	@Override
	public MM3_46VO sum(MM3_46VO vo) throws Exception {
		return dao.sum(vo);
	}	
	
	@Override
	public MM3_46VO objectImpost(MM3_46VO vo) throws Exception {
		return dao.objectImpost(vo);
	}
	
	@Override
	public MM3_46VO objectPayment(MM3_46VO vo) throws Exception {
		return dao.objectPayment(vo);
	}
	
	@Override
	public String savePayment(MM3_46VO vo) throws Exception {
		String message = savePaymentProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("납부일자의 회기에 정산이 완료되어 저장할 수 없습니다.");
				sMessage = "납부일자의 회기에 정산이 완료되어 저장할 수 없습니다.";
			break;
			case 91: 
				log.debug("납부일을 부과일 이후 날짜로 선택해 주세요.");
				sMessage = "납부일을 부과일 이후 날짜로 선택해 주세요.";
			break;
			case 92: 
				log.debug("환율정보가 존재하지 않습니다.");
				sMessage = "환율정보가 존재하지 않습니다.";
			break;
			case 93: 
				log.debug("납부금액이 부과금액을 초과 했습니다.");
				sMessage = "납부금액이 부과금액을 초과 했습니다.";
			break;
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String savePaymentProcess(MM3_46VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());

		MM3_46VO objectImpost = dao.objectImpost(vo);

		MM3_42VO mm342VO = new MM3_42VO();
		mm342VO.setOrganCode(objectImpost.getOrganCode());
		
		if(StringUtils.isNotEmpty(vo.getPaymentIdnNo())){
			MM3_46VO objectPayment = dao.objectPayment(vo);
			String sessionYear = CommonUtil.dateToSessionYear(objectPayment.getPaymentDate());
			mm342VO.setSessionYear(sessionYear);
			MM3_42VO objectDistrictCalculate = mm342Service.objectDistrictCalculate(mm342VO);
			
			if(objectDistrictCalculate != null){
				if("Y".equals(objectDistrictCalculate.getConfirmYn())){
					return "90";
				}
			}
		} else {
			String sessionYear = CommonUtil.dateToSessionYear(vo.getPaymentDate());
			mm342VO.setSessionYear(sessionYear);
			MM3_42VO objectDistrictCalculate = mm342Service.objectDistrictCalculate(mm342VO);

			if(objectDistrictCalculate != null){
				if("Y".equals(objectDistrictCalculate.getConfirmYn())){
					return "90";
				}
			}
		}
		
		int genDate = Integer.parseInt(objectImpost.getGenDate());
		int paymentDate = Integer.parseInt(vo.getPaymentDate().replaceAll("\\.", ""));
		if(paymentDate < genDate){
			return "91";
		}
		
		if("$".equals(objectImpost.getDollarKind())){
			String yyyymm = vo.getPaymentDate().replaceAll("\\.", "").substring(0,6);
			Integer rateWon = mm324Service.objectRates(yyyymm);		

			if(rateWon <= 0){
				return "92";
			}

			vo.setPaymentDollar(vo.getPayment());
			float payment = Float.parseFloat(vo.getPaymentDollar().replace(",", "")) * rateWon;
			vo.setPayment(String.valueOf(payment));
		}

		if(dao.sumPayment(vo) < 0){
			return "93";
		}
			
		if(StringUtils.isNotEmpty(vo.getPaymentIdnNo())){
			dao.updatePayment(vo);
		} else {
			dao.insertPayment(vo);
		}
		
		return "1";
	}	
	
	@Override
	public Integer deletePayment(MM3_46VO vo) throws Exception {
		return dao.deletePayment(vo);
	}
	
	@Override
	public List<MM3_46VO> listPayment(MM3_46VO vo) throws Exception {
		return dao.listPayment(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_46VO vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("templateSheetName", "1");
		map.put("sheetName", "지구 납부금");
		map.put("resultList", dao.listExcelDownload(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_12/MM3_46/template.xlsx");
		modelMap.put("destFileName", "지구 납부금_" + date + ".xlsx");		
		
		return modelMap;
	}
	
	@Override
	public MM3_46VO objectTreasurer(MM3_46VO vo) throws Exception {
		return dao.objectTreasurer(vo);
	}
}
