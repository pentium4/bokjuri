package lionsclubs.com.SM1.SM1_2.SM1_11;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SM1_11Controller {
	@Resource private SM1_11Service service;
	@Resource private CommonCodeService codeService;

	private int size = 30;

	private List<SM1_11VO_DATA>initList(List<SM1_11VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() < size) for(int i = resultList.size(); i < size; i++) resultList.add(i,new SM1_11VO_DATA());
		return resultList;
	}	

	private void selectList(SM1_11VO vo) throws Exception {
		vo.setCodeList(codeService.codelistSimple("9010"));
		vo.setListData(this.initList(service.selectList(vo), this.size));
	}

	
	@RequestMapping("/SM1/SM1_2/SM1_11/SM1_11.do")
	public String SM1_11(ModelMap model, @ModelAttribute("SM1_11VO") SM1_11VO vo) throws Exception{
		vo.setCodeList(codeService.codelistSimple("9010"));
		vo.setListData(this.initList(new ArrayList<SM1_11VO_DATA>(), this.size));
		return "lionsclubs/com/SM1/SM1_2/SM1_11/SM1_11";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_11/selectList.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_11VO") SM1_11VO vo) throws Exception{
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_11/SM1_11";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_11/insertList.dox")
	public String insertList(ModelMap model, @ModelAttribute("SM1_11VO") SM1_11VO vo) throws Exception{
		service.insertList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_11/SM1_11";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_11/updateList.dox")
	public String updateList(ModelMap model, @ModelAttribute("SM1_11VO") SM1_11VO vo) throws Exception{
		service.updateList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_11/SM1_11";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_11/deleteList.dox")
	public String deleteList(ModelMap model, @ModelAttribute("SM1_11VO") SM1_11VO vo) throws Exception{
		service.deleteList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_11/SM1_11";
	}

	@RequestMapping("/SM1/SM1_2/SM1_11/reorderList.dox")
	public String reorderList(ModelMap model, @ModelAttribute("SM1_11VO") SM1_11VO vo) throws Exception{
		try{
		service.reorderList(vo);
		this.selectList(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "lionsclubs/com/SM1/SM1_2/SM1_11/SM1_11";
	}
}
