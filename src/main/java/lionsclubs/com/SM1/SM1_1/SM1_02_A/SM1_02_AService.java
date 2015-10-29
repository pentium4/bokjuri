package lionsclubs.com.SM1.SM1_1.SM1_02_A;

import lionsclubs.com.cmm.pagging.Page;


public interface SM1_02_AService {

	public Page selectList(SM1_02_AVO vo) throws Exception;
	
	public Page memerSearchList(SM1_02_AVO vo) throws Exception;
	
	public void insert(SM1_02_AVO vo) throws Exception;
	
	public void delete(SM1_02_AVO vo) throws Exception;
}
