package lionsclubs.com.MM3.MM3_4.MM3_24;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_24DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_24.";
	
	/**
	 * 환율 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	public List<MM3_24VO> List(MM3_24VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public void Insert(MM3_24VO vo) throws Exception {
		update(commonId + "Insert", vo);
    }
	
	public void Update(MM3_24VO vo) throws Exception {
		update(commonId + "Update", vo);
    }
	
	public Integer Delete(MM3_24VO vo) throws Exception {
		return delete(commonId + "Delete", vo);
    }
	
	public Integer objectRates(String yyyymm) throws Exception {
		return (Integer) selectByPk(commonId + "objectRates", yyyymm);
	}
}
