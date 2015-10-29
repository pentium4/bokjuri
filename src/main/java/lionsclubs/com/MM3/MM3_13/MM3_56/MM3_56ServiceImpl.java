package lionsclubs.com.MM3.MM3_13.MM3_56;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_56ServiceImpl extends AbstractServiceImpl implements MM3_56Service{
	@Autowired private MM3_56DAO dao;
	
	@Override
	public List<MM3_56VO> MM3_56(MM3_56VO vo) throws Exception {
		return dao.MM3_56(vo);
	}
	
	@Override
	public List<MM3_56VO> listRepOrganHistory(MM3_56VO vo) throws Exception {
		return dao.listRepOrganHistory(vo);
	}
}
