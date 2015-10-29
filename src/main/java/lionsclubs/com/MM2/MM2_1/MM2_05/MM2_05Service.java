package lionsclubs.com.MM2.MM2_1.MM2_05;

import java.util.List;

public interface MM2_05Service {

	public MM2_05VO MM2_05(MM2_05VO vo) throws Exception;

	public List<MM2_05VO> List(MM2_05VO vo) throws Exception;

	public void awardInsert(MM2_05VO vo) throws Exception;
	
	public Integer awardUpdate(MM2_05VO vo) throws Exception;
	
	public Integer awardDelete(MM2_05VO vo) throws Exception;
}
