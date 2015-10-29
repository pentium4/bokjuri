package lionsclubs.com.MM1.MM1_3.MM1_17;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_17DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_3.MM1_17.";

	@SuppressWarnings("unchecked")
	public List<MM1_17VO> MM1_17(MM1_17VO vo) throws Exception {
		return list(commonId + "MM1_17", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM1_17VO> listReinductMember(MM1_17VO vo) throws Exception {
		return list(commonId + "listReinductMember", vo);
	}
	
	public MM1_17VO objectReinductMember(MM1_17VO vo) throws Exception {
		return (MM1_17VO) selectByPk(commonId + "objectReinductMember", vo);
	}
	
	public MM1_17VO reinductMember(MM1_17VO vo) throws Exception{
		return (MM1_17VO) selectByPk(commonId + "listReinductMember", vo);
	}
	
	public Integer insertReinductMember(Object list) throws Exception{
		return batchInsert(commonId + "insertReinductMember", list);
	}	

	public Integer deleteReinductMember(Object list) throws Exception {
		return batchInsert(commonId + "deleteReinductMember", list);
	}

	public Integer checkReinductMember(MM1_17VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "checkReinductMember", vo);
	}
	
	public Integer updateApprove(MM1_17VO vo) throws Exception {
		return update(commonId + "updateApprove", vo);
	}
	
	public Integer updateTreatment(MM1_17VO vo) throws Exception {
		return update(commonId + "updateTreatment", vo);
	}
	
	/**
	 * 승인이 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countApproveCheck(MM1_17VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countApproveCheck", vo);
	}
	
	/**
	 * 처리가 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countTreatmentCheck(MM1_17VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countTreatmentCheck", vo);
	}
	
	/**
	 * 재입 회원 선임
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean insertAppointment(MM1_17VO vo) throws Exception {
		insert(commonId + "insertAppointment", vo);
		return true;
	}

	/**
	 * 재입 회원 선임 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteAppointment(MM1_17VO vo) throws Exception {
		return delete(commonId + "deleteAppointment", vo);
	}
	
	/**
	 * 퇴회날짜 이후에 선임이 있는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countAppointmentCheck(MM1_17VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countAppointmentCheck", vo);
	}
	
	/**
	 * 납부금 입력 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countPaymentCheck(MM1_17VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countPaymentCheck", vo);
	}	
}
