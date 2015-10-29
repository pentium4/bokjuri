package lionsclubs.com.MM5.MM5_1.MM5_03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM5_03ServiceImpl extends AbstractServiceImpl implements MM5_03Service{
	
	@Autowired
	private MM5_03DAO dao;
}
