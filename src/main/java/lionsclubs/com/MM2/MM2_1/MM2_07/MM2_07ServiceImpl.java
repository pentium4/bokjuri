package lionsclubs.com.MM2.MM2_1.MM2_07;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_07ServiceImpl extends AbstractServiceImpl implements MM2_07Service{
	
	@Autowired
	private MM2_07DAO dao;
	
	@Override
	public List<MM2_07VO> List(MM2_07VO vo) throws Exception {
		return dao.List(vo);
	}
}
