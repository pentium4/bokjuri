package lionsclubs.com.MM3.MM3_5.MM3_29;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_29ServiceImpl extends AbstractServiceImpl implements MM3_29Service{
	@Autowired private MM3_29DAO dao;

	@Override
	public Page List(MM3_29VO vo) throws Exception {
		return dao.List(vo);
	}
}
