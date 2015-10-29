package lionsclubs.com.MM3.MM3_3.MM3_15;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_15ServiceImpl extends AbstractServiceImpl implements MM3_15Service{
	
	@Autowired
	private MM3_15DAO dao;
	
	@Override
	public List<Map<String, Object>> selectList(MM3_15VO vo) throws Exception {
		return (List<Map<String, Object>>)dao.selectList(vo);
	}
}
