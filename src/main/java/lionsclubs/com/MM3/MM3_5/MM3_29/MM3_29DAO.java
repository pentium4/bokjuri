package lionsclubs.com.MM3.MM3_5.MM3_29;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_29DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_5.MM3_29.";
	
	public MM3_29VO MM3_29(MM3_29VO vo){
		return (MM3_29VO)selectByPk(commonId + "MM3_29", vo);
	}
	
	public Page List(MM3_29VO vo) throws Exception {
		return listWithPaging(commonId + "List", vo);
    } 
}
