package lionsclubs.com.cmm.web.jfile;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class JfileDAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.cmm.web.jfile.";
	
	@SuppressWarnings("unchecked")
	public List<JfileVO> jfileList(JfileVO vo) {
		return list(commonId + "jfileList", vo);
	}
	
}
