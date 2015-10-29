package lionsclubs.com.MM3.MM3_4.MM3_20;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MM3_20Service {
	public List<Map<String, Object>> selectList(MM3_20VO vo) throws Exception;
	
	public Map<String, Object> excelTemplateDownload(MM3_20VO vo, Map<String, Object> modelMap) throws Exception;
	
	public List<CODE_ADD_INFO> getCodeList(MM3_20VO vo) throws Exception;
	
	public String excelUpload(MM3_20VO vo, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> selectSum(MM3_20VO vo) throws Exception ;
}
