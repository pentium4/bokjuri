package lionsclubs.com.MM1.MM1_1.MM1_02;

import lionsclubs.com.cmm.pagging.Page;

public interface MM1_02Service {

	public Page List(MM1_02VO vo) throws Exception;
	public MM1_02VO Select(MM1_02VO vo) throws Exception;
	public void Insert(MM1_02VO vo) throws Exception;
	public Integer Update(MM1_02VO vo) throws Exception;
	public Integer Delete(MM1_02VO vo) throws Exception;
}
