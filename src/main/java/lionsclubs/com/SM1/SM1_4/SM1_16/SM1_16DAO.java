package lionsclubs.com.SM1.SM1_4.SM1_16;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_16DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.SM1.SM1_4.SM1_16.";
	
	@SuppressWarnings("unchecked")
	public List<SM1_16VO> SM1_16(SM1_16VO vo) throws Exception {
        return list(commonId + "SM1_16", vo);
    }	

	public String birth(SM1_16VO vo) throws Exception {
		return (String) selectByPk(commonId + "birth", vo);
	}
	
	public Integer updatePassword(SM1_16VO vo) throws Exception {
		return update(commonId + "updatePassword", vo);
	}
}
