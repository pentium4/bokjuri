package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.commoncode.CommonCodeService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;


@Controller
public class SM1_10Controller {
	@Resource private SM1_10Service service;
	@Resource private CommonCodeService codeService;
	
	@Resource MappingJacksonJsonView ajaxMainView;	

	private int size = 30;

	private List<SM1_10VO_DATA>initList(List<SM1_10VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() < size) for(int i = resultList.size(); i < size; i++) resultList.add(i,new SM1_10VO_DATA());
		return resultList;
	}	

	private void selectList(SM1_10VO vo) throws Exception {
		vo.setCodeList(codeService.codelistSimple("9000"));
		vo.setListData(this.initList(service.selectList(vo), this.size));
	}

	
	@RequestMapping("/SM1/SM1_2/SM1_10/fileInfoUpload.dox")
	public ModelAndView fileInfoUpload(HttpServletRequest request, @ModelAttribute("SM1_10VO_FILE") SM1_10VO_FILE vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.fileInfoUpload(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_10/fileInfoPopup.do")
	public String fileInfoPopup(ModelMap model, @ModelAttribute("SM1_10VO_FILE") SM1_10VO_FILE vo) throws Exception{
		return "lionsclubs/com/SM1/SM1_2/SM1_10/picPopup";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_10/SM1_10.do")
	public String SM1_10(ModelMap model, @ModelAttribute("SM1_10VO") SM1_10VO vo) throws Exception{
		vo.setCodeList(codeService.codelistSimple("9000"));
		vo.setListData(this.initList(new ArrayList<SM1_10VO_DATA>(), this.size));
		return "lionsclubs/com/SM1/SM1_2/SM1_10/SM1_10";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_10/selectList.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_10VO") SM1_10VO vo) throws Exception{
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_10/SM1_10";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_10/insertList.dox")
	public String insertList(ModelMap model, @ModelAttribute("SM1_10VO") SM1_10VO vo) throws Exception{
		try{
		service.insertList(vo);
		this.selectList(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "lionsclubs/com/SM1/SM1_2/SM1_10/SM1_10";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_10/updateList.dox")
	public String updateList(ModelMap model, @ModelAttribute("SM1_10VO") SM1_10VO vo) throws Exception{
		service.updateList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_10/SM1_10";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_10/deleteList.dox")
	public String deleteList(ModelMap model, @ModelAttribute("SM1_10VO") SM1_10VO vo) throws Exception{
		service.deleteList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_10/SM1_10";
	}
	
	
	@RequestMapping("/SM1/SM1_2/SM1_10/reorderList.dox")
	public String reorderList(ModelMap model, @ModelAttribute("SM1_10VO") SM1_10VO vo) throws Exception{
		try{
		service.reorderList(vo);
		this.selectList(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "lionsclubs/com/SM1/SM1_2/SM1_10/SM1_10";
	}
}
