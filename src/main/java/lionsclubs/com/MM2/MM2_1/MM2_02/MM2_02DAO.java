package lionsclubs.com.MM2.MM2_1.MM2_02;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_02DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_1.MM2_02.";
	
	/*public Page selectMM2_02(MM2_02VO vo) throws Exception {
        return listWithPaging(commonId + "selectMM2_02", vo);
    }*/
    public Page List(MM2_02VO vo)throws Exception {
    	return listWithPaging(commonId + "List", vo);
    }
    public MM2_02VO Select(MM2_02VO vo){
		return (MM2_02VO)selectByPk(commonId + "Select", vo);
    }
	public Integer selectMM2_02TotalCount(MM2_02VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "selectMM2_02TotalCount", vo);
	}
	
	public void Insert(MM2_02VO vo){
		insert(commonId + "Insert", vo);
    }
	
	public Integer Update(MM2_02VO vo){
		return update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM2_02VO vo){
		return delete(commonId + "Delete", vo);
    }
}
