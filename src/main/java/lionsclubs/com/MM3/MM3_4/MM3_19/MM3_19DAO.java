package lionsclubs.com.MM3.MM3_4.MM3_19;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_19DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_19.";

	@SuppressWarnings("unchecked")
	public List<CODE_INFO> getCodeList(MM3_19VO vo) throws Exception{
		return (List<CODE_INFO>)list(commonId + "codeList", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(MM3_19VO vo) throws Exception {
		return (List<Map<String, Object>>) list(commonId + "selectList", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_19VO> excelTemplateDownload(MM3_19VO vo) throws Exception {
		return list(commonId + "excelTemplateDownload", vo);
	}
	
	public Integer expensesDelete(MM3_19VO vo) throws Exception {
		return delete(commonId + "expensesDelete", vo);
	}
	
	public Integer expensesDelete2(MM3_19VO vo) throws Exception {
		return delete(commonId + "expensesDelete2", vo);
	}
	
	public Integer expensesInsert(MM3_19VO vo) throws Exception {
		insert(commonId + "expensesInsert", vo);
		return vo.getIdnNo();
	}
	
	public boolean expensesInsert2(MM3_19VO vo) throws Exception {
		insert(commonId + "expensesInsert2", vo);
		return true;
	}
	
}
