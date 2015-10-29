package lionsclubs.com.MM3.MM3_4.MM3_18;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM3.MM3_4.MM3_22.MM3_22Service;
import lionsclubs.com.MM3.MM3_4.MM3_22.MM3_22VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.excel.ExcelService;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_18ServiceImpl extends AbstractServiceImpl implements MM3_18Service{
	@Autowired private MM3_18DAO dao;
	@Resource private ExcelService excelService;
	@Resource private MM3_22Service mm322Service;
	
	/**
	 * 입주클럽관리비 부과
	 */
	@Override
	public List<MM3_18VO> selectList(MM3_18VO vo) {
		return dao.selectList(vo);
	}
	
	/**
	 * 입주클럽관리비 부과 엑셀 올리기
	 */	
	@Override	
	public String excelUpload(MM3_18VO vo, HttpServletRequest request) throws Exception {
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
	
	/**
	 * 입주클럽관리비 부과 엑셀 올리기
	 */
	public String excelUploadProcess(MM3_18VO vo, HttpServletRequest request) throws Exception {
		boolean success = false;
		
		Map<Object, Object> map = null;
    	final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
//		InputStream fis = null; // 2011.11.1 보안점검 후속조치
//    	String sResult = "";
    	
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;

		String message = null;
		while(itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
//			message = service.excelUploadProcess(vo, file.getInputStream());
			
			String extension = CommonUtil.getExtension(file.getOriginalFilename());
			
			if("xls".equals(extension)){
				map = excelService.xlsParser(file.getInputStream());	
			} else if("xlsx".equals(extension)){
				map = excelService.xlsxParser(file.getInputStream());
			}
		}
		
		int cells = Integer.parseInt(map.get("cells").toString());
        // 입주클럽관리비부과 파일 데이타 검증 cell =14개
        if(cells != 14){
        	return "91"; //입주클럽관리비부과 cell 갯수 오류
        }
		
    	/*
    	오류 메세지 정보
    	message = "90";	//파일존재하지 않음.
    	message = "91";	//입주클럽관리비부과 cell 갯수 오류
    	message = "92";	//입주클럽관리비부과 입력시 에러
    	message = "1";	//일괄배치처리 완료
    	*/
        dao.expensesDelete(vo);
		success = expensesRegist(vo, map);
		if(success){
			/* 클럽납부금입력 */
			MM3_22VO mm322VO = new MM3_22VO();
			mm322VO.setSessionYear(vo.getSessionYear());
			mm322VO.setDistrictCode(vo.getDistrictCode());
			mm322Service.insertDistrictItemPayment(mm322VO);
			
			return "1"; // 일괄배치처리 완료
		} else {
			dao.expensesDelete(vo);
			return "92"; // 입주클럽관리비부과 입력시 에러
		}
	}
	
	/**
	 * 입주클럽관리비부과 일과 입력
	 * @param vo
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean expensesRegist(MM3_18VO vo, Map<Object, Object> map) throws Exception{
		boolean success = false;
		int count = 0;
		int index = 0;
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		List<Map<Object, Object>> list = (List<Map<Object, Object>>) map.get("dataList");
		int rows = Integer.parseInt(map.get("rows").toString());
		for(Map<Object, Object> data : list){
			if(index > 0){
            	vo.setClubCode(CommonUtil.getStartEndSubstr(data.get("data_1").toString(), "(", ")"));
            	vo.setJulDue(data.get("data_2").toString());	// 7월
            	vo.setAugDue(data.get("data_3").toString());	// 8월
            	vo.setSepDue(data.get("data_4").toString());	// 9월
            	vo.setOctDue(data.get("data_5").toString());	// 10월
            	vo.setNovDue(data.get("data_6").toString());	// 11월
            	vo.setDecDue(data.get("data_7").toString());	// 12월
            	vo.setJanDue(data.get("data_8").toString());	// 1월
            	vo.setFebDue(data.get("data_9").toString());	// 2월
            	vo.setMarDue(data.get("data_10").toString());	// 3월
            	vo.setAprDue(data.get("data_11").toString());	// 4월
            	vo.setMayDue(data.get("data_12").toString());	// 5월
            	vo.setJunDue(data.get("data_13").toString());	// 6월
            	
    			if(dao.expensesInsert(vo))	count++;
			}
			index++;
		}
		
        if(count == rows-1){
            success = true;
        }else{
        	success = false;
        }		
		
		return success;
	}
	
	/**
	 * 입주클럽관리비부과 합계
	 */
	@Override
	public MM3_18VO expensesSum(MM3_18VO vo) throws Exception {
		return dao.expensesSum(vo);
	}
	
	/**
	 * 엑셀템플릿 다운로드
	 */
	@Override
	public Map<String, Object> excelTemplateDownload(MM3_18VO vo, Map<String, Object> modelMap)
			throws Exception {
		
		List<String> colName = new ArrayList<String>();
		colName.add("No");
		colName.add("클럽명");
		colName.add("7월");
		colName.add("8월");
		colName.add("9월");
		colName.add("10월");
		colName.add("11월");
		colName.add("12월");
		colName.add("1월");
		colName.add("2월");
		colName.add("3월");
		colName.add("4월");
		colName.add("5월");
		colName.add("6월");
		
		int thisYear = Integer.parseInt(vo.getSessionYear());
		int prevYear = thisYear - 1;
		modelMap.put("excelName", vo.getDistrictCode() + "입주클럽관리비부과(" + prevYear + " - " + thisYear + ")");
		modelMap.put("colName", colName);
		modelMap.put("colValue", dao.excelTemplateDownload(vo));
		
		return modelMap;
	}
}
