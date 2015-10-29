package lionsclubs.com.MM3.MM3_10.MM3_36;

import java.text.SimpleDateFormat;
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
public class MM3_36ServiceImpl extends AbstractServiceImpl implements MM3_36Service{
	@Autowired private ServletContext servletContext;
	@Autowired private MM3_36DAO dao;
	
	@Override
	public List<MM3_36VO> clubMemberShip(MM3_36VO vo) throws Exception {
		return dao.clubMemberShip(vo);
	}
	
	@Override
	public List<MM3_36VO> serviceStatus(MM3_36VO vo) throws Exception {
		return dao.serviceStatus(vo);
	}
	
	@Override
	public List<MM3_36VO> lcifStatus(MM3_36VO vo) throws Exception {
		return dao.lcifStatus(vo);
	}
	
	@Override
	public List<MM3_36VO> serviceHistory(MM3_36VO vo) throws Exception {
		return dao.serviceHistory(vo);
	}
	
	@Override
	public MM3_36VO reportSummary(MM3_36VO vo) throws Exception {
		return dao.reportSummary(vo);
	}
	
	@Override
	public MM3_36VO lcifStatusSummary(MM3_36VO vo) throws Exception {
		return dao.lcifStatusSummary(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM3_36VO vo, Map<String, Object> modelMap) throws Exception {
		vo.setYear(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()));

		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		List<Map<String, Object>> beansList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("info", vo);
		map.put("templateSheetName", "1");
		map.put("sheetName", "1.클럽별회원수-보고용");
		map.put("clubMemberShipList", dao.clubMemberShip(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);

		map = new HashMap<String, Object>();
		map.put("info", vo);
		map.put("templateSheetName", "2");
		map.put("sheetName", "2.봉사현황");
		map.put("serviceStatusList", dao.serviceStatus(vo));
		map.put("lcifStatusList", dao.lcifStatus(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		map = new HashMap<String, Object>();
		map.put("info", vo);
		map.put("templateSheetName", "3");
		map.put("sheetName", "3.봉사내역");
		map.put("serviceHistoryList", dao.serviceHistory(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);
		
		map = new HashMap<String, Object>();
		map.put("info", vo);
		map.put("templateSheetName", "4");
		map.put("sheetName", "4.월말보고집계표-한장에");
		map.put("reportSummary", dao.reportSummary(vo));
		map.put("serviceStatusList", dao.serviceStatus(vo));
		map.put("objectRates", modelMap.get("objectRates"));
		map.put("lcifStatusSummary", dao.lcifStatusSummary(vo));
		beansList.add(map);
		modelMap.put("beansList", beansList);

		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM3/MM3_10/MM3_36/template.xlsx");
		modelMap.put("destFileName", "복합지구보고서_" + date + ".xlsx");
		
		return modelMap;
	}
}
