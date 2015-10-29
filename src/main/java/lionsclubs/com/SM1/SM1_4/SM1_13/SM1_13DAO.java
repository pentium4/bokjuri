package lionsclubs.com.SM1.SM1_4.SM1_13;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_13DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.SM1.SM1_4.SM1_13.";
	
	@SuppressWarnings("unchecked")
	public List<SM1_13VO> SM1_13(SM1_13VO vo) throws Exception {
        return list(commonId + "SM1_13", vo);
    }	
}
