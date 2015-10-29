package lionsclubs.com.MM3.MM3_10.MM3_58;

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
public class MM3_58ServiceImpl extends AbstractServiceImpl implements MM3_58Service{
	@Autowired private MM3_58DAO dao;
	@Autowired private ServletContext servletContext;
	
	@Override
	public List<MM3_58VO> MM3_58(MM3_58VO vo) throws Exception {
		return dao.MM3_58(vo);
	}
	
	@Override
	public MM3_58VO sum(MM3_58VO vo) throws Exception {
		return dao.sum(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_58VO vo, Map<String, Object> modelMap) throws Exception {
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("info", vo);
		map.put("templateSheetName", "1");
		map.put("sheetName", "Letter(List)");
		map.put("resultList", dao.MM3_58(vo));
		map.put("date", CommonUtil.getDateString(new Date(), "yyyy. M. d."));
		map.put("objectDistrictInfo", dao.objectDistrictInfo(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		String date = CommonUtil.getDateString(new Date(), "yyyy년 M월 d일");

		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_10/MM3_58/template.xlsx");
		modelMap.put("destFileName", date + " 국제회비 국제협회문서.xlsx");
		return null;
	}
}
