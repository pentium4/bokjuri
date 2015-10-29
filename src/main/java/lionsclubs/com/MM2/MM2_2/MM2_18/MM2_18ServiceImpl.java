package lionsclubs.com.MM2.MM2_2.MM2_18;

import java.util.List;
import java.util.Map;

import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_18ServiceImpl extends AbstractServiceImpl implements MM2_18Service{
	
	@Autowired private MM2_18DAO dao;
	
	@Override
	public MM2_18VO MM2_18(MM2_18VO vo) throws Exception {
		return dao.MM2_18(vo);
	}
	
	@Override
	public List<Map<String, Object>> List(MM2_18VO vo) throws Exception {
		return dao.List(vo);
	}
	

	@Override
	public Map<String, Object> paymentSum(MM2_18VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	
	@Override
	public List<Map<String, Object>> headInfo(MM2_18VO vo) throws Exception {
		return dao.headInfo(vo);
	}
}
