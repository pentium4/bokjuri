package lionsclubs.com.MM3.MM3_6.MM3_31;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_31ServiceImpl extends AbstractServiceImpl implements MM3_31Service{
	
	@Autowired
	private MM3_31DAO dao;

	@Override
	public List<MM3_31VO> List(MM3_31VO vo) throws Exception {
		return dao.List(vo);
	}
}
