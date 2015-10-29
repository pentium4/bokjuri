package lionsclubs.com.MM1.MM1_1.MM1_04;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_04DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_04.";
	
	/**
	 * 경력(교육/상벌) 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_04VO> List(MM1_04VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public MM1_04VO Select(MM1_04VO vo) throws Exception {
		return (MM1_04VO)selectByPk(commonId + "Select", vo);
    }
	
	public void Insert(MM1_04VO vo) throws Exception {
		insert(commonId + "Insert", vo);
    }
	
	public Integer Update(MM1_04VO vo) throws Exception {
		return update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM1_04VO vo) throws Exception {
		return delete(commonId + "Delete", vo);
    }
}
