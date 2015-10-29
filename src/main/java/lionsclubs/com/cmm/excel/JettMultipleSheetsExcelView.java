package lionsclubs.com.cmm.excel;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.excel.jettcustomtag.CustomTagLibrary;
import net.sf.jett.transform.ExcelTransformer;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractExcelView;

@Service
public class JettMultipleSheetsExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ExcelTransformer transformer = new ExcelTransformer();
		CustomTagLibrary library = CustomTagLibrary.getCustomTagLibrary();
		transformer.registerTagLibrary("custom", library);
		
		String templateFileName = (String) model.get("templateFileName");;
		String destFileName = (String) model.get("destFileName");
		FileInputStream is = new FileInputStream(templateFileName);
		
		List<String> templateSheetNames = new ArrayList<String>();
		List<String> sheetNames = new ArrayList<String>();
		List<Map<String, Object>> beansList = (List<Map<String, Object>>) model.get("beansList");
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("templateSheetName", "intro");
//		map.put("sheetName", "Introduction");
//		beansList.add(map);
//		
////		map.clear();
//		map = new HashMap<String, Object>();
//		map.put("templateSheetName", "sheetToClone");
//		map.put("sheetName", "Q4 2014");
//		beansList.add(map);

		for(Map<String, Object> beans : beansList){
			System.out.println("templateSheetName : " + beans.get("templateSheetName").toString());
			System.out.println("sheetName : " + beans.get("sheetName").toString());
			templateSheetNames.add(beans.get("templateSheetName").toString());
			sheetNames.add(beans.get("sheetName").toString());
		}
		
		Workbook resultWorkbook = transformer.transform(is, templateSheetNames, sheetNames, beansList);
//		Workbook resultWorkbook = transformer.transform(is, model);

		StringBuffer contentDisposition = new StringBuffer();
		contentDisposition.append("attachment;fileName=\"");
		contentDisposition.append(CommonUtil.getFileName(request, destFileName));
		contentDisposition.append("\";");

		response.setHeader("Content-Disposition", contentDisposition.toString());
		response.setContentType("application/x-msexcel");
		resultWorkbook.write(response.getOutputStream());
	}
}
