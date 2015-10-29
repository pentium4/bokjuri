package lionsclubs.com.MM1.MM1_3.MM1_18;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_18DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_3.MM1_18.";

	/**
	 * 신입/퇴회/전입/재입 미처리 카운트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_18VO countNotTreatment(MM1_18VO vo) throws Exception {
		return (MM1_18VO) selectByPk(commonId + "countNotTreatment", vo);
	}	
	
	/**
	 * 경력(선임/위촉) 백업 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteAppointmentBak(MM1_18VO vo) throws Exception {
		return delete(commonId + "deleteAppointmentBak", vo);
	}
	
	/**
	 * 경력(선임/위촉) 백업
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean insertAppointmentBak(MM1_18VO vo) throws Exception {
		insert(commonId + "insertAppointmentBak", vo);
		return true;
	}
	
	/**
	 * 경력(선임/위촉) 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteAppointment(MM1_18VO vo) throws Exception {
		return delete(commonId + "deleteAppointment", vo);
	}
	
	/**
	 * 경력(선임/위촉) 복구
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean insertAppointment(MM1_18VO vo) throws Exception {
		insert(commonId + "insertAppointment", vo);
		return true;
	}
}
