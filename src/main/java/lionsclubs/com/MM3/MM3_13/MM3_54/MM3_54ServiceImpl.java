package lionsclubs.com.MM3.MM3_13.MM3_54;

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
public class MM3_54ServiceImpl extends AbstractServiceImpl implements MM3_54Service{
	@Autowired private MM3_54DAO dao;
	@Autowired private ServletContext servletContext;
	@Resource private ExcelService excelService;
	
	
	@Override
	public List<Map<String, Object>> headInfo(MM3_54VO vo) throws Exception {
		return dao.headInfo(vo);
	}
	
	@Override
	public List<Map<String, Object>> MM3_54(MM3_54VO vo) throws Exception {
		return dao.MM3_54(vo);
	}
	
	@Override
	public Map<String, Object> sum(MM3_54VO vo) throws Exception {
		return dao.sum(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_54VO vo, Map<String, Object> modelMap) throws Exception {
		
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("templateSheetName", "1");
		map.put("sheetName", "급여지급");
		map.put("listSecretaryInfo", dao.listSecretaryInfo(vo));
		map.put("listSecretaryPaymentCode", dao.listSecretaryPaymentCode(vo));
		map.put("listSecretaryPaymentGroupCode", dao.listSecretaryPaymentGroupCode(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);

		map = new HashMap<String, Object>();
		map.put("templateSheetName", "급여구분");
		map.put("sheetName", "급여구분");
		map.put("listPaymentKind", dao.listPaymentKind(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_13/MM3_54/template.xlsx");
		modelMap.put("destFileName", "급여지급_" + date + ".xlsx");		
		
		return modelMap;
	}
	
	@Override
	public String excelUpload(MM3_54VO vo, HttpServletRequest request) throws Exception {
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
				log.debug("급여관리 cell 갯수 오류.");
				sMessage = "급여관리 cell 갯수 오류.";
				break;
			case 92:
				log.debug("지급월 날짜형식이 틀립니다.(입력예) 2015년 07월 -> 201507)");
				sMessage = "지급월 날짜형식이 틀립니다.(입력예) 2015년 07월 -> 201507)";
				break;
			default:
				log.debug("일괄배치처리 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String excelUploadProcess(MM3_54VO vo, HttpServletRequest request) throws Exception {
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
		
		List<MM3_54VO> listSecretaryPaymentCode = dao.listSecretaryPaymentCode(vo);
		
		int cells = Integer.parseInt(map.get("cells").toString());
        // 입주클럽관리비부과 파일 데이타 검증 cell =14개
        if(cells != 5 + listSecretaryPaymentCode.size()){
        	return "91"; //입주클럽관리비부과 cell 갯수 오류
        }
        
		int index = 0;
		List<Map<Object, Object>> list = (List<Map<Object, Object>>) map.get("dataList");
		
		for(Map<Object, Object> data : list){
			if(index > 0){
				String yyyyMM = data.get("data_0").toString();

				if(StringUtils.isNotEmpty(yyyyMM)){
					if(!CommonUtil.checkDate(yyyyMM, "yyyyMM")){
						return "92";
					}
				}
			}
			index++;
		}
		
		index = 0;
		for(Map<Object, Object> data : list){
			if(index > 0){
				vo.setOrganCode(vo.getOrganCode());

				if(StringUtils.isNotEmpty(data.get("data_0").toString())
						&& StringUtils.isNotEmpty(data.get("data_1").toString())
						&& StringUtils.isNotEmpty(data.get("data_2").toString())){
					
					vo.setPaymentYearMonth(data.get("data_0").toString());
					vo.setPaymentKindCode(data.get("data_1").toString().substring(0,4));
					vo.setMemberNo(data.get("data_2").toString());
					
					// 중복된 항목을 삭제한다.
					dao.deleteSecretaryPay(vo);
					dao.deleteSecretaryInfo(vo);
					
					// 급여기본 항목을 입력한다.
					dao.insertSecretaryInfo(vo);
					
					// 급여수당, 공제를 입력한다.
					int spcIndex = 5;
					for(MM3_54VO spc : listSecretaryPaymentCode){
						String payment = data.get("data_" + spcIndex++).toString();
						System.out.println("spc.getGroupCode() : " + spc.getGroupCode());
						System.out.println("spc.getCode() : " + spc.getCode());
						if(StringUtils.isNotEmpty(payment)
								&& !"0".equals(payment)){
							vo.setPaymentMainCode(spc.getGroupCode());
							vo.setPaymentDetailCode(spc.getCode());
							vo.setPayment(payment);	
							
							dao.insertSecretaryPay(vo);
						}
					}
				}
			}
			index++;
		}

        return "1";
	}
	
	@Override
	public Boolean deleteSecretary(MM3_54VO vo) throws Exception {
		
		for(MM3_54VO vo2 : vo.getDeleteArray()){
			dao.deleteSecretaryPay(vo2);
			dao.deleteSecretaryInfo(vo2);
		}
		
		return Boolean.TRUE;
	}
	
	@Override
	public List<MM3_54VO> listMemberNo(MM3_54VO vo) throws Exception {
		return dao.listMemberNo(vo);
	}
}
