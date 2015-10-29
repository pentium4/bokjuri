package lionsclubs.com.MM2.MM2_1.MM2_08;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_08DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_08.";
	
	@SuppressWarnings("unchecked")
	public List<MM2_08VO> memberList(MM2_08VO vo){
		return list(commonId + "memberList", vo);
	}
}
