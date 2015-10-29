package lionsclubs.com.MM3.MM3_12.MM3_52;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_52ServiceImpl extends AbstractServiceImpl implements MM3_52Service{
	@Autowired private MM3_52DAO dao;

	@Override
	public List<MM3_52VO> MM3_52(MM3_52VO vo) throws Exception {
		return dao.MM3_52(vo);
	}
	
	@Override
	public MM3_52VO sum(MM3_52VO vo) throws Exception {
		return dao.sum(vo);
	}
}
