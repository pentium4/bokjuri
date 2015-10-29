package lionsclubs.com.MM2.MM2_6.MM2_33;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_33ServiceImpl extends AbstractServiceImpl implements MM2_33Service{
	@Autowired private ServletContext servletContext;
	@Autowired private MM2_33DAO dao;
	
	@Override
	public List<MM2_33VO> MM2_33(MM2_33VO vo) throws Exception {
		List<MM2_33VO> list = dao.classItemCode(vo);
		
		for(MM2_33VO vo2 : list){
			vo.setClassItemCode(vo2.getClassItemCode());
			vo2.setList(dao.MM2_33(vo));
		}
		
		return list;
	}
	
	@Override
	public Map<String, Object> excelDownload(MM2_33VO vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM2/MM2_6/MM2_33/template.xlsx");
		modelMap.put("destFileName", "수지계산서(지출내역)_" + date + ".xlsx");
		
		return modelMap;
	}
}
