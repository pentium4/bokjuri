package lionsclubs.com.MM2.MM2_1.MM2_09;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_09ServiceImpl extends AbstractServiceImpl implements MM2_09Service{
	
	@Autowired private MM2_09DAO dao;
	
	@Override
	public List<MM2_09VO> List(MM2_09VO vo) throws Exception {
		return dao.List(vo);
	}
}
