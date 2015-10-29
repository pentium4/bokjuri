package lionsclubs.com.MM2.MM2_3.MM2_23;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_23ServiceImpl extends AbstractServiceImpl implements MM2_23Service{
	
	@Autowired
	private MM2_23DAO dao;

	@Override
	public List<MM2_23VO_DATA> selectList(MM2_23VO vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public MM2_23VO_DATA selectSum(MM2_23VO vo) throws Exception {
		return dao.selectSum(vo);
	}
}