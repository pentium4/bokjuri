package lionsclubs.com.MM1.MM1_1.MM1_02;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;



@Repository
public class MM1_02DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_02.";
	
	/**
	 * 개인기념일 관리 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	public Page List(MM1_02VO vo) throws Exception {
		return listWithPaging(commonId + "List", vo);
    }
	
	public MM1_02VO Select(MM1_02VO vo) throws Exception {
		return (MM1_02VO)selectByPk(commonId + "Select", vo);
	}
	
	public void Insert(MM1_02VO vo) throws Exception {
		insert(commonId + "Insert", vo);
    }
	
	public Integer Update(MM1_02VO vo) throws Exception {
		return update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM1_02VO vo) throws Exception {
		return delete(commonId + "Delete", vo);
    }
}
