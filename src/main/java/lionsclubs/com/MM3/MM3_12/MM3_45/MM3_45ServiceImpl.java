package lionsclubs.com.MM3.MM3_12.MM3_45;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM3.MM3_4.MM3_24.MM3_24Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.excel.ExcelService;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_45ServiceImpl extends AbstractServiceImpl implements MM3_45Service{
	@Autowired private MM3_45DAO dao;
	@Resource private MM3_24Service mm324Service;
	@Autowired private ServletContext servletContext;
	@Resource private ExcelService excelService;
	
	@Override
	public Page MM3_45(MM3_45VO vo) throws Exception {
		return dao.MM3_45(vo);
	}
	
	@Override
	public MM3_45VO sum(MM3_45VO vo) throws Exception {
		return dao.sum(vo);
	}
	
	@Override
	public MM3_45VO objectImpost(MM3_45VO vo) throws Exception {
		return dao.objectImpost(vo);
	}
	
	@Override
	public String saveImpost(MM3_45VO vo) throws Exception {
		String message = saveImpostProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("정산이 완료되어 저장할 수 없습니다.");
				sMessage = "정산이 완료되어 저장할 수 없습니다.";
			break;
			case 91: 
				log.debug("환율정보가 존재하지 않습니다.");
				sMessage = "환율정보가 존재하지 않습니다.";
			break;			
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveImpostProcess(MM3_45VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if("$".equals(dao.dollarKind(vo))){
			String yyyymm = vo.getGenDate().replaceAll("\\.", "").substring(0,6);
			
			if(mm324Service.objectRates(yyyymm) != null){
				Integer rateWon = mm324Service.objectRates(yyyymm);
				
				if(rateWon <= 0){
					return "91";
				}

				vo.setImpostDollar(vo.getImpost());
				float impost = Float.parseFloat(vo.getImpostDollar().replace(",", "")) * rateWon;
				vo.setImpost(String.valueOf(impost));
			} else {
				return "91";
			}			
		}
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.updateImpost(vo);
		} else {
			dao.insertImpost(vo);
		}
		
		return "1";
	}		
	
	@Override
	public Integer deleteImpost(MM3_45VO vo) throws Exception {
		dao.deletePayment(vo);
		
		return dao.deleteImpost(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_45VO vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("templateSheetName", "1");
		map.put("sheetName", "납부금 부과");
		map.put("listExcelImpost", dao.listExcelImpost(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_12/MM3_45/template.xlsx");
		modelMap.put("destFileName", "납부금 부과_" + date + ".xlsx");
		
		return modelMap;	
	}
	
	@Override
	public String excelUpload(MM3_45VO vo, HttpServletRequest request) throws Exception {
		String message = excelUploadProcess(vo, request);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "90";	//파일존재하지 않음.
    	message = "91";	//입주클럽관리비부과 cell 갯수 오류
    	message = "92";	//입주클럽관리비부과 입력시 에러
    	message = "1";	//일괄배치처리 완료
    	*/		
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("파일존재하지 않음.");
				sMessage = "파일존재하지 않음.";
				break;
			case 91: 
				log.debug("입주클럽관리비부과 cell 갯수 오류.");
				sMessage = "입주클럽관리비부과 cell 갯수 오류.";
				break;
			case 92:
				log.debug("부과날짜 형식이 틀린 항목이 존재 합니다.");
				sMessage = "부과날짜 형식이 틀린 항목이 존재 합니다.";
				break;
			case 93:
				log.debug("환율정보가 존재하지 않습니다.");
				sMessage = "환율정보가 존재하지 않습니다.";
				break;
			default:
				log.debug("일괄배치처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String excelUploadProcess(MM3_45VO vo, HttpServletRequest request) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		Map<Object, Object> map = null;
    	final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
    	
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;

		while(itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			String extension = CommonUtil.getExtension(file.getOriginalFilename());
			
			if("xls".equals(extension)){
				map = excelService.xlsParser(file.getInputStream());	
			} else if("xlsx".equals(extension)){
				map = excelService.xlsxParser(file.getInputStream());
			}
		}
		
		int cells = Integer.parseInt(map.get("cells").toString());
        // 입주클럽관리비부과 파일 데이타 검증 cell =14개
        if(cells != 8){
        	return "91"; //입주클럽관리비부과 cell 갯수 오류
        }
        
		int index = 0;
		List<Map<Object, Object>> list = (List<Map<Object, Object>>) map.get("dataList");
		for(Map<Object, Object> data : list){
			if(index > 0){
				vo.setSessionYear(vo.getSessionYear());
				vo.setOrganCode(vo.getOrganCode());

				if(StringUtils.isNotEmpty(data.get("data_0").toString())
						&& StringUtils.isNotEmpty(data.get("data_1").toString())
						&& StringUtils.isNotEmpty(data.get("data_2").toString())
						&& StringUtils.isNotEmpty(data.get("data_3").toString())
						&& StringUtils.isNotEmpty(data.get("data_4").toString())
						&& StringUtils.isNotEmpty(data.get("data_5").toString())){
					
					vo.setClubCode(data.get("data_0").toString());
					vo.setClassItemCode(data.get("data_2").toString().substring(0,4));
					vo.setDetailItemCode(data.get("data_3").toString().substring(0,4));
					vo.setGenDate(data.get("data_4").toString());
					vo.setImpost(data.get("data_5").toString());
					vo.setReference(data.get("data_6").toString());
					
					dao.deleteOrganCodePaymnet(vo);	// 지구 납부금 삭제
					dao.deleteOrganCodeImpost(vo);	// 지구 부과금 삭제
					
					if(!CommonUtil.checkDate(vo.getGenDate(), "yyyyMMdd")){
						return "92";
					}
					
					if("$".equals(dao.dollarKind(vo))){
						String yyyymm = vo.getGenDate().replaceAll("\\.", "").substring(0,6);
						
						if(mm324Service.objectRates(yyyymm) != null){
							Integer rateWon = mm324Service.objectRates(yyyymm);
							
							if(rateWon <= 0){
								return "93";
							}

							vo.setImpostDollar(vo.getImpost());
							float impost = Float.parseFloat(vo.getImpostDollar().replace(",", "")) * rateWon;
							vo.setImpost(String.valueOf(impost));
						} else {
							return "93";
						}
					}
					
					dao.insertImpost(vo);
				}
			}
			index++;
		}

        return "1";
	}
}
