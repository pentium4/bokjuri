package lionsclubs.com.MM3.MM3_2.MM3_06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_06ServiceImpl extends AbstractServiceImpl implements MM3_06Service{
	
	@Autowired
	private MM3_06DAO dao;
}
