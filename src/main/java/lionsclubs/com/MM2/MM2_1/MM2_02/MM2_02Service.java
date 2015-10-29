package lionsclubs.com.MM2.MM2_1.MM2_02;

import lionsclubs.com.cmm.pagging.Page;

public interface MM2_02Service {

	public Integer selectMM2_02TotalCount(MM2_02VO vo) throws Exception;
	
	public Page List(MM2_02VO vo) throws Exception;

	public MM2_02VO Select(MM2_02VO vo) throws Exception;
		
	public void Insert(MM2_02VO vo) throws Exception;
	
	public Integer Update(MM2_02VO vo) throws Exception;
	
	public Integer Delete(MM2_02VO vo) throws Exception;

}
