package lionsclubs.com.MM3.MM3_6.MM3_30;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_30ServiceImpl extends AbstractServiceImpl implements MM3_30Service{
	
	@Autowired
	private MM3_30DAO dao;

	@Override
	public List<MM3_30VO> List(MM3_30VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public Integer Update(MM3_30VO vo) throws Exception {		
		return dao.Update(vo);
	}
	
	@Override
	public MM3_30VO detail(MM3_30VO vo) throws Exception {
		return dao.detail(vo);
	}	
}
