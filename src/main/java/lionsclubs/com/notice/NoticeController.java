package lionsclubs.com.notice;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class NoticeController {
	@Resource private NoticeService service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	/**
	 * 게시판 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/notice.do")
	public String notice(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();		
		String noticeKindCode = service.objectNoticeKindCode(vo);
		
		// 클럽 문서자료실
		if("1020".equals(noticeKindCode)){
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchClubCode());
			}
		// 1030 : 지구 문서자료실, 1040: 지구 공개자료실
		} else if("1030".equals(noticeKindCode) || "1040".equals(noticeKindCode)){
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchDistrictCode());
			}
		}
		
		Page resultList = service.listNotice(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());			
		model.addAttribute("noticeKindCode", noticeKindCode);
		
		return "lionsclubs/com/notice/notice";
	}
	
	/**
	 * 게시판 상세
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/noticeDetail.do")
	public String noticeDetail(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();		
		String noticeKindCode = service.objectNoticeKindCode(vo);
		
		// 클럽 문서자료실
		if("1020".equals(noticeKindCode)){
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchClubCode());
			}
		// 1030 : 지구 문서자료실, 1040: 지구 공개자료실
		} else if("1030".equals(noticeKindCode) || "1040".equals(noticeKindCode)){
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchDistrictCode());
			}
		}
		
		model.addAttribute("result", service.objectNotice(vo));
		model.addAttribute("prenextPaging", service.prenextPaging(vo));
		model.addAttribute("noticeKindCode", noticeKindCode);
		
		return "lionsclubs/com/notice/noticeDetail";
	}	
	
	
	/**
	 * 게시판 입력/수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/noticeWrite.do")
	public String noticePopup(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();		
		String noticeKindCode = service.objectNoticeKindCode(vo);
		
		// 클럽 문서자료실
		if("1020".equals(noticeKindCode)){
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchClubCode());
			}
		// 1030 : 지구 문서자료실, 1040: 지구 공개자료실
		} else if("1030".equals(noticeKindCode) || "1040".equals(noticeKindCode)){
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchDistrictCode());
			}
		}
		
		if(vo.getIdnNo() != null){
			model.addAttribute("noticeVO", service.objectNotice(vo));
		}
		
		model.addAttribute("noticeKindCode", noticeKindCode);
		
		return "lionsclubs/com/notice/noticeWrite";
	}
	
	/**
	 * 게시판 입력
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/noticeInsert.do")
	public ModelAndView noticeInsert(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
	    if (EgovDoubleSubmitHelper.checkAndSaveToken("notice")) {  
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setInsertName(user.getId());
			vo.setUpdateName(user.getId());
			
			model.put("idnNo", service.noticeInsert(vo));
			model.put("result", true);
	    }
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 게시판 수정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/noticeUpdate.do")
	public ModelAndView noticeUpdate(HttpServletRequest request, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("idnNo", vo.getIdnNo());
		model.put("result", service.noticeUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 게시판 삭제
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notice/noticeDelete.do")
	public ModelAndView noticeDelete(HttpServletRequest request, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.noticeDelete(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/notice/listReply.do")
	public ModelAndView listReply(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{

		model.put("replyTotalCnt", service.replyTotalCnt(vo));
		model.put("resultList", service.listReply(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/notice/objectReply.do")
	public ModelAndView objectReply(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		
		model.put("object", service.objectReply(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/notice/saveReply.do")
	public ModelAndView saveReply(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		
		model.put("result", service.saveReply(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/notice/updateDelReply.do")
	public ModelAndView deleteReply(ModelMap model, @ModelAttribute("noticeVO") NoticeVO vo) throws Exception{
		
		model.put("result", service.updateDelReply(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
