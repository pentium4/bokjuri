package lionsclubs.com.MM4.MM4_2.MM4_09;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

@Repository
public class MM4_09DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM4.MM4_2.MM4_09.";

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(MM4_09VO_PARAM vo) {
		return (List<Map<String, Object>>)list(commonId + "selectList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<CommonCodeVO> selectCodeList(MM4_09VO_PARAM vo) {
		return (List<CommonCodeVO>)list(commonId + "selectCodeList", vo);
	}
}
