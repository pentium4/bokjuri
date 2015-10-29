package lionsclubs.com.MM3.MM3_9.MM3_39;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_39ServiceImpl extends AbstractServiceImpl implements MM3_39Service{
	@Autowired private MM3_39DAO dao;

	@Override
	public List<Map<String, Object>> MM3_39(MM3_39VO vo) throws Exception {
		return dao.MM3_39(vo);
	}

	@Override
	public Map<String, Object> sum(MM3_39VO vo) throws Exception {
		return dao.sum(vo);
	}
	
	@Override
	public List<MM3_39VO> listEvent(MM3_39VO vo) throws Exception {
		return dao.listEvent(vo);
	}
}
