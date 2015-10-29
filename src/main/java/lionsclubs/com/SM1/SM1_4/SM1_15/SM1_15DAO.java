package lionsclubs.com.SM1.SM1_4.SM1_15;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_15DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.SM1.SM1_4.SM1_15.";
	
	@SuppressWarnings("unchecked")
	public List<SM1_15VO> SM1_15(SM1_15VO vo) throws Exception {
        return list(commonId + "SM1_15", vo);
    }
	
	public Integer updateCalculateConfirm(SM1_15VO vo) throws Exception {
		return update(commonId + "updateCalculateConfirm", vo);
	}
	
	public SM1_15VO objectPrevCalculate(SM1_15VO vo) throws Exception {
		return (SM1_15VO) selectByPk(commonId + "objectPrevCalculate", vo);
	}

	public SM1_15VO objectNextCalculate(SM1_15VO vo) throws Exception {
		return (SM1_15VO) selectByPk(commonId + "objectNextCalculate", vo);
	}

	public Integer updateCalculateConfirmCancel(SM1_15VO vo) throws Exception {
		return update(commonId + "updateCalculateConfirmCancel", vo);
	}	

	public Integer updateCalculateConfirmLock(SM1_15VO vo) throws Exception {
		return update(commonId + "updateCalculateConfirmLock", vo);
	}	

	public Integer updateCalculateConfirmLockCancel(SM1_15VO vo) throws Exception {
		return update(commonId + "updateCalculateConfirmLockCancel", vo);
	}	
}
