package lionsclubs.com.MM2.MM2_3.MM2_19;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_19ServiceImpl extends AbstractServiceImpl implements MM2_19Service{
	
	@Autowired
	private MM2_19DAO dao;
	
	@Override
	public MM2_19VO MM2_19(MM2_19VO vo) throws Exception {
		return dao.MM2_19(vo);
	}
	
	@Override
	public List<MM2_19VO> List(MM2_19VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public void otherIncomeInsert(MM2_19VO vo) throws Exception {
		dao.otherIncomeInsert(vo);
	}
	
	@Override
	public Integer otherIncomeUpdate(MM2_19VO vo) throws Exception {
		return dao.otherIncomeUpdate(vo);
	}

	@Override
	public Integer otherIncomeDelete(MM2_19VO vo) throws Exception {
		return dao.otherIncomeDelete(vo);
	}

	@Override
	public MM2_19VO paymentSum(MM2_19VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	@Override
	public MM2_19VO duplicateCheck(MM2_19VO vo) throws Exception {
		return dao.duplicateCheck(vo);
	}
}
