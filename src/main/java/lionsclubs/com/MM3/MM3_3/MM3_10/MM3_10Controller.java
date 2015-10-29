package lionsclubs.com.MM3.MM3_3.MM3_10;

import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_10Controller {
	@Resource
	private MM3_10Service service;
	
	@RequestMapping("/MM3/MM3_3/MM3_10/MM3_10.do")
	public String MM3_10(ModelMap model, @ModelAttribute("MM3_10VO_PARAM") MM3_10VO_PARAM vo) throws Exception{
		String message = "";
		List<MM3_10VO> resultList;
		MM3_10VO resultTotal = new MM3_10VO();
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}
		
		if(vo.getOrgCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		if(vo.getOutCheck() == null){
			vo.setOutCheck("1");
		}

		resultList = service.selectList(vo);
		message = "해당자료가 조회되었습니다.";
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("resultTotal", resultTotal);
        model.addAttribute("message", message);
        return "lionsclubs/com/MM3/MM3_3/MM3_10/MM3_10";
	}	
}