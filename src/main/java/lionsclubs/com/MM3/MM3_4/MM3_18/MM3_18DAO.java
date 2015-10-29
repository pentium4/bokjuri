package lionsclubs.com.MM3.MM3_4.MM3_18;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_18DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_18.";

	/**
	 * 입주클럽관리비 부과
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<MM3_18VO> selectList(MM3_18VO vo) {
		return list(commonId + "selectList", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_18VO> excelTemplateDownload(MM3_18VO vo) {
		return list(commonId + "excelTemplateDownload", vo);
	}
	
	public Integer expensesDelete(MM3_18VO vo) {
		return delete(commonId + "expensesDelete", vo);
	}
	
	public boolean expensesInsert(MM3_18VO vo) {
		insert(commonId + "expensesInsert", vo);
		return true;
	}
	
	public MM3_18VO expensesSum(MM3_18VO vo) throws Exception {
		return (MM3_18VO) selectByPk(commonId + "expensesSum", vo);
	}
	
}
