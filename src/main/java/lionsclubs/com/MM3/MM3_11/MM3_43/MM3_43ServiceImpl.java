package lionsclubs.com.MM3.MM3_11.MM3_43;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_43ServiceImpl extends AbstractServiceImpl implements MM3_43Service{
	@Autowired private MM3_43DAO dao;
	
	@Override
	public List<MM3_43VO> MM3_43(MM3_43VO vo) throws Exception {
		return dao.MM3_43(vo);
	}
	
	@Override
	public MM3_43VO amountSum(MM3_43VO vo) throws Exception {
		return dao.amountSum(vo);
	}
}
