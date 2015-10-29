package lionsclubs.com.MM2.MM2_3.MM2_22;

import java.util.List;

import lionsclubs.com.MM2.MM2_3.MM2_22.MM2_22VO;

public interface MM2_22Service {
	public List<MM2_22VO_DATA> selectList(MM2_22VO vo) throws Exception ;
	
	public MM2_22VO_DATA selectSum(MM2_22VO vo) throws Exception ;
}
