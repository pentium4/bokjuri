package lionsclubs.com.MM1.MM1_1.MM1_02;

import lionsclubs.com.cmm.pagging.Page;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MM1_02ServiceImpl extends AbstractServiceImpl implements MM1_02Service{

	@Autowired
	private MM1_02DAO dao;

	@Override
	public Page List(MM1_02VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public void Insert(MM1_02VO vo) throws Exception {
		dao.Insert(vo);
	}

	@Override
	public Integer Update(MM1_02VO vo) throws Exception {
		return dao.Update(vo);
	}

	@Override
	public Integer Delete(MM1_02VO vo) throws Exception {
		return dao.Delete(vo);
	}

	@Override
	public MM1_02VO Select(MM1_02VO vo) throws Exception {
		return dao.Select(vo);
	}

}
