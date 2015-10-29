package lionsclubs.com.MM2.MM2_4.MM2_28;

import java.util.List;
import java.util.Map;

public interface MM2_28Service {
	public List<Map<String, Object>> selectIncomeHead(MM2_28VO vo) throws Exception;

	public List<Map<String, Object>> selectIncome(MM2_28VO vo) throws Exception;
	
	public Map<String, Object> selectIncomeSum(MM2_28VO vo) throws Exception;

	public List<Map<String, Object>> selectDefectHead(MM2_28VO vo) throws Exception;

	public List<Map<String, Object>> selectDefect(MM2_28VO vo) throws Exception;
	
	public Map<String, Object> selectDefectSum(MM2_28VO vo) throws Exception;
	
	public List<Map<String, Object>> selectDebtHead(MM2_28VO vo) throws Exception;

	public List<Map<String, Object>> selectDebt(MM2_28VO vo) throws Exception;
	
	public Map<String, Object> selectDebtSum(MM2_28VO vo) throws Exception;
}
