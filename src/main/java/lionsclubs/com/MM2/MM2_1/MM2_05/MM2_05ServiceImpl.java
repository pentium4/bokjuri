package lionsclubs.com.MM2.MM2_1.MM2_05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_05ServiceImpl extends AbstractServiceImpl implements MM2_05Service{
	
	@Autowired
	private MM2_05DAO dao;
	

	@Override
	public MM2_05VO MM2_05(MM2_05VO vo) throws Exception {
		return dao.MM2_05(vo);
	}
	
	@Override
	public List<MM2_05VO> List(MM2_05VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public void awardInsert(MM2_05VO vo) throws Exception {
		dao.awardInsert(vo);
	}
	
	@Override
	public Integer awardUpdate(MM2_05VO vo) throws Exception {
		return dao.awardUpdate(vo);
	}

	@Override
	public Integer awardDelete(MM2_05VO vo) throws Exception {
		return dao.awardDelete(vo);
	}
}
