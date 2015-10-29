package lionsclubs.com.MM3.MM3_7.MM3_34;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_34ServiceImpl extends AbstractServiceImpl implements MM3_34Service{
	@Autowired private MM3_34DAO dao;

	@Override
	public List<MM3_34VO> List(MM3_34VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public MM3_34VO sum(MM3_34VO vo) throws Exception {
		return dao.sum(vo);
	}	
}
