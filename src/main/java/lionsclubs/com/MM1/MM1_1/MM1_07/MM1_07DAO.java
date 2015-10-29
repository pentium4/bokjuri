package lionsclubs.com.MM1.MM1_1.MM1_07;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_07DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_07.";
	
	/**
	 * 행사출석현황 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_07VO> List(MM1_07VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM1_07VO> ListEvent(MM1_07VO vo) throws Exception {
		return list(commonId + "ListEvent", vo);
    }
	
	public void Insert(MM1_07VO vo){
		update(commonId + "Insert", vo);
    }
	
	public void Update(MM1_07VO vo){
		update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM1_07VO vo){
		return delete(commonId + "Delete", vo);
    }
	
	public Integer DeleteAll(MM1_07VO vo){
		return delete(commonId + "DeleteAll", vo);
    }
}
