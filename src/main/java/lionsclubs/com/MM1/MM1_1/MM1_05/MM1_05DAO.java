package lionsclubs.com.MM1.MM1_1.MM1_05;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;


@Repository
public class MM1_05DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_05.";
	
	/**
	 * 권한그룹 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	public Page List(MM1_05VO vo) throws Exception {
		return listWithPaging(commonId + "List", vo);
    }

	public MM1_05VO total(MM1_05VO vo) {
		return (MM1_05VO)selectByPk(commonId + "total", vo);
	}
	
	public MM1_05VO Select(MM1_05VO vo){
		return (MM1_05VO)selectByPk(commonId + "Select", vo);
    }
	
	public void Insert(MM1_05VO vo){
		insert(commonId + "Insert", vo);
    }
	
	public Integer Update(MM1_05VO vo){
		return update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM1_05VO vo){
		return delete(commonId + "Delete", vo);
    }
}
