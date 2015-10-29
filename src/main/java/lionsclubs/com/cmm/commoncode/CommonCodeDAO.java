package lionsclubs.com.cmm.commoncode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class CommonCodeDAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.cmm.commoncode.";

	/**
	 * 그룹코드 select box 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CommonCodeVO> codelist(String groupCode) throws Exception{
		return list(commonId + "codelist", groupCode);
	}
	
	@SuppressWarnings("unchecked")
	public List<CommonCodeVO> codelistSimple(String groupCode, String code1, String code2) throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupCode", groupCode);
		map.put("code1", code1);
		map.put("code2", code2);
		return list(commonId + "codelistSimple", map);
	}
	
	public String codetolabel(CommonCodeVO vo) throws Exception {
		return (String) selectByPk(commonId + "codetolabel", vo);
	}

	public String codetocode1(CommonCodeVO vo) {
		return (String) selectByPk(commonId + "codetocode1", vo);
	}		
	
	@SuppressWarnings("unchecked")
	public List<CommonCodeVO> codeOption1List(CommonCodeVO vo) throws Exception {
		return list(commonId + "codeOption1List", vo);
	}

	@SuppressWarnings("unchecked")
	public List<CommonCodeVO> codeOption2List(CommonCodeVO vo) throws Exception {
		return list(commonId + "codeOption2List", vo);
	}

	public String organCodeToName(CommonCodeVO vo) {
		return (String) selectByPk(commonId + "organCodeToName", vo);
	}
}
