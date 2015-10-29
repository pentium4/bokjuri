package lionsclubs.com.MM2.MM2_1.MM2_02;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_02ServiceImpl extends AbstractServiceImpl implements MM2_02Service{
	
	@Autowired private MM2_02DAO dao;
	
	
	@Override
	public Page List(MM2_02VO vo) throws Exception {
		return dao.List(vo);
	}
	@Override
	public Integer selectMM2_02TotalCount(MM2_02VO vo) throws Exception {
		return dao.selectMM2_02TotalCount(vo);
	}
	@Override
	public MM2_02VO Select(MM2_02VO vo) throws Exception {
		
		return dao.Select(vo);
	}
	@Override
	public void Insert(MM2_02VO vo) throws Exception {
		
		dao.Insert(vo);
	}
	@Override
	public Integer Update(MM2_02VO vo) throws Exception {
		
		return dao.Update(vo);
	}
	@Override
	public Integer Delete(MM2_02VO vo) throws Exception {
		
		return dao.Delete(vo);
	}
}
