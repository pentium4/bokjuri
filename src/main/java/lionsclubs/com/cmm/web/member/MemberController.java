package lionsclubs.com.cmm.web.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MemberController {
	@Resource private MemberService service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	/**
	 * 성명순 조회 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/member/memberSearchPopup.do")
	public String memberSearchPopup(ModelMap model, @ModelAttribute("memberVO") MemberVO vo) throws Exception{
		Page page = service.memberList(vo);
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());		
		
        return "lionsclubs/com/common/member/memberSearchPopup";
	}
	
	/**
	 * 검색유지 회원번호를 저장한다.
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/member/saveMemberNo.do")
	public ModelAndView saveMemberNo(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.saveMemberNo(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}		
}
