package lionsclubs.com.cmm.commoncode;

import java.util.List;


public interface CommonCodeService {

	public List<CommonCodeVO> codelist(String groupCode) throws Exception;

	public List<CommonCodeVO> codelistSimple(String groupCode) throws Exception;

	public String codetolabel(CommonCodeVO vo) throws Exception;
	
	public String codetocode1(CommonCodeVO vo) throws Exception;
	
	public List<CommonCodeVO> codeOption1List(CommonCodeVO vo) throws Exception;
	
	public List<CommonCodeVO> codeOption2List(CommonCodeVO vo) throws Exception;
	
	public List<CommonCodeVO> codelistSimple(String groupCode, String code1, String code2) throws Exception;
	
	public String organCodeToName(CommonCodeVO vo) throws Exception;
}
