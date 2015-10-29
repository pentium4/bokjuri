package lionsclubs.com.MM4.MM4_2.MM4_15;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM4_15ServiceImpl extends AbstractServiceImpl implements MM4_15Service{
	
	@Autowired
	private MM4_15DAO dao;

	@Override
	public List<Map<String, Object>> selectList(MM4_15VO_PARAM vo) throws Exception {
		return (List<Map<String, Object>>)dao.selectList(vo);
	}

}
