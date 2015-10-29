package lionsclubs.com.MM3.MM3_12.MM3_47;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_47ServiceImpl extends AbstractServiceImpl implements MM3_47Service{
	@Autowired private MM3_47DAO dao;

	@Override
	public List<MM3_47VO> MM3_47(MM3_47VO vo) throws Exception {
		return dao.MM3_47(vo);
	}
	
	@Override
	public MM3_47VO sum(MM3_47VO vo) throws Exception {
		return dao.sum(vo);
	}
}
