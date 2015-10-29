package lionsclubs.com.MM3.MM3_12.MM3_51;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_51DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_12.MM3_51.";

	@SuppressWarnings("unchecked")
	public List<MM3_51VO> listDeposit(MM3_51VO vo) throws Exception {
		return list(commonId + "listDeposit", vo);
	}

	public MM3_51VO objectDeposit(MM3_51VO vo){
		return (MM3_51VO)selectByPk(commonId + "objectDeposit", vo);
	}

	public String insertDeposit(MM3_51VO vo) throws Exception {
		return (String) insert(commonId + "insertDeposit", vo);
	}
	
	public Integer updateDeposit(MM3_51VO vo) throws Exception {
		return update(commonId + "updateDeposit", vo);
	}

	public Integer deleteDeposit(MM3_51VO vo) throws Exception {
		return update(commonId + "deleteDeposit", vo);
	}

	public MM3_51VO sumDeposit(MM3_51VO vo) throws Exception {
		return (MM3_51VO)selectByPk(commonId + "sumDeposit", vo);
	}

	public Integer updateWithDraw(MM3_51VO vo) throws Exception {
		return update(commonId + "updateWithDraw", vo);
	}
	
	public Integer updateWithDrawCancel(MM3_51VO vo) throws Exception {
		return update(commonId + "updateWithDrawCancel", vo);
	}
}
