package lionsclubs.com.MM2.MM2_3.MM2_22;

import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.MM2.MM2_3.MM2_22.MM2_22VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_22Controller {
	@Resource
	private MM2_22Service service;

	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM2/MM2_3/MM2_22/MM2_22.do")
	public String MM2_22(ModelMap model, @ModelAttribute("MM2_22VO") MM2_22VO vo) throws Exception{

		if(vo.getThisYear() == null) {
			vo.setThisYear(CommonUtil.thisSessionYear());
		}
		if(vo.getOrganCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		if(vo.getS1() == null){
			vo.setS1("1");
		}
		
		List<MM2_22VO_DATA> listVo = service.selectList(vo);
		
        model.addAttribute("totalCount", listVo.size());
		model.addAttribute("dataList", service.selectList(vo));
        model.addAttribute("dataListSum", service.selectSum(vo));
		
		return "lionsclubs/com/MM2/MM2_3/MM2_22/MM2_22";
	}	
	
	
}
