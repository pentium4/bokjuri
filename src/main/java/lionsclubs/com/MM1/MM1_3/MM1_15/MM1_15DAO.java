package lionsclubs.com.MM1.MM1_3.MM1_15;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_15DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_3.MM1_15.";

	@SuppressWarnings("unchecked")
	public List<MM1_15VO> MM1_15(MM1_15VO vo) {
		return list(commonId + "MM1_15", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM1_15VO> listRetireMember(MM1_15VO vo) throws Exception{
		return list(commonId + "listRetireMember", vo);
	}
	
	public MM1_15VO objectRetireMember(MM1_15VO vo) throws Exception{
		return (MM1_15VO) selectByPk(commonId + "objectRetireMember", vo);
	}	

	public MM1_15VO retireMember(MM1_15VO vo) throws Exception{
		return (MM1_15VO) selectByPk(commonId + "listRetireMember", vo);
	}
	
	public Integer insertRetireMember(Object list) throws Exception{
		return batchInsert(commonId + "insertRetireMember", list);
	}
	
	/**
	 * 처리되지 않은 퇴회대상 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer checkRetireMember(MM1_15VO vo) throws Exception{
		return (Integer) selectByPk(commonId + "checkRetireMember", vo);
	}

	/**
	 * 퇴회회원 삭제
	 * @param list
	 * @return
	 */
	public Integer deleteRetireMember(Object list) {
		return batchInsert(commonId + "deleteRetireMember", list);
	}
	
	public Integer updateApprove(MM1_15VO vo) throws Exception {
		return update(commonId + "updateApprove", vo);
	}
	
	public Integer updateTreatment(MM1_15VO vo) throws Exception {
		return update(commonId + "updateTreatment", vo);
	}
	
	/**
	 * 승인이 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countApproveCheck(MM1_15VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countApproveCheck", vo);
	}
	
	/**
	 * 처리가 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countTreatmentCheck(MM1_15VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countTreatmentCheck", vo);
	}
	
	/**
	 * 퇴회회원 선임
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertAppointment(MM1_15VO vo) throws Exception {
		return (String)insert(commonId + "insertAppointment", vo);
	}

	/**
	 * 퇴회회원 선임 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteAppointment(MM1_15VO vo) throws Exception {
		return delete(commonId + "deleteAppointment", vo);
	}
	
	/**
	 * 퇴회날짜 이후에 선임이 있는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countAppointmentCheck(MM1_15VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countAppointmentCheck", vo);
	}	
}
