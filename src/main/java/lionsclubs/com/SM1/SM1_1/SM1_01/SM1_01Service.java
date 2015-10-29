package lionsclubs.com.SM1.SM1_1.SM1_01;

import java.util.List;


public interface SM1_01Service {

	public List<SM1_01VO> selectList(SM1_01VO vo) throws Exception;
	public Integer selectListTotalCount(SM1_01VO vo) throws Exception;
}
