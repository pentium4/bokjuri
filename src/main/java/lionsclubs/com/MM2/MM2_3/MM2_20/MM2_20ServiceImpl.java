package lionsclubs.com.MM2.MM2_3.MM2_20;

import java.util.List;
import lionsclubs.com.MM2.MM2_3.MM2_20.MM2_20VO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_20ServiceImpl extends AbstractServiceImpl implements MM2_20Service{
	
	@Autowired
	private MM2_20DAO dao;
	

	@Override
	public MM2_20VO MM2_20(MM2_20VO vo) throws Exception {
		return dao.MM2_20(vo);
	}
	
	@Override
	public List<MM2_20VO> List(MM2_20VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public void otherIncomeInsert(MM2_20VO vo) throws Exception {
		dao.otherIncomeInsert(vo);
	}
	
	@Override
	public Integer otherIncomeUpdate(MM2_20VO vo) throws Exception {
		return dao.otherIncomeUpdate(vo);
	}

	@Override
	public Integer otherIncomeDelete(MM2_20VO vo) throws Exception {
		return dao.otherIncomeDelete(vo);
	}

	@Override
	public MM2_20VO paymentSum(MM2_20VO vo) throws Exception {
		return dao.paymentSum(vo);
	}

	@Override
	public MM2_20VO duplicateCheck(MM2_20VO vo) throws Exception {
		return dao.duplicateCheck(vo);
	}
}

