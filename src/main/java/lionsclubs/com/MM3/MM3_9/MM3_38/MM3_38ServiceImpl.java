package lionsclubs.com.MM3.MM3_9.MM3_38;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_38ServiceImpl extends AbstractServiceImpl implements MM3_38Service{
	@Autowired private MM3_38DAO dao;
	
	@Override
	public List<MM3_38VO> MM3_38(MM3_38VO vo) throws Exception {
		return dao.MM3_38(vo);
	}
	
	@Override
	public Long sum(MM3_38VO vo) throws Exception {
		return dao.sum(vo);
	}
}
	