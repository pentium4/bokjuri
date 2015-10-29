package lionsclubs.com.MM1.MM1_2.MM1_12;

import java.util.List;

public interface MM1_12Service {
	public List<MM1_12VO> List(MM1_12VO vo) throws Exception;
	public MM1_12VO Select(MM1_12VO vo) throws Exception;
	public String SelectOrganCode(MM1_12VO vo) throws Exception;	
	public String Insert(MM1_12VO vo) throws Exception;	
	public String Update(MM1_12VO vo) throws Exception;
	public String Delete(MM1_12VO vo) throws Exception;
	
	/*
	 * 납부금
	 */
	public String InsertPayment(MM1_12VO vo) throws Exception;	
	public String UpdatePayment(MM1_12VO vo) throws Exception;	
	public String DeletePayment(MM1_12VO vo) throws Exception;	
}
