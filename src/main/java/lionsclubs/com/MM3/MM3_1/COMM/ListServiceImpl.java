package lionsclubs.com.MM3.MM3_1.COMM;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class ListServiceImpl extends AbstractServiceImpl implements ListService{
	
	@Autowired
	private LIST_DAO dao;

	@Override
	public List<LIST_VO_DATA> selectList(LIST_VO vo) throws Exception {
		return dao.selectList(vo);
	}
}
