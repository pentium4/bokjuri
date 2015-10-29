package lionsclubs.com.SM1.SM1_2.SM1_08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_08ServiceImpl extends AbstractServiceImpl implements SM1_08Service{

	@Autowired
	private SM1_08DAO dao;
}
