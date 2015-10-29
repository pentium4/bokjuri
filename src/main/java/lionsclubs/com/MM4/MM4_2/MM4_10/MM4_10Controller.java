package lionsclubs.com.MM4.MM4_2.MM4_10;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM4.MM4_2.MM4_10.MM4_10VO;
import lionsclubs.com.MM4.MM4_2.MM4_10.MM4_10VO_ORG;
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
public class MM4_10Controller {
	@Resource
	private MM4_10Service service;
	@Resource
	private OrganService organService;
	
	@RequestMapping("/MM4/MM4_2/MM4_10/MM4_10.do")
	public String MM4_10(ModelMap model, @ModelAttribute("MM4_10VO_PARAM") MM4_10VO_PARAM vo) throws Exception{
		String message = "해당자료가 조회되었습니다.";
		List<MM4_10VO> resultList = new ArrayList<MM4_10VO>();
		List<MM4_10VO_ORG> orgList = new ArrayList<MM4_10VO_ORG>();
		Map<String,MM4_10VO> resultMap = new HashMap<String,MM4_10VO>();
		resultMap.put("sum", new MM4_10VO());
		
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}

		if(vo.getOrgCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchAssociationCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		if(vo.getMonth() == null) {
			vo.setMonth("");
		}		
		
		vo.setLvl(organService.getOrgLevel(vo.getOrgCode()));
		
		/*
		if(StringUtils.isNotEmpty(vo.getOrgCode())) {
			vo.setLvl(organService.getOrgLevel(vo.getOrgCode()));
			resultList 	= service.selectList(vo);
			orgList 	= service.selectOrgList(vo);

			for(int i = 0; i < orgList.size(); i++) resultMap.put(orgList.get(i).getOrgCode(), new MM4_10VO());
			
			for(int i = 0 ; i < resultList.size();i ++) {
				resultMap.put(resultList.get(i).getOrgCode(), resultList.get(i));
				MM4_10VO sumVo = resultMap.get("sum");
				sumVo.setSum1(sumVo.getSum1() + resultList.get(i).getSum1());
				sumVo.setSum2(sumVo.getSum2() + resultList.get(i).getSum2());
				sumVo.setSum3(sumVo.getSum3() + resultList.get(i).getSum3());
				sumVo.setSum4(sumVo.getSum4() + resultList.get(i).getSum4());
				sumVo.setSum5(sumVo.getSum5() + resultList.get(i).getSum5());
				sumVo.setTot(sumVo.getTot()  + resultList.get(i).getTot());
				resultMap.put("sum",sumVo);
			}
			
			message = "해당자료가 조회되었습니다.";
		} 
		
        model.addAttribute("orgList"   , orgList);
        model.addAttribute("resultMap" , resultMap);
        model.addAttribute("message", message);
        */
		
        model.addAttribute("resultMap" , service.selectList(vo));
        model.addAttribute("message", message);
		return "lionsclubs/com/MM4/MM4_2/MM4_10/MM4_10";
	}	
}
