package lionsclubs.com.MM3.MM3_4.MM3_24;

import java.util.List;

public interface MM3_24Service {
	
	public List<MM3_24VO> List(MM3_24VO vo) throws Exception;
	
	public void Insert(MM3_24VO vo) throws Exception;
	
	public void Update(MM3_24VO vo) throws Exception;
	
	/**
	 * 년월을 입력하여 환율정보를 가져온다.
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer objectRates(String yyyymm) throws Exception;
}
