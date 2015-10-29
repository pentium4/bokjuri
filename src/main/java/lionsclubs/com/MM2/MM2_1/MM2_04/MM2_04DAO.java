package lionsclubs.com.MM2.MM2_1.MM2_04;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_04DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_04.";

	public MM2_04VO MM2_04(MM2_04VO vo){
		return (MM2_04VO)selectByPk(commonId + "MM2_04", vo);
	}

	
	@SuppressWarnings("unchecked")
	public List<MM2_04VO> List(MM2_04VO vo) throws Exception {
		return list(commonId + "List", vo); 
    }
}
