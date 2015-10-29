package lionsclubs.com.MM3.MM3_2.MM3_08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_08ServiceImpl extends AbstractServiceImpl implements MM3_08Service{
	
	@Autowired
	private MM3_08DAO dao;
}
