package lionsclubs.com.MM4.MM4_2.MM4_06;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM4_06Controller {
	@Resource
	private MM4_06Service service;
	
	@Resource
	private OrganService organService;
	
	@RequestMapping("/MM4/MM4_2/MM4_06/MM4_06.do")
	public String MM4_06(ModelMap model, @ModelAttribute("MM4_06VO_PARAM") MM4_06VO_PARAM vo) throws Exception{
		String message = "";
		List<MM4_06VO> resultList;
		MM4_06VO resultTotal = new MM4_06VO();
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}
		
		if(StringUtils.isEmpty(vo.getOrgCode())) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchAssociationCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		if(StringUtils.isNotEmpty(vo.getOrgCode())) {
			vo.setLvl(organService.getOrgLevel(vo.getOrgCode()));
			resultList = service.selectList(vo);
			message = "해당자료가 조회되었습니다.";
		}else{
			resultList = new ArrayList<MM4_06VO>();
			message = "";
		}
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("resultTotal", resultTotal);
        model.addAttribute("message", message);
        return "lionsclubs/com/MM4/MM4_2/MM4_06/MM4_06";
	}	
}