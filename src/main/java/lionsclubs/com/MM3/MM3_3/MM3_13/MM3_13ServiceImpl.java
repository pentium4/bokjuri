package lionsclubs.com.MM3.MM3_3.MM3_13;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_13ServiceImpl extends AbstractServiceImpl implements MM3_13Service{
	
	@Autowired
	private MM3_13DAO dao;

	@Override
	public List<Map<String, Object>> selectList(MM3_13VO vo) throws Exception {
		return (List<Map<String, Object>>)dao.selectList(vo);
	}
}
