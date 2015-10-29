package lionsmobile.com.MM6.MM6_1.MM6_08;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_2.MM2_15.MM2_15Service;
import lionsclubs.com.MM2.MM2_2.MM2_15.MM2_15VO;
import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18Service;
import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18VO;
import lionsclubs.com.MM2.MM2_2.MM2_34.MM2_34Service;
import lionsclubs.com.MM2.MM2_2.MM2_34.MM2_34VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM6_08Controller {
	@Resource private MM6_08Service service;
	@Resource private MM2_18Service mm218Service;
	@Resource private MM2_34Service mm234Service;
	@Resource private MM2_15Service mm215Service;
	
	@RequestMapping("/m/MM6/MM6_1/MM6_08/MM6_08.do")
	public String MM6_08(ModelMap model,@ModelAttribute("MM6_08VO") MM6_08VO vo) throws Exception{
		
		return "lionsmobile/com/MM6/MM6_1/MM6_08/MM6_08";
	}
	
	@RequestMapping("/m/MM6/MM6_1/MM6_08/listServicePersonal.do")
	public String listServicePersonal(ModelMap model,@ModelAttribute("MM6_08VO") MM6_08VO vo) throws Exception{

		model.addAttribute("resultList", service.listServicePersonal(vo));
		model.addAttribute("sum", service.sumServicePersonal(vo));
		
		return "lionsmobile/com/MM6/MM6_1/MM6_08/listServicePersonal";
	}	

	@RequestMapping("/m/MM6/MM6_1/MM6_08/listServiceMember.do")
	public String listServiceMember(ModelMap model, @ModelAttribute("MM2_18VO") MM2_18VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getMonth() == null){
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		
		List<Map<String,Object>> headInfo = mm218Service.headInfo(vo);
		if(headInfo.size() > 0){
			List<Map<String, Object>> resultList = mm218Service.List(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("paySum", mm218Service.paymentSum(vo));
	        model.addAttribute("totalCount", resultList.size());
		}
		
        model.addAttribute("headList", headInfo);
		JSONArray jarray = JSONArray.fromObject(headInfo);
		model.addAttribute("jsonHeadList", jarray);        
        
		return "lionsmobile/com/MM6/MM6_1/MM6_08/listServiceMember";
	}	
	
	@RequestMapping("/m/MM6/MM6_1/MM6_08/listServiceUnpaidMember.do")
	public String MM2_34(ModelMap model, @ModelAttribute("MM2_34VO") MM2_34VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getMonth() == null){
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		List<Map<String,Object>> headInfo = mm234Service.headInfo(vo);
		if(headInfo.size() > 0){
			List<Map<String, Object>> resultList = mm234Service.List(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("balanceSum", mm234Service.balanceSum(vo));
	        model.addAttribute("totalCount", resultList.size());
		}
		
        model.addAttribute("headList", headInfo);
		JSONArray jarray = JSONArray.fromObject(headInfo);
		model.addAttribute("jsonHeadList", jarray);        
        
		return "lionsmobile/com/MM6/MM6_1/MM6_08/listServiceUnpaidMember";
	}
	
	@RequestMapping("/m/MM6/MM6_1/MM6_08/listServiceCommitmentOfficer.do")
	public String listServiceCommitmentOfficer(ModelMap model,@ModelAttribute("MM6_08VO") MM6_08VO vo) throws Exception{
		
		model.addAttribute("resultList", service.listServiceCommitmentOfficer(vo));
		
		return "lionsmobile/com/MM6/MM6_1/MM6_08/listServiceCommitmentOfficer";
	}	
	
	@RequestMapping("/m/MM6/MM6_1/MM6_08/listClubExpend.do")
	public String listClubExpend(ModelMap model,@ModelAttribute("MM2_15VO") MM2_15VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}

		if(StringUtils.isEmpty(vo.getSessionYear())) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getMonth() == null) {
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		vo.setS1("2");
		
		model.addAttribute("resultList", mm215Service.List(vo));
		model.addAttribute("sum", mm215Service.paymentSum(vo));
		
		return "lionsmobile/com/MM6/MM6_1/MM6_08/listClubExpend";
	}		
	
}
