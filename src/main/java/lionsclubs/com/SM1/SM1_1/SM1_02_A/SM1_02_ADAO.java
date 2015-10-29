package lionsclubs.com.SM1.SM1_1.SM1_02_A;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_02_ADAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_1.SM1_02_A.";
	
	public Page selectList(SM1_02_AVO vo) throws Exception {
		return listWithPaging(commonId + "selectList", vo);
	}
	
	public Page memerSearchList(SM1_02_AVO vo) throws Exception {
		return listWithPaging(commonId + "memerSearchList", vo);
	}	
	
	public void insert(SM1_02_AVO vo) throws Exception {
		insert(commonId + "insert", vo);
	}
	
	public Integer delete(SM1_02_AVO vo) throws Exception {
		return delete(commonId + "delete", vo);
	}
}
