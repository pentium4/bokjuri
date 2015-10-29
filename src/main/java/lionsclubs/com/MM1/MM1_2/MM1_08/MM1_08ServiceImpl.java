package lionsclubs.com.MM1.MM1_2.MM1_08;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_08ServiceImpl extends AbstractServiceImpl implements MM1_08Service{
	
	@Autowired private MM1_08DAO dao;
	
	@Override
	public List<MM1_08VO> selectList(MM1_08VO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public List<MM1_08VO> listPayment(MM1_08VO vo) throws Exception {
		return dao.listPayment(vo);
	}
}
