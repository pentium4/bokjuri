package lionsclubs.com.MM2.MM2_5.MM2_31;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_31ServiceImpl extends AbstractServiceImpl implements MM2_31Service{
	
	@Autowired private MM2_31DAO dao;
	
	@Override
	public List<MM2_31VO> list(MM2_31VO vo) throws Exception {
		return dao.list(vo);
	}
}
