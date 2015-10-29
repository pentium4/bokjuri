package lionsclubs.com.MM3.MM3_4.MM3_19;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_19Controller {
	@Resource private MM3_19Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_4/MM3_19/MM3_19.do")
	public String MM3_19(ModelMap model, @ModelAttribute("MM3_19VO") MM3_19VO vo, HttpServletRequest request) throws Exception{
		List<Map<String, Object>> resultList = null;
		List<CODE_INFO> codeList = null;
		
		/* 현재년월 */
		String thisYear = vo.getThisYear() == null ? CommonUtil.thisSessionYear() : vo.getThisYear();
		vo.setThisYear(thisYear);
		
		/* ETC */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getThisOrganCode())) {
			vo.setThisOrganCode(user.getSearchDistrictCode());
		}
		
		// 동적인 컬럼의 정보를 구한다(퇴회사유코드) 
		codeList = service.getCodeList(vo);
		
		long[] totSumArray = null;
		long[] rightSumArray = null;
		long rightTotSum = 0;
		MM3_19VO rdata = new MM3_19VO();
		String columnName = "";
		
		if(codeList.size() > 0){
			vo.setCodeList(codeList);
			resultList = service.selectList(vo);
			
			if(resultList != null && resultList.size() > 0){
				totSumArray = new long[codeList.size()]; //동적컬럼의 세로 합계를 저장하기 위한 배열
				
				//셀렉트된 동적 컬럼들의 세로합계들을 구한다.
				//컬럼의 갯수만큼 각각 합계내어 각각의 배열변수(인덱스)에 저장
				for(int i=0; i<codeList.size(); i++){
					columnName = codeList.get(i).getCode(); // 동적 컬럼명
					for(int j=0; j<resultList.size(); j++){
						if(resultList.get(j).get(columnName) == null || resultList.get(j).get(columnName).toString().equals("")){
							totSumArray[i] += 0; 
						}else{
							totSumArray[i] += Integer.parseInt(resultList.get(j).get(columnName).toString());
						}
					}
				}
				
				rightSumArray = new long[resultList.size()]; //동적컬럼의 가로 합계를 저장하기 위한 배열
				
				//셀렉트된 동적 컬럼들의 가로합계들과 퇴회자 총 합계를 구한다. 
				//컬럼의 갯수만큼 각각 합계내어 각각의 배열변수(인덱스)에 저장
				for(int i=0; i<resultList.size(); i++){
					for(int j=0; j<codeList.size(); j++){
						columnName = codeList.get(j).getCode(); // 동적 컬럼명
						if(resultList.get(i).get(columnName) == null || resultList.get(i).get(columnName).toString().equals("")){
							rightSumArray[i] += 0; 
							rightTotSum += 0;
						}else{
							rightSumArray[i] += Integer.parseInt(resultList.get(i).get(columnName).toString());
							rightTotSum += Integer.parseInt(resultList.get(i).get(columnName).toString());
						}
					}					
				}
			}
		}
		
		model.addAttribute("codeList", codeList);  //동적 컬럼명 리스트
		model.addAttribute("resultList", resultList);
		if(resultList != null){
			model.addAttribute("totalCount", resultList.size());	
		}
        
        model.addAttribute("totSumArray", totSumArray);
        model.addAttribute("rightSumArray", rightSumArray);
        model.addAttribute("rightTotSum", rightTotSum);
        
		return "lionsclubs/com/MM3/MM3_4/MM3_19/MM3_19";
	}
	
	/**
	 * 클럽제의무금부과 엑셀 다운로드
	 * @param params
	 * @param modelMap
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_19/excelTemplateDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params, Map<String, Object> modelMap
								, @ModelAttribute("MM3_19VO") MM3_19VO vo) throws Exception {

		List<CODE_INFO> codeList = null;
		
		if(vo.getThisOrganCode() != null || "".equals(vo.getThisOrganCode())) {
			// 동적인 컬럼의 정보를 구한다(퇴회사유코드) 
			codeList = service.getCodeList(vo);
			
			if(codeList !=null){
				vo.setCodeList(codeList);
			}
		}
		service.excelTemplateDownload(vo, modelMap);
		return "genericExcelView";

	}
	
	/**
	 * 엑셀올리기 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_19/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_19VO") MM3_19VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_4/MM3_19/excelUploadPopup";
	}
	
	/**
	 * 클럽제의무금 부과 엑셀 올리기
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_19/excelUpload.do")
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_19VO") MM3_19VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		Map<String, Object> model = new HashMap<String, Object>();
		List<Map<String, Object>> resultList = null;
		List<CODE_INFO> codeList = null;
		String message = "";
		
		//System.out.println("---------dsdsdsds-----------------------------");
		//System.out.println(request.getParameter("firstOrSecond"));
		//System.out.println(vo.getFirstOrSecond());
		//System.out.println("--------------------------------------");
		
		if(vo.getThisOrganCode() != null || "".equals(vo.getThisOrganCode())) {
			// 동적인 컬럼의 정보를 구한다(퇴회사유코드)
			codeList = service.getCodeList(vo);
			vo.setCodeList(codeList);
			resultList = service.selectList(vo);
			vo.setResultList(resultList);
		}
		message = service.excelUpload(vo, request);
		
		model.put("result", message);
		return new ModelAndView(ajaxMainView, model);
	}
}
