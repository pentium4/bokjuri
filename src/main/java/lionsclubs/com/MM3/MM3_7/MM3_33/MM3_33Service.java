package lionsclubs.com.MM3.MM3_7.MM3_33;

import java.util.List;

public interface MM3_33Service {
	public List<MM3_33VO_DATA> selectList(MM3_33VO vo) throws Exception;
	public MM3_33VO_DATA selectOrgan(String memberNo) throws Exception;
	public int insertList(MM3_33VO vo) throws Exception;
	public int updateList(MM3_33VO vo) throws Exception;
	public int deleteList(MM3_33VO vo) throws Exception;

	/**
	 * 발령적용
	 */
	public String insertPerson(MM3_33VO vo) throws Exception;
}
