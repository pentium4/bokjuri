package lionsclubs.com.MM1.MM1_3.MM1_14;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01DAO;
import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01Service;
import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01VO;
import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03Service;
import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_14ServiceImpl extends AbstractServiceImpl implements MM1_14Service{
	@Autowired private MM1_14DAO dao;
	@Autowired private MM1_01DAO mm101Dao;
	@Resource private MM1_01Service mm101Service;
	@Resource private MM1_03Service mm103Service;
	@Resource private CommonCodeService commonCodeservice;
	
	@Override
	public MM1_14VO MM1_14(MM1_14VO vo) throws Exception {
		if(StringUtils.isEmpty(vo.getOrder())){
			vo.setOrder("1");
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getMemberNo())){
			vo.setMemberNo(user.getSearchId());
		} else {
			user.setSearchId(vo.getMemberNo());
		}
		
		return dao.MM1_14(vo);
	}
	
	@Override
	public List<MM1_14VO> listNewMember(MM1_14VO vo) throws Exception {
		return dao.listNewMember(vo);
	}
	
	@Override
	public String insertProfile(MM1_14VO vo) throws Exception {
		String message = insertProfileProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String insertProfileProcess(MM1_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
//		MM1_01VO mm101Vo = new MM1_01VO();
//		mm101Vo.setName(vo.getName());
//		mm101Vo.setBirth(vo.getBirth());
//		if(mm101Dao.duplicateCheck2(mm101Vo) > 0){
//			return "90";
//		}
		
		vo.setRegisterNo(dao.insertProfile(vo));
		return "1";
	}	
	
	@Override
	public Integer updateProfile(MM1_14VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		return dao.updateProfile(vo);
	}
	
	@Override
	public MM1_14VO registerNo(MM1_14VO vo) throws Exception {
		return dao.registerNo(vo);
	}
	
	@Override
	public Page listRegister(MM1_14VO vo) throws Exception {
		return dao.listRegister(vo);
	}
	
	@Override
	public Integer hrUpdate(MM1_14VO vo) throws Exception {
		return dao.hrUpdate(vo);
	}
	
	@Override
	public String delete(MM1_14VO vo) throws Exception {
		String message = deleteProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("승인이 되어있어 삭제할 수 없습니다.");
				sMessage = "승인이 되어있어 삭제할 수 없습니다.";
				break;
			default:
				log.debug("삭제완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String deleteProcess(MM1_14VO vo) throws Exception {
		int countApproveCheck = dao.countApproveCheck(vo);
		if(countApproveCheck > 0){
			return "90";
		}
		
		return String.valueOf(dao.delete(vo));
	}
	
	@Override
	public String updateApprove(MM1_14VO vo) throws Exception {
		String message = updateApproveProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 91: 
				log.debug("월말 2일전까지만 승인할수 있습니다.");
				sMessage = "월말 2일전까지만 승인할수 있습니다.";
			break;		
			case 92:
				log.debug("입회일자가 현재 년월에만 승인할 수 있습니다.");
				sMessage = "입회일자가 현재 년월에만 승인할 수 있습니다.";
			break;		
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateApproveProcess(MM1_14VO vo) throws Exception {
		
		MM1_14VO objectNewMember = dao.MM1_14(vo);
		
		String singDate = objectNewMember.getSingDate();
		String yearMonth = singDate.substring(0,6);

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
	public String updateApproveCancel(MM1_14VO vo) throws Exception {
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
	
	public String updateApproveCancelProcess(MM1_14VO vo) throws Exception {
		
		int countTreatmentCheck = dao.countTreatmentCheck(vo);
		if(countTreatmentCheck > 0){
			return "90";
		}
		
		vo.setApproveYn("N");
		dao.updateApprove(vo);
		
		return "1";
	}	
	
	@Override
	public String updateTreatment(MM1_14VO vo) throws Exception {
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
			case 92: 
				log.debug("동일한 회원번호가 존재합니다.");
				sMessage = "동일한 회원번호가 존재합니다.";
				break;
			default:
				log.debug("처리완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateTreatmentProcess(MM1_14VO vo) throws Exception {
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
		
		MM1_01VO mm101VO = new MM1_01VO();
		mm101VO.setMemberNo(vo.getMemberNo());
		int memberNoCheck = mm101Service.duplicateCheck(mm101VO);
		if(memberNoCheck > 0){
			return "92";
		}

		vo.setTreatmentYn("Y");
		dao.updateTreatment(vo);
		
		// 신입회원 입력
		dao.insertMemberInfo(vo);
		
		String birth = vo.getBirth().replaceAll("\\.", "");
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat birthFormat = new SimpleDateFormat("yyMMdd");
		String passBirth = birthFormat.format(sd.parse(birth));
		
		ShaPasswordEncoder shaPasswordEncoder = new ShaPasswordEncoder(256);	// 암호화 방식인 sha-256 객체구함
		String shaPassword = shaPasswordEncoder.encodePassword(passBirth, null);	// 사용자의 실제 비밀번호를 sha-256로 암호화함.
		vo.setPassword(shaPassword);	// 암호화된 비밀번호로 셋팅함			
		
		// 신입회원 패스워드 업데이트
		dao.updateMemberInfoPassword(vo);
		
		// 신입회원 입회 선임
		dao.insertAppointment(vo);
		
		// 최신 flag 업데이트
		MM1_03VO mm103vo = new MM1_03VO();
		mm103vo.setAppKindCode("1040");
		mm103vo.setAppDescCode("1000");
		mm103vo.setMemberNo(vo.getMemberNo());
		mm103Service.flagUpdate(mm103vo);		
		
		return "1";
	}
	
	@Override
	public String updateTreatmentCancel(MM1_14VO vo) throws Exception {
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
				log.debug("입회 이후 경력(선임/위촉) 정보가 있어 처리취소 할 수 없습니다.");
				sMessage = "입회 이후 경력(선임/위촉) 정보가 있어 처리취소 할 수 없습니다.";
				break;					
			case 93: 
				log.debug("납부금 내역이 있어 처리취소가 되지 않습니다.");
				sMessage = "납부금 내역이 있어 처리취소가 되지 않습니다.";
				break;				
			default:
				log.debug("처리취소완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	
	public String updateTreatmentCancelProcess(MM1_14VO vo) throws Exception {
		if(dao.countApproveCheck(vo) == 0){
			return "90";
		}
		
		if(dao.countTreatmentCheck(vo) == 0){
			return "91";
		}
		
		if(dao.countAppointmentCheck(vo) > 0){
			return "92";	
		}
		
		if(dao.countPaymentCheck(vo) > 0){
			return "93";
		}
		
		// 모든회원정보 삭제
		dao.deleteMemberAll(vo);
		
		vo.setTreatmentYn("N");
		vo.setMemberNo(null);
		dao.updateTreatment(vo);
		
		return "1";
	}
}
