package lionsclubs.com.cmm.excel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.excel.EgovExcelService;
import egovframework.rte.fdl.excel.util.EgovExcelUtil;

@Service
public class ExcelServiceImpl extends AbstractServiceImpl implements ExcelService{
	@Resource private EgovExcelService excelZipService;
	
	@Override
	public Map<Object, Object> xlsParser(InputStream inputStream) throws Exception {
		
		HSSFWorkbook hssfWB = excelZipService.loadWorkbook(inputStream);
		
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
		
		HSSFSheet expensesSheet = hssfWB.getSheetAt(0);  // 입주클럽관리비 부과 시트
		int rows = expensesSheet.getPhysicalNumberOfRows(); //행 갯수 가져오기
		
		Map<Object, Object> info = new HashMap<Object, Object>();	// 엑셀정보

		int cells = 0;
		for(int i=0; i < rows; i++){ //row 루프
			HSSFRow row = expensesSheet.getRow(i); //row 가져오기
			Map<Object, Object> map = new HashMap<Object, Object>();	// 엑셀row data
			if(row != null){
				if(i == 0){
	                cells = row.getPhysicalNumberOfCells(); //cell 갯수 가져오기
	                info.put("cells", cells);	// cell 갯수
				}
				
                for(int j=0; j < cells; j++){
                	map.put("data_" + j, EgovExcelUtil.getValue(row.getCell(j)));	// cell data	
                }
			}
			
			list.add(map);
		}
		
		info.put("dataList", list);	// 데이터
		info.put("rows", rows);	// 행갯수
		info.put("sheetCount", hssfWB.getNumberOfSheets());	// 시트카운트		
		
		return info;
	}
	
	
	@Override
	public Map<Object, Object> xlsxParser(InputStream inputStream)
			throws Exception {
		XSSFWorkbook xssfWB = excelZipService.loadXSSFWorkbook(inputStream);
		
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
		
		XSSFSheet expensesSheet = xssfWB.getSheetAt(0);  // 입주클럽관리비 부과 시트
		int rows = expensesSheet.getPhysicalNumberOfRows(); //행 갯수 가져오기
		
		Map<Object, Object> info = new HashMap<Object, Object>();	// 엑셀정보

		int cells = 0;
		for(int i=0; i < rows; i++){ //row 루프
			XSSFRow row = expensesSheet.getRow(i); //row 가져오기
			Map<Object, Object> map = new HashMap<Object, Object>();	// 엑셀row data
			if(row != null){
				if(i == 0){
	                cells = row.getPhysicalNumberOfCells(); //cell 갯수 가져오기
	                info.put("cells", cells);	// cell 갯수
				}
				
                for(int j=0; j < cells; j++){
                	map.put("data_" + j, EgovExcelUtil.getValue(row.getCell(j)));	// cell data	
                }
			}
			
			list.add(map);
		}
		
		info.put("dataList", list);	// 데이터
		info.put("rows", rows);	// 행갯수
		info.put("sheetCount", xssfWB.getNumberOfSheets());	// 시트카운트		
		
		return info;
	}
}
