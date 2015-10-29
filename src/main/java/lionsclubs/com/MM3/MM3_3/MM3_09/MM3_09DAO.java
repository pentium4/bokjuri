package lionsclubs.com.MM3.MM3_3.MM3_09;

import java.util.List;

import lionsclubs.com.MM3.MM3_3.MM3_10.MM3_10VO;
import lionsclubs.com.MM3.MM3_3.MM3_10.MM3_10VO_PARAM;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_09DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_3.MM3_09.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_09VO> selectList(MM3_09VO vo) {
		System.out.println("-------------------------");
		System.out.println(vo.getOrgCode());
		System.out.println(vo.getThisYear());
		System.out.println("-------------------------");
		
		
		return (List<MM3_09VO>)list(commonId + "selectList", vo);
	}
}
