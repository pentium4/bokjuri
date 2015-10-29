package lionsclubs.com.MM1.MM1_3.MM1_14;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_14DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_3.MM1_14.";

	public MM1_14VO MM1_14(MM1_14VO vo) throws Exception {
		return (MM1_14VO)selectByPk(commonId + "MM1_14", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM1_14VO> listNewMember(MM1_14VO vo) throws Exception {
		return list(commonId + "listNewMember", vo);
	}
	
	public String insertProfile(MM1_14VO vo) throws Exception {
		return (String)insert(commonId + "insertProfile", vo);
	}
	
	public Integer updateProfile(MM1_14VO vo) throws Exception {
		return update(commonId + "updateProfile", vo);
	}
	public MM1_14VO registerNo(MM1_14VO vo) throws Exception {
		return (MM1_14VO)selectByPk(commonId + "registerNo", vo);
	}

	public Page listRegister(MM1_14VO vo) throws Exception {
		return listWithPaging(commonId + "listRegister", vo);
	}
	
	/**
	 * 인사기본 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer hrUpdate(MM1_14VO vo) throws Exception {
		return update(commonId + "hrUpdate", vo);
	}
	
	public Integer delete(MM1_14VO vo) throws Exception {
		return delete(commonId + "delete", vo);
	}

	public Integer updateApprove(MM1_14VO vo) throws Exception {
		return update(commonId + "updateApprove", vo);
	}
	
	public Integer updateTreatment(MM1_14VO vo) throws Exception {
		return update(commonId + "updateTreatment", vo);
	}
	
	/**
	 * 승인이 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countApproveCheck(MM1_14VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countApproveCheck", vo);
	}
	
	/**
	 * 처리가 되었는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countTreatmentCheck(MM1_14VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countTreatmentCheck", vo);
	}
	
	/**
	 * 신입회원 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean insertMemberInfo(MM1_14VO vo) throws Exception {
		insert(commonId + "insertMemberInfo", vo);
		return true;
	}
	
	/**
	 * 신입회원 입회 선임
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean insertAppointment(MM1_14VO vo) throws Exception {
		insert(commonId + "insertAppointment", vo);
		return true;
	}

	/**
	 * 패스워드 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateMemberInfoPassword(MM1_14VO vo) throws Exception {
		return update(commonId + "updateMemberInfoPassword", vo);
	}
	
	/**
	 * 모든회원번호 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteMemberAll(MM1_14VO vo) throws Exception {
		return (String) selectByPk(commonId + "deleteMemberAll", vo);
	}

	/**
	 * 입회날짜 이후에 선임이 있는지 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countAppointmentCheck(MM1_14VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countAppointmentCheck", vo);
	}	
	
	/**
	 * 납부금 입력 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer countPaymentCheck(MM1_14VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "countPaymentCheck", vo);
	}
}
