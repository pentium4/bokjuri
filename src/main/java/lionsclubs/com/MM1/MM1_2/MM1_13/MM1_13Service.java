package lionsclubs.com.MM1.MM1_2.MM1_13;

import java.util.List;

public interface MM1_13Service {
	public List<MM1_13VO> List(MM1_13VO vo) throws Exception;
	public MM1_13VO Select(MM1_13VO vo) throws Exception;
	public String SelectOrganCode(MM1_13VO vo) throws Exception;	
	public String SelectPositionCode(MM1_13VO vo) throws Exception;
	public String Insert(MM1_13VO vo) throws Exception;	
	public String Update(MM1_13VO vo) throws Exception;
	public String Delete(MM1_13VO vo) throws Exception;
	
	/*
	 * 지구관리 > 임원선임/분담금 
	 */
	public String Check2(MM1_13VO vo) throws Exception;
	public String Insert2(MM1_13VO vo) throws Exception;	
	public String Delete2(MM1_13VO vo) throws Exception;
	public String Update2(MM1_13VO vo) throws Exception;
	
	/*
	 * 납부금
	 */
	public String InsertPayment(MM1_13VO vo) throws Exception;
	public String UpdatePayment(MM1_13VO vo) throws Exception;
	public String DeletePayment(MM1_13VO vo) throws Exception;
}
