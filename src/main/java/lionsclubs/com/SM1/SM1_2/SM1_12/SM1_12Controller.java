package lionsclubs.com.SM1.SM1_2.SM1_12;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SM1_12Controller {
	@Resource private SM1_12Service service;
	@Resource private CommonCodeService codeService;

	private int size = 30;

	private List<SM1_12VO_DATA>initList(List<SM1_12VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() < size) for(int i = resultList.size(); i < size; i++) resultList.add(i,new SM1_12VO_DATA());
		return resultList;
	}	

	private void selectList(SM1_12VO vo) throws Exception {
		vo.setCodeList(codeService.codelistSimple("9020"));
		vo.setListData(this.initList(service.selectList(vo), this.size));
	}

	
	@RequestMapping("/SM1/SM1_2/SM1_12/SM1_12.do")
	public String SM1_12(ModelMap model, @ModelAttribute("SM1_12VO") SM1_12VO vo) throws Exception{
		vo.setCodeList(codeService.codelistSimple("9020"));
		vo.setListData(this.initList(new ArrayList<SM1_12VO_DATA>(), this.size));
		return "lionsclubs/com/SM1/SM1_2/SM1_12/SM1_12";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_12/selectList.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_12VO") SM1_12VO vo) throws Exception{
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_12/SM1_12";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_12/insertList.dox")
	public String insertList(ModelMap model, @ModelAttribute("SM1_12VO") SM1_12VO vo) throws Exception{
		service.insertList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_12/SM1_12";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_12/updateList.dox")
	public String updateList(ModelMap model, @ModelAttribute("SM1_12VO") SM1_12VO vo) throws Exception{
		service.updateList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_12/SM1_12";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_12/deleteList.dox")
	public String deleteList(ModelMap model, @ModelAttribute("SM1_12VO") SM1_12VO vo) throws Exception{
		service.deleteList(vo);
		this.selectList(vo);
		return "lionsclubs/com/SM1/SM1_2/SM1_12/SM1_12";
	}
	
	@RequestMapping("/SM1/SM1_2/SM1_12/reorderList.dox")
	public String reorderList(ModelMap model, @ModelAttribute("SM1_12VO") SM1_12VO vo) throws Exception{
		try{
		service.reorderList(vo);
		this.selectList(vo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "lionsclubs/com/SM1/SM1_2/SM1_12/SM1_12";
	}
}
