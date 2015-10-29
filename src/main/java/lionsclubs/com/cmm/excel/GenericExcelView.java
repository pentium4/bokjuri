package lionsclubs.com.cmm.excel;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lionsclubs.com.cmm.common.CommonUtil;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractExcelView;

@Service
public class GenericExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap,
			HSSFWorkbook workbook, HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		String excelName = (String) modelMap.get("excelName");
		@SuppressWarnings("unchecked")
		List<String> colName = (List<String>) modelMap.get("colName");
		@SuppressWarnings("unchecked")
		List<String> colWidth = (List<String>) modelMap.get("colWidth");
		@SuppressWarnings("unchecked")
		List<LinkedHashMap<String, Object>> colValue = (List<LinkedHashMap<String, Object>>) modelMap.get("colValue");

		res.setContentType("application/msexcel");
		res.setHeader("Content-Disposition", "attachment; filename="
				+ CommonUtil.getFileName(req, excelName) + ".xls");
		
		HSSFSheet sheet = workbook.createSheet(excelName);
		
		// 상단 메뉴명 생성
		HSSFRow menuRow = sheet.createRow(0);
		HSSFCellStyle titleCellStyle = workbook.createCellStyle();
		titleCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		titleCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		titleCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		titleCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		titleCellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		titleCellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		titleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		for (int i = 0; i < colName.size(); i++) {
			HSSFCell cell = menuRow.createCell(i);
			cell.setCellStyle(titleCellStyle);
			cell.setCellValue(new HSSFRichTextString(colName.get(i)));
		}
		
		HSSFCellStyle contentCellStyle = workbook.createCellStyle();
		contentCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		contentCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		contentCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		contentCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		contentCellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		contentCellStyle.setFillForegroundColor(HSSFColor.WHITE.index);		
		
		// 내용 생성
		for (int i = 0; i < colValue.size(); i++) {
			// 메뉴 ROW가 있기때문에 +1을 해준다.
			HSSFRow row = sheet.createRow(i + 1);
			LinkedHashMap<String, Object> map = colValue.get(i);
			
		    Iterator<String> iterator =  map.keySet().iterator();
		    int j = 0;
		    while (iterator.hasNext()) {
		    	
		        String key = (String) iterator.next();
	        	
				HSSFCell cell = row.createCell(j);
				
				cell.setCellStyle(contentCellStyle);
				String content = map.get(key) == null ? "" : map.get(key).toString();
				cell.setCellValue(new HSSFRichTextString(content));
		        j++;
		    }
			
			
//			for (int j = 0; j < colValue.get(i).length; j++) {
//				HSSFCell cell = row.createCell(j);
//				cell.setCellValue(new HSSFRichTextString(colValue.get(i)[j]));
//			}
		}
		
		for (int i = 0; i < colName.size(); i++) {
			if(colWidth == null){ // colWidth를 정하지 않으면 자동 너비
				sheet.autoSizeColumn((short)i);
			    sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 600 );
			}else{
			    sheet.setColumnWidth(i, Integer.parseInt(colWidth.get(i))); // colWidth 가 있으며 지정된 사이즈 적용
			}
		}

	}

}