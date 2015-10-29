package lionsclubs.com.SM1.SM1_1.SM1_01;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class SM1_01Controller {
	@Resource private SM1_01Service service;
	
	@RequestMapping("/SM1/SM1_1/SM1_01/SM1_01.do")
	public String SM1_01(ModelMap model, @ModelAttribute("SM1_01VO") SM1_01VO vo) throws Exception{
		
		/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<SM1_01VO> resultList = service.selectList(vo);
        model.addAttribute("resultList", resultList);

        int totCnt = (Integer)service.selectListTotalCount(vo);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
		return "lionsclubs/com/SM1/SM1_1/SM1_01/SM1_01";
	}	
}
