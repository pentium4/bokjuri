package lionsclubs.com.MM2.MM2_2.MM2_11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_11ServiceImpl extends AbstractServiceImpl implements MM2_11Service{
	@Autowired private MM2_11DAO dao;
	
	@Override
	public List<MM2_11VO> selectList(MM2_11VO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public MM2_11VO paymentSum(MM2_11VO vo) throws Exception {
		return dao.paymentSum(vo);
	}
	
	@Override
	public String cDate(MM2_11VO vo) throws Exception {
		return dao.cDate(vo);
	}
}
