package lionsclubs.com.MM2.MM2_5.MM2_30;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_30ServiceImpl extends AbstractServiceImpl implements MM2_30Service{
	
	@Autowired private MM2_30DAO dao;
	
	@Override
	public List<MM2_30VO> MM2_30(MM2_30VO vo) throws Exception {
		return dao.MM2_30(vo);
	}
	
	@Override
	public MM2_30VO total(MM2_30VO vo) throws Exception {
		return dao.total(vo);
	}
}
