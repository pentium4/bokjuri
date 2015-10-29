package lionsclubs.com.SM1.SM1_1.SM1_01;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository
public class SM1_01DAO extends EgovAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_1.SM1_01.";
	
	/**
	 * test
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<SM1_01VO> selectList(SM1_01VO vo) throws Exception {
        return list(commonId + "selectList", vo);
    }
    
	public Integer selectListTotalCount(SM1_01VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "selectListTotalCount", vo);
	} 
}
