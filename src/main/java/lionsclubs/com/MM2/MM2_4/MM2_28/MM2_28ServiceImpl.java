package lionsclubs.com.MM2.MM2_4.MM2_28;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_28ServiceImpl extends AbstractServiceImpl implements MM2_28Service{
	@Autowired private MM2_28DAO dao;

	@Override
	public List<Map<String, Object>> selectIncomeHead(MM2_28VO vo) throws Exception {
		return dao.selectIncomeHead(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectIncome(MM2_28VO vo) throws Exception {
		return dao.selectIncome(vo);
	}
	
	@Override
	public Map<String, Object> selectIncomeSum(MM2_28VO vo) throws Exception {
		return dao.selectIncomeSum(vo);
	}

	@Override
	public List<Map<String, Object>> selectDefectHead(MM2_28VO vo) throws Exception {
		return dao.selectDefectHead(vo);
	}	
	
	@Override
	public List<Map<String, Object>> selectDefect(MM2_28VO vo) throws Exception {
		return dao.selectDefect(vo);
	}
	
	@Override
	public Map<String, Object> selectDefectSum(MM2_28VO vo) throws Exception {
		return dao.selectDefectSum(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectDebtHead(MM2_28VO vo) throws Exception {
		return dao.selectDebtHead(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectDebt(MM2_28VO vo) throws Exception {
		return dao.selectDebt(vo);
	}
	
	@Override
	public Map<String, Object> selectDebtSum(MM2_28VO vo) throws Exception {
		return dao.selectDebtSum(vo);
	}
}