package lionsclubs.com.MM3.MM3_5.MM3_27;

import java.util.List;

public interface MM3_27Service {

	public List<MM3_27VO_DATA> selectList(MM3_27VO_PARAM vo) throws Exception;
	
	public String mergeData(MM3_27VO_DATA vo) throws Exception;
	
}
