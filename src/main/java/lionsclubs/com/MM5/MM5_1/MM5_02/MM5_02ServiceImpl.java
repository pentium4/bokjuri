package lionsclubs.com.MM5.MM5_1.MM5_02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM5_02ServiceImpl extends AbstractServiceImpl implements MM5_02Service{
	
	@Autowired
	private MM5_02DAO dao;
}
