package lionsclubs.com.MM4.MM4_2.MM4_09;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_09ServiceImpl extends AbstractServiceImpl implements MM4_09Service{
	
	@Autowired
	private MM4_09DAO dao;

	@Override
	public List<Map<String, Object>> selectList(MM4_09VO_PARAM vo) throws Exception {
		return (List<Map<String, Object>>)dao.selectList(vo);
	}

	
	@Override
	public List<CommonCodeVO> selectCodeList(MM4_09VO_PARAM vo) throws Exception {
		return (List<CommonCodeVO>)dao.selectCodeList(vo);
	}
}
