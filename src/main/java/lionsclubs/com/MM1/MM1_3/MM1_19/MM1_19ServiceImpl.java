package lionsclubs.com.MM1.MM1_3.MM1_19;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_19ServiceImpl extends AbstractServiceImpl implements MM1_19Service{

	@Autowired private MM1_19DAO dao;

	@Override
	public List<MM1_19VO> MM1_19(MM1_19VO vo) throws Exception {
		return dao.MM1_19(vo);
	}
}
