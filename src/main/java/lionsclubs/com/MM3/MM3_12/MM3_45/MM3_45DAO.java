package lionsclubs.com.MM3.MM3_12.MM3_45;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_45DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_45.";
	
	public Page MM3_45(MM3_45VO vo) throws Exception {
		return listWithPaging(commonId + "MM3_45", vo);
	}
	
	public MM3_45VO sum(MM3_45VO vo) throws Exception {
		return (MM3_45VO) selectByPk(commonId + "sum", vo);
	}
	
	public MM3_45VO objectImpost(MM3_45VO vo) throws Exception {
		return (MM3_45VO) selectByPk(commonId + "objectImpost", vo);
	}
	
	public Boolean insertImpost(MM3_45VO vo) throws Exception {
		insert(commonId + "insertImpost", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateImpost(MM3_45VO vo) throws Exception {
		return update(commonId + "updateImpost", vo);
	}

	public Integer deletePayment(MM3_45VO vo) throws Exception {
		return delete(commonId + "deletePayment", vo);
	}

	public Integer deleteImpost(MM3_45VO vo) throws Exception {
		return delete(commonId + "deleteImpost", vo);
	}
	
	public String dollarKind(MM3_45VO vo) throws Exception {
		return (String) selectByPk(commonId + "dollarKind", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM3_45VO> listExcelImpost(MM3_45VO vo) throws Exception {
		return list(commonId + "listExcelImpost", vo);
	}
	
	public Integer deleteOrganCodeImpost(MM3_45VO vo) throws Exception {
		return delete(commonId + "deleteOrganCodeImpost", vo);
	}
	
	public Integer deleteOrganCodePaymnet(MM3_45VO vo) throws Exception {
		return delete(commonId + "deleteOrganCodePaymnet", vo);
	}	
}
