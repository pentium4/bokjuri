package lionsclubs.com.MM3.MM3_12.MM3_49;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_49DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_49.";
	
	public Page MM3_49(MM3_49VO vo) throws Exception {
		return listWithPaging(commonId + "MM3_49", vo);
    }
	
	public MM3_49VO total(MM3_49VO vo) throws Exception {
		return (MM3_49VO)selectByPk(commonId + "total", vo);
    }	
	
	@SuppressWarnings("unchecked")
	public List<MM3_49VO> listImpost(MM3_49VO vo) throws Exception {
		return list(commonId + "listImpost", vo);
    }
	
	public MM3_49VO objectImpost(MM3_49VO vo) throws Exception {
		return (MM3_49VO)selectByPk(commonId + "objectImpost", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM3_49VO> listPayment(MM3_49VO vo) throws Exception {
		return list(commonId + "listPayment", vo);
    }	
}
