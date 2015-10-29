package lionsclubs.com.MM2.MM2_2.MM2_12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_12ServiceImpl extends AbstractServiceImpl implements MM2_12Service{
	
	@Autowired
	private MM2_12DAO dao;
	
	@Override
	public List<MM2_12VO> MM2_12(MM2_12VO vo) throws Exception {
		return dao.MM2_12(vo);
	}
	
	public MM2_12VO sum(MM2_12VO vo) throws Exception {
		return dao.sum(vo);
	}
}
