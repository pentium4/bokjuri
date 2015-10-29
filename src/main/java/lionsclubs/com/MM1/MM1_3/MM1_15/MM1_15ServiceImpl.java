package lionsclubs.com.MM1.MM1_3.MM1_15;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03Service;
import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03VO;
import lionsclubs.com.MM1.MM1_3.MM1_18.MM1_18DAO;
import lionsclubs.com.MM1.MM1_3.MM1_18.MM1_18VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_15ServiceImpl extends AbstractServiceImpl implements MM1_15Service{
	@Autowired private MM1_15DAO dao;
	@Autowired private MM1_18DAO mm118Dao;
	@Resource private MM1_03Service mm103Service;
	@Resource private CommonCodeService commonCodeservice;
	
	@Override
	public List<MM1_15VO> MM1_15(MM1_15VO vo) throws Exception {
		return dao.MM1_15(vo);
	}
	
	@Override
	public List<MM1_15VO> listRetireMember(MM1_15VO vo) throws Exception {
		return dao.listRetireMember(vo);
	}
	
	@Override
	public String insertRetireMember(MM1_15VO vo) throws Exception {
		String message = insertRetireMemberProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("처리되지 않은 퇴회회원 대상이 존재합니다.");
				sMessage = "처리되지 않은 퇴회회원 대상이 존재합니다.";
				break;
			case 91: 
				log.debug("퇴회일자가 입회일자보다 이전 날짜인 회원이 존재합니다.\n개인기록관리 > 개인 기본 업무 > 경력(선임/위촉)/입력 메뉴에서 입회일자를 확인해 주세요.");
				sMessage = "퇴회일자가 입회일자보다 이전 날짜인 회원이 존재합니다.\n개인기록관리 > 개인 기본 업무 > 경력(선임/위촉)/입력 메뉴에서 입회일자를 확인해 주세요.";
				break;				
			default:
				log.debug("퇴회회원 입력.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String insertRetireMemberProcess(MM1_15VO vo) throws Exception {
		
		int checkRetireMemberCnt = dao.checkRetireMember(vo);
		if(checkRetireMemberCnt > 0){
			return "90";
		}
		
		for(MM1_15VO vo2 : vo.getRetireMemberArray()){
			vo2 = dao.retireMember(vo2);
			
			int lastSingDate = Integer.parseInt(vo2.getLastSingDate());
			int retireDate = Integer.parseInt(vo.getRetireDate().replaceAll("\\.", ""));
			if(lastSingDate >= retireDate){
				return "91";
			}
		}
		
		dao.insertRetireMember(vo.getRetireMemberArray());
		
		return "1";
	}
	
	@Override
	public String deleteRetireMember(MM1_15VO vo) throws Exception {
		String message = deleteRetireMemberProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("승인이 되어있는 항목이 있어 삭제할 수 없습니다.");
				sMessage = "승인이 되어있는 항목이 있어 삭제할 수 없습니다.";
				break;
			default:
				log.debug("삭제완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String deleteRetireMemberProcess(MM1_15VO vo) throws Exception {
		for(MM1_15VO vo2 : vo.getRetireMemberArray()){
			int countApproveCheck = dao.countApproveCheck(vo2);
			if(countApproveCheck > 0){
				return "90";
			}
		}
		
		return String.valueOf(dao.deleteRetireMember(vo.getRetireMemberArray()));		
	}
	
	@Override
	public String updateApprove(MM1_15VO vo) throws Exception {
		String message = updateApproveProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 91: 
				log.debug("월말 2일전까지만 승인할수 있습니다.");
				sMessage = "월말 2일전까지만 승인할수 있습니다.";
			break;		
			case 92:
				log.debug("퇴회일자가 현재 년월에만 승인할 수 있습니다.");
				sMessage = "퇴회일자가 현재 년월에만 승인할 수 있습니다.";
			break;		
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateApproveProcess(MM1_15VO vo) throws Exception {
		
		MM1_15VO objectRetireMember = dao.objectRetireMember(vo);
		
		String retireDate = objectRetireMember.getRetireDate();
		String yearMonth = retireDate.substring(0,6);

		CommonCodeVO commonCodeVO = new CommonCodeVO();
		commonCodeVO.setGroupCode("9601");
		commonCodeVO.setCode("1000");
		int allowDay = Integer.parseInt(commonCodeservice.codetolabel(commonCodeVO));		
		
		if(CommonUtil.getLastDayOfday() < allowDay){
			return "91";
		}

		if(!yearMonth.equals(CommonUtil.thisYear() + CommonUtil.thisMonth())){
			return "92";
		}
		
		vo.setApproveYn("Y");
		dao.updateApprove(vo);
		
		return "1";
	}
	
	@Override
	public String updateApproveCancel(MM1_15VO vo) throws Exception {
		String message = updateApproveCancelProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("처리가 완료되어 승인취소 할수 없습니다.");
				sMessage = "처리가 완료되어 승인취소 할수 없습니다.";
				break;
			default:
				log.debug("승인취소.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateApproveCancelProcess(MM1_15VO vo) throws Exception {
		int countTreatmentCheck = dao.countTreatmentCheck(vo);
		if(countTreatmentCheck > 0){
			return "90";
		}
		
		vo.setApproveYn("N");
		dao.updateApprove(vo);
		
		return "1";
	}
	
	@Override
	public String updateTreatment(MM1_15VO vo) throws Exception {
		String message = updateTreatmentProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("승인이 되지 않았습니다.");
				sMessage = "승인이 되지 않았습니다.";
				break;		
			case 91: 
				log.debug("이미 처리가 되었습니다.");
				sMessage = "이미 처리가 되었습니다.";
				break;
			default:
				log.debug("처리완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateTreatmentProcess(MM1_15VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		int countApproveCheck = dao.countApproveCheck(vo);
		if(countApproveCheck == 0){
			return "90";
		}
		
		int countTreatmentCheck = dao.countTreatmentCheck(vo);
		if(countTreatmentCheck > 0){
			return "91";
		}
		
		
		// 경력(선임/위촉) 백업
		MM1_18VO mm118vo = new MM1_18VO();
		mm118vo.setIdnNo(vo.getIdnNo());
		mm118vo.setKind("Q");	// 퇴회(Q)/전입(T)/재입(R) 구분
		mm118vo.setMemberNo(vo.getMemberNo());
		mm118Dao.deleteAppointmentBak(mm118vo);
		mm118Dao.insertAppointmentBak(mm118vo);
		
		vo.setTreatmentYn("Y");
		dao.updateTreatment(vo);
		
		// 퇴회회원 선임
		vo.setIdnNo(dao.insertAppointment(vo));
		
		// 퇴회회원 최신 flag 업데이트
		MM1_03VO mm103vo = new MM1_03VO();
		mm103vo.setIdnNo(vo.getIdnNo());
		mm103vo.setAppKindCode("1050");
		mm103vo.setStartDate(vo.getRetireDate());
		mm103vo.setMemberNo(vo.getMemberNo());
		mm103Service.flagUpdate(mm103vo);
		
		return "1";
	}	
	
	@Override
	public String updateTreatmentCancel(MM1_15VO vo) throws Exception {
		String message = updateTreatmentCancelProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("승인이 되지 않았습니다.");
				sMessage = "승인이 되지 않았습니다.";
				break;		
			case 91: 
				log.debug("이미 처리취소가 되었습니다.");
				sMessage = "이미 처리취소가 되었습니다.";
				break;
			case 92: 
				log.debug("퇴회 이후 경력(선임/위촉) 정보가 있어 처리취소 할 수 없습니다.");
				sMessage = "퇴회 이후 경력(선임/위촉) 정보가 있어 처리취소 할 수 없습니다.";
				break;					
			default:
				log.debug("처리취소완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}

	public String updateTreatmentCancelProcess(MM1_15VO vo) throws Exception {
		if(dao.countApproveCheck(vo) == 0){
			return "90";
		}
		
		if(dao.countTreatmentCheck(vo) == 0){
			return "91";
		}
		
		if(dao.countAppointmentCheck(vo) > 0){
			return "92";
		}

		// 경력(선임/위촉) 백업복구
		MM1_18VO mm118vo = new MM1_18VO();
		mm118vo.setIdnNo(vo.getIdnNo());
		mm118vo.setKind("Q");	// 퇴회(Q)/전입(T)/재입(R) 구분
		mm118vo.setMemberNo(vo.getMemberNo());
		mm118Dao.deleteAppointment(mm118vo);
		mm118Dao.insertAppointment(mm118vo);	
		
		// 퇴회회원 선임정보 삭제
		dao.deleteAppointment(vo);
		
		vo.setTreatmentYn("N");
		dao.updateTreatment(vo);
		
		/**
		 * 최신 선임/위촉 flag으로 업데이트
		 */
		MM1_03VO mm103vo = new MM1_03VO();
		mm103vo.setAppKindCode("1050");
		mm103vo.setMemberNo(vo.getMemberNo());
		mm103Service.flagUpdate(mm103vo);
		
		return "1";
	}
}
