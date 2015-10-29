package lionsclubs.com.MM1.MM1_1.MM1_06;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_06ServiceImpl extends AbstractServiceImpl implements MM1_06Service{
	
	@Autowired
	private MM1_06DAO dao;

	@Override
	public Page selectList(MM1_06VO vo) throws Exception {
		return dao.selectList(vo);
	}
}
