package lionsclubs.com.MM1.MM1_1.MM1_05;

import lionsclubs.com.cmm.pagging.Page;

public interface MM1_05Service {
	
	public Page List(MM1_05VO vo) throws Exception;
	
	/**
	 * 행사총 인원/시간/점수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_05VO total(MM1_05VO vo) throws Exception;
	
	public MM1_05VO Select(MM1_05VO vo) throws Exception;
	
	public void Insert(MM1_05VO vo) throws Exception;
	
	public Integer Update(MM1_05VO vo) throws Exception;
	
	public Integer Delete(MM1_05VO vo) throws Exception;
	
}
