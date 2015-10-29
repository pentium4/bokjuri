package lionsclubs.com.MM3.MM3_5.MM3_27;

import java.util.Hashtable;
import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_27Controller {
	@Resource
	private MM3_27Service service;

	@Resource MappingJacksonJsonView ajaxMainView;

	@RequestMapping("/MM3/MM3_5/MM3_27/MM3_27.do")
	public String MM3_27(ModelMap model, @ModelAttribute("MM3_27VO_PARAM") MM3_27VO_PARAM vo, @ModelAttribute("MM3_27VO_DATA") MM3_27VO_DATA dataVo) throws Exception{

		if(vo.getUpperCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setUpperCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getUpperCode());
		}
		
		/** 현재년월 세팅 */
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		vo.setThisYear(thisyear);
		/** 현재년월 세팅 */
		
		if(vo.getOrder() == null) vo.setOrder("1");
		
		this.selectList(vo);

		return "lionsclubs/com/MM3/MM3_5/MM3_27/MM3_27";

	}
	
	private void selectList(MM3_27VO_PARAM vo) throws Exception {
		List<MM3_27VO_DATA> resultList = service.selectList(vo);
		vo.setListData(resultList);
	}
	
	@RequestMapping("/MM3/MM3_5/MM3_27/mergeData.do")
	public ModelAndView mergeData(@ModelAttribute("MM3_27VO_DATA") MM3_27VO_DATA vo) throws Exception{
		vo.setMemberNo(((LoginVO)EgovUserDetailsHelper.getAuthenticatedUser()).getId());
		Hashtable<String, Object> model = new Hashtable<String, Object>();	
		
		String mresult = service.mergeData(vo);
		if("Y".equals(mresult)){
			model.put("result", true);
		}else{
			model.put("result", false);
			model.put("message", mresult);
		}
		return new ModelAndView(ajaxMainView, model);
	}
}
