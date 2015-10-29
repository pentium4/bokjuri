package lionsclubs.com.MM5.MM5_1.MM5_01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM5_01ServiceImpl extends AbstractServiceImpl implements MM5_01Service{
	
	@Autowired
	private MM5_01DAO dao;
}
