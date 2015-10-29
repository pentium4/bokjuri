package lionsclubs.com.MM4.MM4_2.MM4_15;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM4_15Controller {
	@Resource
	private MM4_15Service service;
	@Resource
	private OrganService organService;
	@Resource
	private CommonCodeService codeService;
	
	@RequestMapping("/MM4/MM4_2/MM4_15/MM4_15.do")
	public String MM4_15(ModelMap model, @ModelAttribute("MM4_15VO_PARAM") MM4_15VO_PARAM vo) throws Exception{

		String message = "";
		List<CommonCodeVO> codeList = new ArrayList<CommonCodeVO>();
		
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}
		
		if(StringUtils.isEmpty(vo.getOrgCode())) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchAssociationCode());
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
		
		vo.setLvl(organService.getOrgLevel(vo.getOrgCode()));
		
		List<Map<String, Object>> resultList = service.selectList(vo);
		message = "해당자료가 조회되었습니다.";
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("codeList"  , codeList);
        model.addAttribute("message", message);
		return "lionsclubs/com/MM4/MM4_2/MM4_15/MM4_15";
	}	
}
