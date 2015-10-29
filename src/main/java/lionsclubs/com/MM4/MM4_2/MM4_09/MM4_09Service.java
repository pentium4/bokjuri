package lionsclubs.com.MM4.MM4_2.MM4_09;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;

public interface MM4_09Service {

	public List<Map<String, Object>> selectList(MM4_09VO_PARAM vo) throws Exception;

	public List<CommonCodeVO> selectCodeList(MM4_09VO_PARAM vo) throws Exception;

}
