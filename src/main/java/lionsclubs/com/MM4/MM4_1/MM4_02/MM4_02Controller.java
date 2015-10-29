package lionsclubs.com.MM4.MM4_1.MM4_02;

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
public class MM4_02Controller {
	@Resource
	private MM4_02Service service;
	@Resource
	private OrganService organService;
	
	@RequestMapping("/MM4/MM4_1/MM4_02/MM4_02.do")
	public String MM4_02(ModelMap model, @ModelAttribute("MM4_02VO_PARAM") MM4_02VO_PARAM vo) throws Exception{
		String message = "";
		List<MM4_02VO> resultList = new ArrayList<MM4_02VO>();
		MM4_02VO resultTotal = new MM4_02VO();
		
	try{
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(vo.getOrgCode() == null) {
			if(StringUtils.isEmpty(user.getSearchOrganCode())){
				vo.setOrgCode(user.getSearchAssociationCode());
			}else{
				String lvl = organService.getOrgLevel(user.getSearchOrganCode());
				if("1".equals(lvl) || "2".equals(lvl)){
					vo.setOrgCode(user.getSearchOrganCode());
				}else{
					vo.setOrgCode(user.getSearchAssociationCode());
				}
			}
			//user.setSearchOrganCode(vo.getOrgCode());
		}
		user.setSearchOrganCode(vo.getOrgCode());
		
		if(StringUtils.isNotEmpty(vo.getOrgCode())) {
			vo.setLvl(organService.getOrgLevel(vo.getOrgCode()));
			resultList = service.selectList(vo);
			message = "해당자료가 조회되었습니다.";
		}
	}catch(Exception ex){
			ex.printStackTrace();
	}
        model.addAttribute("resultList", resultList);
        model.addAttribute("resultTotal", resultTotal);
        model.addAttribute("message", message);
		return "lionsclubs/com/MM4/MM4_1/MM4_02/MM4_02";
	}	
}
