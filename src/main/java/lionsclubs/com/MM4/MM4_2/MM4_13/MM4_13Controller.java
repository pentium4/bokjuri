package lionsclubs.com.MM4.MM4_2.MM4_13;

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
public class MM4_13Controller {
	@Resource
	private MM4_13Service service;
	@Resource
	private OrganService organService;
	@Resource
	private CommonCodeService codeService;
	
	@RequestMapping("/MM4/MM4_2/MM4_13/MM4_13.do")
	public String MM4_13(ModelMap model, @ModelAttribute("MM4_13VO_PARAM") MM4_13VO_PARAM vo) throws Exception{
		actData(model, vo);
		return "lionsclubs/com/MM4/MM4_2/MM4_13/MM4_13";
	}
	
	@SuppressWarnings("unchecked")
	private void actData(ModelMap model, MM4_13VO_PARAM vo) throws Exception {
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
		
		if(vo.getTerm() == null) {
			vo.setTerm(0);
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

		List<HashMap<String, Object>> resultList = service.selectData(vo);
		message = "해당자료가 조회되었습니다.";
		
		/* 평균계산 */
		HashMap<String, Object> rData = new HashMap<String, Object>();
		HashMap<String, Object> avgList = new HashMap<String, Object>();
		avgList.put("memSum", 0);
		avgList.put("totSum", 0);
		for(int i = 0; i < codeList.size(); i++) {
			aData = codeList.get(i);
			avgList.put(aData.getCode(), 0);
		}
		
		for (int j = 0; j < resultList.size(); j++) {
			rData = resultList.get(j);
			
			avgList.put("memSum", (Integer)avgList.get("memSum") + (Integer)rData.get("memCnt"));
			avgList.put("totSum", (Integer)avgList.get("totSum") + (Integer)rData.get("outCnt"));
			
			for(int i = 0; i < codeList.size(); i++) {
				aData = codeList.get(i);
				avgList.put(aData.getCode(), (Integer)avgList.get(aData.getCode()) + (Integer)rData.get(aData.getCode()));
			}
		}
		
		avgList.put("memSum", (Integer)avgList.get("memSum") / resultList.size());
		avgList.put("totSum", (Integer)avgList.get("totSum") / resultList.size());
		for(int i = 0; i < codeList.size(); i++) {
			aData = codeList.get(i);
			avgList.put(aData.getCode(), (Integer)avgList.get(aData.getCode()) / resultList.size());
		}
		
		model.addAttribute("resultList", resultList);
        model.addAttribute("codeList"  , codeList);
        model.addAttribute("avgList"  , avgList);
        model.addAttribute("message", message);
	}
}
