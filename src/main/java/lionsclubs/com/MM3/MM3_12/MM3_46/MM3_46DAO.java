package lionsclubs.com.MM3.MM3_12.MM3_46;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_46DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_46.";

	public Page MM3_46(MM3_46VO vo) throws Exception {
		return listWithPaging(commonId + "MM3_46", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_46VO> listExcelDownload(MM3_46VO vo) throws Exception {
		return list(commonId + "listExcelDownload", vo);
	}
	
	public MM3_46VO sum(MM3_46VO vo) throws Exception {
		return (MM3_46VO) selectByPk(commonId + "sum", vo);
	}	
	
	public MM3_46VO objectImpost(MM3_46VO vo) throws Exception {
		return (MM3_46VO) selectByPk(commonId + "objectImpost", vo);
	}

	public MM3_46VO objectPayment(MM3_46VO vo) throws Exception {
		return (MM3_46VO) selectByPk(commonId + "objectPayment", vo);
	}
	
	public Boolean insertPayment(MM3_46VO vo) throws Exception {
		insert(commonId + "insertPayment", vo);
		return Boolean.TRUE;
	}
	
	public Integer updatePayment(MM3_46VO vo) throws Exception {
		return update(commonId + "updatePayment", vo);
	}
	
	public Integer deletePayment(MM3_46VO vo) throws Exception {
		return delete(commonId + "deletePayment", vo);
	}	

	public Integer sumPayment(MM3_46VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "sumPayment", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM3_46VO> listPayment(MM3_46VO vo) throws Exception {
		return list(commonId + "listPayment", vo);
	}

	public MM3_46VO objectTreasurer(MM3_46VO vo) throws Exception {
		return (MM3_46VO) selectByPk(commonId + "objectTreasurer", vo);
	}
}
