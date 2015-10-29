package lionsclubs.com.MM3.MM3_6.MM3_30;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_30DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_6.MM3_30.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_30VO> List(MM3_30VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public Integer Update(MM3_30VO vo) throws Exception {
		return update(commonId + "Update", vo);
	}
	
	/**
	 * 지역/지대 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_30VO detail(MM3_30VO vo) throws Exception {
		return (MM3_30VO) selectByPk(commonId + "detail", vo);
	}
}
