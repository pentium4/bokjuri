package lionsclubs.com.MM3.MM3_8.MM3_35;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_35ServiceImpl extends AbstractServiceImpl implements MM3_35Service{
	
	@Autowired
	private MM3_35DAO dao;
}
