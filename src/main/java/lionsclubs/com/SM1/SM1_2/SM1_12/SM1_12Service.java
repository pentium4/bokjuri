package lionsclubs.com.SM1.SM1_2.SM1_12;

import java.util.List;

public interface SM1_12Service {
	public List<SM1_12VO_DATA> selectList(SM1_12VO vo) throws Exception;
	public int insertList(SM1_12VO vo) throws Exception;
	public int updateList(SM1_12VO vo) throws Exception;
	public int deleteList(SM1_12VO vo) throws Exception;
	public int reorderList(SM1_12VO vo) throws Exception;
}
