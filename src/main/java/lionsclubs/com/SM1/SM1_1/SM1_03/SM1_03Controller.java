package lionsclubs.com.SM1.SM1_1.SM1_03;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class SM1_03Controller {
	@Resource private SM1_03Service service;
	@Resource private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_1/SM1_03.do")
	public String SM1_03(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{
		/*
		 * 회원정보
		 */
		pvo.setMemberNo(vo.getMemberNo());
		pvo.setRnum(vo.getRnum());		
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * ETC
		 */
		vo.setMemberNo(pvo.getMemberNo());
		
		/*
		 * 권한그룹 선택 - 리스트
		 */
		List<SM1_03VO> resultList = service.authGroupList(vo);
		model.addAttribute("grouplist", resultList);
		
		/*
		 * 조직권한 부여 - 리스트
		 */
		List<SM1_03VO> resultList2 = service.organAuthList(vo);
		model.addAttribute("organlist", resultList2);
		/*
		 * 추가권한 기간 체크 
		 */
		model.addAttribute("authManage", service.objectMoreAuthManage(vo));
		return "lionsclubs/com/SM1/SM1_1/SM1_03/SM1_03";
	}	
	
	@RequestMapping("/SM1/SM1_1/SM1_03_SELECT.do")
	public ModelAndView SM1_03_SELECT(HttpServletRequest request, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("resultUiAuthList", service.organUiAuthList(vo));
		model.put("result", true);		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/SM1/SM1_1/SM1_03_Insert.do")
	public ModelAndView SM1_03_Insert(HttpServletRequest request, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{		
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.insert(vo);
		
		model.put("result", true);		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_03_Update.do")
	public ModelAndView SM1_03_Update(HttpServletRequest request, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{		
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.update(vo);
		
		model.put("result", true);		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_03_Delete.do")
	public ModelAndView SM1_03_Delete(HttpServletRequest request, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{		
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.delete(vo);
		
		model.put("result", true);		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_03_UpdateUiAuth.do")
	public ModelAndView SM1_03_UpdateUiAuth(HttpServletRequest request, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{		
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.updateUiAuth(vo);
		
		model.put("result", true);		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_03/moreAuthManagePopup.do")
	public String editMoreAuthManagePopup(ModelMap model, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{
		
		SM1_03VO objectMoreAuthManage = service.objectMoreAuthManage(vo);
		
		if(objectMoreAuthManage != null){
			model.addAttribute("SM1_03VO", objectMoreAuthManage);	
		}
		
		return "lionsclubs/com/SM1/SM1_1/SM1_03/moreAuthManagePopup";
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_03/saveMoreAuthManage.do")
	public ModelAndView saveMoreAuthManage(ModelMap model, @ModelAttribute("SM1_03VO") SM1_03VO vo) throws Exception{
		
		model.put("result", service.saveMoreAuthManage(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
