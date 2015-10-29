package lionsclubs.com.cmm.excel;

import java.io.InputStream;
import java.util.Map;

public interface ExcelService {
	
	/**
	 * xls parser
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public Map<Object, Object> xlsParser(InputStream inputStream) throws Exception;
	
	/**
	 * xlsx parser
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public Map<Object, Object> xlsxParser(InputStream inputStream) throws Exception;
}
