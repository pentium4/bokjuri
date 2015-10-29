package lionsclubs.com.MM2.MM2_2.MM2_15;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_15ServiceImpl extends AbstractServiceImpl implements MM2_15Service{
	@Autowired private MM2_15DAO dao;
	
	@Override
	public MM2_15VO MM2_15(MM2_15VO vo) throws Exception {
		return dao.MM2_15(vo);
	}
	
	@Override
	public List<MM2_15VO> List(MM2_15VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public void otherIncomeInsert(MM2_15VO vo) throws Exception {
		dao.otherIncomeInsert(vo);
	}
	
	@Override
	public Integer otherIncomeUpdate(MM2_15VO vo) throws Exception {
		return dao.otherIncomeUpdate(vo);
	}

	@Override
	public Integer otherIncomeDelete(MM2_15VO vo) throws Exception {
		return dao.otherIncomeDelete(vo);
	}

	@Override
	public MM2_15VO paymentSum(MM2_15VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	@Override
	public MM2_15VO paymentDate(MM2_15VO vo) throws Exception {
		return dao.paymentDate(vo);
	}
	
	@Override
	public Boolean selectClosedMonthFlag(MM2_15VO_CLOSE_PARAM vo) throws Exception {
		return dao.selectClosedMonthFlag(vo);
	}
}
