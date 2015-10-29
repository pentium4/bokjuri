package lionsclubs.com.MM1.MM1_2.MM1_10;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_10ServiceImpl extends AbstractServiceImpl implements MM1_10Service{
	@Autowired private MM1_10DAO dao;

	@Override
	public List<MM1_10VO> MM1_10(MM1_10VO vo) throws Exception {
		return dao.MM1_10(vo);
	}
}
