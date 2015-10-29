package lionsclubs.com.MM1.MM1_2.MM1_11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_11ServiceImpl extends AbstractServiceImpl implements MM1_11Service{
	
	@Autowired
	private MM1_11DAO dao;
}
