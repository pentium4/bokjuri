package lionsclubs.com.MM3.MM3_10.MM3_59;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import lionsclubs.com.cmm.common.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_59ServiceImpl extends AbstractServiceImpl implements MM3_59Service{
	@Autowired private MM3_59DAO dao;
	@Autowired private ServletContext servletContext;
	
	@Override
	public List<MM3_59VO> MM3_59(MM3_59VO vo) throws Exception {
		return dao.MM3_59(vo);
	}
	
	@Override
	public MM3_59VO sum(MM3_59VO vo) throws Exception {
		return dao.sum(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_59VO vo, Map<String, Object> modelMap) throws Exception {
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("info", vo);
		map.put("templateSheetName", "1");
		map.put("sheetName", "Letter(List)");
		map.put("resultList", dao.MM3_59(vo));
		map.put("date", CommonUtil.getDateString(new Date(), "yyyy. M. d."));
		map.put("objectDistrictInfo", dao.objectDistrictInfo(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		String date = CommonUtil.getDateString(new Date(), "yyyy년 M월 d일");

		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_10/MM3_59/template.xlsx");
		modelMap.put("destFileName", date + " LCIF.xlsx");
		return null;
	}
}
