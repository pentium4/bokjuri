package lionsclubs.com.MM1.MM1_3.MM1_16;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_16DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_3.MM1_16.";

	@SuppressWarnings("unchecked")
	public List<MM1_16VO> MM1_16(MM1_16VO vo) throws Exception {
		return list(commonId + "MM1_16", vo);
	}
	
	public MM1_16VO objectMoveinMember(MM1_16VO vo) throws Exception {
		return (MM1_16VO) selectByPk(commonId + "objectMoveinMember", vo);
	}
	
	public MM1_16VO moveinMember(MM1_16VO vo) throws Exception {
		return (MM1_16VO) selectByPk(commonId + "moveinMember", vo);
	}

	public boolean insertMoveinMember(MM1_16VO vo) throws Exception {
		insert(commonId + "insertMoveinMember", vo);
		return true;
	}
	
	public Integer deleteMoveinMember(Object list) {
		return batchInsert(commonId + "deleteMoveinMember", list);
	}	

	/**
	 * 처리되지 않은 전입대상 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer checkMoveinMember(MM1_16VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "checkMoveinMember", vo);
	}
	
	public Integer updateApprove(MM1_16VO vo) throws Exception {
		return update(commonId + "updateApprove", vo);
	}
	
	public Integer updateTreatment(MM1_16VO vo) throws Exception {
		return update(commonId + "updateTreatment", vo);
	}
	
	/**
	 * 승인이 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countApproveCheck(MM1_16VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countApproveCheck", vo);
	}
	
	/**
	 * 처리가 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countTreatmentCheck(MM1_16VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countTreatmentCheck", vo);
	}
	
	/**
	 * 전입 회원 선임
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertAppointment(MM1_16VO vo) throws Exception {
		return (String) insert(commonId + "insertAppointment", vo);
	}

	/**
	 * 전입 회원 선임 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteAppointment(MM1_16VO vo) throws Exception {
		return delete(commonId + "deleteAppointment", vo);
	}
	
	/**
	 * 퇴회날짜 이후에 선임이 있는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countAppointmentCheck(MM1_16VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countAppointmentCheck", vo);
	}
	
	/**
	 * 납부금 입력 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countPaymentCheck(MM1_16VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countPaymentCheck", vo);
	}
}
