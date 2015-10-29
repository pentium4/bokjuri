package lionsclubs.com.MM3.MM3_2.MM3_07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_07ServiceImpl extends AbstractServiceImpl implements MM3_07Service{
	
	@Autowired
	private MM3_07DAO dao;
}
