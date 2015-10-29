package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.util.List;

public interface SM1_10Service {
	public List<SM1_10VO_DATA> selectList(SM1_10VO vo) throws Exception;
	public int insertList(SM1_10VO vo) throws Exception;
	public int updateList(SM1_10VO vo) throws Exception;
	public int deleteList(SM1_10VO vo) throws Exception;
	public int fileInfoUpload(SM1_10VO_FILE vo) throws Exception;
	public int reorderList(SM1_10VO vo) throws Exception;
}
