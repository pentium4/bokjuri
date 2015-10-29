package lionsclubs.com.MM3.MM3_12.MM3_53;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_53ServiceImpl extends AbstractServiceImpl implements MM3_53Service{
	
	@Autowired private MM3_53DAO dao;
	
	@Override
	public MM3_53VO MM3_53(MM3_53VO vo) throws Exception {
		return dao.MM3_53(vo);
	}
	
	@Override
	public List<Map<String, Object>> List(MM3_53VO vo) throws Exception {
		return dao.List(vo);
	}
	

	@Override
	public Map<String, Object> paymentSum(MM3_53VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	
	@Override
	public List<Map<String, Object>> headInfo(MM3_53VO vo) throws Exception {
		return dao.headInfo(vo);
	}
}
