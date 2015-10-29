package lionsclubs.com.MM2.MM2_1.MM2_06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_06ServiceImpl extends AbstractServiceImpl implements MM2_06Service{
	
	@Autowired
	private MM2_06DAO dao;
	
	@Override
	public List<MM2_06VO> List(MM2_06VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public MM2_06VO paymentSum(MM2_06VO vo) throws Exception {
		return dao.paymentSum(vo);
	}
}
