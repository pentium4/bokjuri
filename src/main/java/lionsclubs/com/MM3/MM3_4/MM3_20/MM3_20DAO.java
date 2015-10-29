package lionsclubs.com.MM3.MM3_4.MM3_20;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lionsclubs.com.MM3.MM3_4.MM3_20.CODE_ADD_INFO;
import lionsclubs.com.MM3.MM3_4.MM3_20.MM3_20VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_20DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_20.";
	

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(MM3_20VO vo) throws Exception {
		return (List<Map<String, Object>>) list(commonId + "selectList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<CODE_ADD_INFO> getCodeList(MM3_20VO vo) throws Exception{
		return (List<CODE_ADD_INFO>)list(commonId + "codeList", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_20VO> excelTemplateDownload(MM3_20VO vo) {
		return list(commonId + "excelTemplateDownload", vo);
	}
	
	public Integer expensesDelete(MM3_20VO vo) throws Exception {
		return delete(commonId + "expensesDelete", vo);
	}
	
	public Integer expensesDelete2(MM3_20VO vo) throws Exception {
		return delete(commonId + "expensesDelete2", vo);
	}
	
	public boolean expensesInsert(MM3_20VO vo) throws Exception {
		insert(commonId + "expensesInsert", vo);
		return true;
	}
	
	public boolean expensesInsert2(MM3_20VO vo) throws Exception {
		insert(commonId + "expensesInsert2", vo);
		return true;
	}
	
	public int currentIdnNo(MM3_20VO vo) throws Exception{
		return (Integer) selectByPk(commonId + "currentIdnNo", vo);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSum(MM3_20VO vo) throws Exception {
		Map<String, Object> result = (Map<String, Object>) this.selectByPk(commonId + "selectSum", vo);
		if(result == null) {
			result = new HashMap<String, Object>();
			result.put("newComer", 0);
			result.put("totSum", 0);
			for(int i = 0; i < vo.getCodeList().size(); i++) result.put(vo.getCodeList().get(i).getCode(), 0);
		}
		return result;
	}
	
}
