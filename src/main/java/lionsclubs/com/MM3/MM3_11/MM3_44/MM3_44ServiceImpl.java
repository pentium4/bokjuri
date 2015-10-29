package lionsclubs.com.MM3.MM3_11.MM3_44;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_44ServiceImpl extends AbstractServiceImpl implements MM3_44Service{
	@Autowired private MM3_44DAO dao;

	@Override
	public List<MM3_44VO> MM3_44(MM3_44VO vo) throws Exception {
		return dao.MM3_44(vo);
	}
	
	@Override
	public MM3_44VO amountSum(MM3_44VO vo) throws Exception {
		return dao.amountSum(vo);
	}
	
}
