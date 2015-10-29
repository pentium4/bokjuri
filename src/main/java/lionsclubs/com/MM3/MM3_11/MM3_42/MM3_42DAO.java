package lionsclubs.com.MM3.MM3_11.MM3_42;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_42DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_11.MM3_42.";

	@SuppressWarnings("unchecked")
	public List<MM3_42VO> MM3_42(MM3_42VO vo) throws Exception {
		return list(commonId + "MM3_42", vo);
	}
	
	public MM3_42VO amountSum(MM3_42VO vo) throws Exception {
		return (MM3_42VO) selectByPk(commonId + "amountSum", vo);
	}

	public MM3_42VO objectDistrictCalculate(MM3_42VO vo) throws Exception {
		return (MM3_42VO) selectByPk(commonId + "objectDistrictCalculate", vo);
	}
	
	public Integer saveDistrictCalculateConfirm(MM3_42VO vo) throws Exception {
		return update(commonId + "saveDistrictCalculateConfirm", vo);
	}

	public Integer updateDistrictCalculateConfirmCancel(MM3_42VO vo) throws Exception {
		return update(commonId + "updateDistrictCalculateConfirmCancel", vo);
	}

	public Integer updateDistrictCalculateConfirmLock(MM3_42VO vo) throws Exception {
		return update(commonId + "updateDistrictCalculateConfirmLock", vo);
	}

	public Integer updateDistrictCalculateConfirmLockCancel(MM3_42VO vo) throws Exception {
		return update(commonId + "updateDistrictCalculateConfirmLockCancel", vo);
	}
}
