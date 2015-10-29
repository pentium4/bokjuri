package lionsclubs.com.MM1.MM1_1.MM1_04;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_04ServiceImpl extends AbstractServiceImpl implements MM1_04Service{
	
	@Autowired
	private MM1_04DAO dao;

	@Override
	public List<MM1_04VO> List(MM1_04VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public void Insert(MM1_04VO vo) throws Exception {
		dao.Insert(vo);
	}

	@Override
	public Integer Update(MM1_04VO vo) throws Exception {
		return dao.Update(vo);
	}

	@Override
	public Integer Delete(MM1_04VO vo) throws Exception {
		return dao.Delete(vo);
	}

	@Override
	public MM1_04VO Select(MM1_04VO vo) throws Exception {
		return dao.Select(vo);
	}
}
