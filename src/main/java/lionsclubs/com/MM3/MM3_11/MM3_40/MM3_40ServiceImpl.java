package lionsclubs.com.MM3.MM3_11.MM3_40;

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

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.excel.ExcelService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_40ServiceImpl extends AbstractServiceImpl implements MM3_40Service{
	@Autowired private MM3_40DAO dao;
	@Autowired private ServletContext servletContext;
	@Resource private ExcelService excelService;
	
	@Override
	public List<MM3_40VO> MM3_40(MM3_40VO vo) throws Exception {
		return dao.MM3_40(vo);
	}
	
	@Override
	public MM3_40VO amountSum(MM3_40VO vo) throws Exception {
		return dao.amountSum(vo);
	}
	
	@Override
	public MM3_40VO objectIncome(MM3_40VO vo) throws Exception {
		return dao.objectIncome(vo);
	}
	
	@Override
	public String saveIncome(MM3_40VO vo) throws Exception {
		String message = saveIncomeProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 91: 
				log.debug("같은 항목이 존재 합니다.");
				sMessage = "같은 항목이 존재 합니다.";
			break;		
			default:
				log.debug("저장 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveIncomeProcess(MM3_40VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.updateIncome(vo);
		} else {
			
			if(dao.dupCheck(vo) > 0){
				return "91";
			}
			
			dao.insertIncome(vo);
		}
		
		return "1";
	}
	
	@Override
	public String deleteIncome(MM3_40VO vo) throws Exception {
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
	
	public String deleteIncomeProcess(MM3_40VO vo) throws Exception {
		
		dao.deleteIncome(vo);
		
		return "1";
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_40VO vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("templateSheetName", "1");
		map.put("sheetName", "연간수입예산입력");
		map.put("listClassItem", dao.listClassItem(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_11/MM3_40/template.xlsx");
		modelMap.put("destFileName", "연간수입예산입력_" + date + ".xlsx");
		
		return modelMap;
	}
	
	@Override
	public String excelUpload(MM3_40VO vo, HttpServletRequest request) throws Exception {
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
				log.debug("입주클럽관리비부과 입력시 에러.");
				sMessage = "입주클럽관리비부과 입력시 에러.";
				break;
			default:
				log.debug("일괄배치처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String excelUploadProcess(MM3_40VO vo, HttpServletRequest request) throws Exception {
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
        if(cells != 5){
        	return "91"; //입주클럽관리비부과 cell 갯수 오류
        }
        
		int index = 0;
		List<Map<Object, Object>> list = (List<Map<Object, Object>>) map.get("dataList");
		for(Map<Object, Object> data : list){
			if(index > 0){
				vo.setSessionYear(vo.getSessionYear());
				vo.setOrganCode(vo.getOrganCode());
				vo.setDivisionCode("1000");

				if(StringUtils.isNotEmpty(data.get("data_0").toString())
						&& StringUtils.isNotEmpty(data.get("data_1").toString())
						&& StringUtils.isNotEmpty(data.get("data_2").toString())
						&& StringUtils.isNotEmpty(data.get("data_3").toString())
						&& StringUtils.isNotEmpty(data.get("data_4").toString())){
					vo.setClassItemCode(data.get("data_0").toString().substring(0,4));
					vo.setDetailItemCode(data.get("data_1").toString().substring(0,4));
					vo.setDesc(data.get("data_2").toString());
					vo.setUnit(data.get("data_3").toString());
					vo.setAtandAmount(data.get("data_4").toString());					
					
					dao.dupDelete(vo);	// 중복항목은 삭제한다.
					dao.insertIncome(vo);
				}
			}
			index++;
		}

        return "1";
	}	
}
