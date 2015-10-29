package lionsclubs.com.MM2.MM2_1.MM2_03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_03ServiceImpl extends AbstractServiceImpl implements MM2_03Service{
	
	@Autowired private MM2_03DAO dao;
	
	@Override
	public List<MM2_03VO> List(MM2_03VO vo) throws Exception {
		return dao.List(vo);
	}

}
