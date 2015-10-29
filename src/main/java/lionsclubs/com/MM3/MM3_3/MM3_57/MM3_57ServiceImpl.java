package lionsclubs.com.MM3.MM3_3.MM3_57;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_57ServiceImpl extends AbstractServiceImpl implements MM3_57Service{
	@Autowired private MM3_57DAO dao;
	
	@Override
	public List<MM3_57VO> MM3_57(MM3_57VO vo) throws Exception {
		return dao.MM3_57(vo);
	}
}
