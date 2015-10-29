package lionsclubs.com.MM2.MM2_2.MM2_34;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_34ServiceImpl extends AbstractServiceImpl implements MM2_34Service{
	
	@Autowired private MM2_34DAO dao;
	
	@Override
	public MM2_34VO MM2_34(MM2_34VO vo) throws Exception {
		return dao.MM2_34(vo);
	}
	
	@Override
	public List<Map<String, Object>> List(MM2_34VO vo) throws Exception {
		return dao.List(vo);
	}
	

	@Override
	public Map<String, Object> balanceSum(MM2_34VO vo) throws Exception {
		return dao.balanceSum(vo);
	}

	
	@Override
	public List<Map<String, Object>> headInfo(MM2_34VO vo) throws Exception {
		return dao.headInfo(vo);
	}
}
