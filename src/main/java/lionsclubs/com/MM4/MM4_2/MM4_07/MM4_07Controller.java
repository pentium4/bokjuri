package lionsclubs.com.MM4.MM4_2.MM4_07;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM4_07Controller {
	@Resource
	private MM4_07Service service;

	@Resource
	private OrganService organService;
	@Resource
	private CommonCodeService codeService;

	@RequestMapping("/MM4/MM4_2/MM4_07/MM4_07.do")
	public String MM4_07(ModelMap model, @ModelAttribute("MM4_07VO_PARAM") MM4_07VO_PARAM vo) throws Exception{

		try{
		String message = "";
		List<CommonCodeVO> codeList = new ArrayList<CommonCodeVO>();

		
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}

		if(vo.getOrgCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchAssociationCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}

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
		}catch(Exception e){
			e.printStackTrace();
		}
		return "lionsclubs/com/MM4/MM4_2/MM4_07/MM4_07";
	}	
}
