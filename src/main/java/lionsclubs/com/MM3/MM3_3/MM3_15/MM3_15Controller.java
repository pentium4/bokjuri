package lionsclubs.com.MM3.MM3_3.MM3_15;

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
public class MM3_15Controller {
	@Resource
	private MM3_15Service service;
	
	@Resource
	private CommonCodeService codeService;
	
	@RequestMapping("/MM3/MM3_3/MM3_15/MM3_15.do")
	public String MM3_15(ModelMap model, @ModelAttribute("MM3_15VO") MM3_15VO vo) throws Exception{
		String message = "";
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
		
		/* 퇴회 코드 */
		codeList 	= codeService.codelistSimple("2840", "", "");
		String[] outCode = new String[codeList.size()];
		CommonCodeVO aData = null;
		for(int i = 0; i < codeList.size(); i++) {
			aData = codeList.get(i);
			outCode[i] = aData.getCode();
		}
		vo.setOutCode(outCode);
		
		List<Map<String, Object>> resultList = service.selectList(vo);
		message = "해당자료가 조회되었습니다.";
				
		model.addAttribute("resultList", resultList);
		model.addAttribute("codeList"  , codeList);
        model.addAttribute("message", message);
        
		return "lionsclubs/com/MM3/MM3_3/MM3_15/MM3_15";
	}	
}
