package lionsclubs.com.MM3.MM3_7.MM3_33_A;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service
public class MM3_33_AServiceImpl extends AbstractServiceImpl implements MM3_33_AService{
	@Autowired private MM3_33_ADAO dao;

	@Override
	public List<MM3_33_AVO> List(MM3_33_AVO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public MM3_33_AVO sum(MM3_33_AVO vo) throws Exception {
		return dao.sum(vo);
	}
}
