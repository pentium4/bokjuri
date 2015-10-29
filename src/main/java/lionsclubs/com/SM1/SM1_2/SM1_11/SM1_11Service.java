package lionsclubs.com.SM1.SM1_2.SM1_11;

import java.util.List;

public interface SM1_11Service {
	public List<SM1_11VO_DATA> selectList(SM1_11VO vo) throws Exception;
	public int insertList(SM1_11VO vo) throws Exception;
	public int updateList(SM1_11VO vo) throws Exception;
	public int deleteList(SM1_11VO vo) throws Exception;
	public int reorderList(SM1_11VO vo) throws Exception;
}
