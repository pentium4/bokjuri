package lionsclubs.com.MM4.MM4_2.MM4_12;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_12ServiceImpl extends AbstractServiceImpl implements MM4_12Service{
	
	@Autowired
	private MM4_12DAO dao;

	
	@Override
	public List<Map<String, Object>> selectList(MM4_12VO_PARAM vo) throws Exception {
		return (List<Map<String, Object>>)dao.selectList(vo);
	}

	
}
