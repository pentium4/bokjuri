package lionsclubs.com.MM5.MM5_1.MM5_04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM5_04ServiceImpl extends AbstractServiceImpl implements MM5_04Service{
	
	@Autowired
	private MM5_04DAO dao;
}
