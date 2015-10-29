package lionsclubs.com.MM3.MM3_5.MM3_28;

import java.util.List;

public interface MM3_28Service {

	public List<MM3_28VO_DATA> selectList(MM3_28VO_PARAM vo) throws Exception;
	
	public Integer mergeData(MM3_28VO_DATA vo) throws Exception;
  
}
