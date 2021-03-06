package lionsclubs.com.MM3.MM3_3.MM3_13;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_13Controller {
	@Resource
	private MM3_13Service service;
	@Resource
	private CommonCodeService codeService;
	
	@RequestMapping("/MM3/MM3_3/MM3_13/MM3_13.do")
	public String MM3_13(ModelMap model, @ModelAttribute("MM3_13VO") MM3_13VO vo) throws Exception{
		String message = "";
		List<Map<String, Object>> resultList = null;
		List<CommonCodeVO> codeList = new ArrayList<CommonCodeVO>();
		
		/* 현재년월 */
		String thisYear = vo.getThisYear() == null ? CommonUtil.thisSessionYear() : vo.getThisYear();
		vo.setThisYear(thisYear);
		
		//로그인한사람의 해당조직을 선택한다. 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(vo.getOrgCode() == null) {
			vo.setOrgCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		// 동적인 컬럼의 정보를 구한다(퇴회사유코드) 
		codeList 	= codeService.codelistSimple("2840", "", "");
		String[] outCode = new String[codeList.size()];
		CommonCodeVO aData = null;
		for(int i = 0; i < codeList.size(); i++) {
			aData = codeList.get(i);
			outCode[i] = aData.getCode();
		}
		vo.setOutCode(outCode);
		
		if(vo.getOrgCode() != null) {
			resultList = service.selectList(vo);
			message = "해당자료가 조회되었습니다.";
		}else{
			message = "";
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("codeList"  , codeList);
        model.addAttribute("message", message);
		return "lionsclubs/com/MM3/MM3_3/MM3_13/MM3_13";
	}	
}
