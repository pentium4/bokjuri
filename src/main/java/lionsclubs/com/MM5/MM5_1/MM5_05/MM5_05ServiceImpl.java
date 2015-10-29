package lionsclubs.com.MM5.MM5_1.MM5_05;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM5_05ServiceImpl extends AbstractServiceImpl implements MM5_05Service{
	
	@Autowired
	private MM5_05DAO dao;
}
