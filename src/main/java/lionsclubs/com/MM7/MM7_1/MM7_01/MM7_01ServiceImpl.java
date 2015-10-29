package lionsclubs.com.MM7.MM7_1.MM7_01;

import java.util.List;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM7_01ServiceImpl extends AbstractServiceImpl implements MM7_01Service{
	@Autowired private MM7_01DAO dao;
	
	@Override
	public Page listReception(MM7_01VO vo) throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		vo.setClubCode(user.getClubCode());
		
		/** 회기년도 세팅 */
		vo.setSessionYear(CommonUtil.thisSessionYear());
		
		return dao.listReception(vo);
	}
	
	@Override
	public Page listOutgoing(MM7_01VO vo) throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		vo.setClubCode(user.getClubCode());
		
		/** 회기년도 세팅 */
		vo.setSessionYear(CommonUtil.thisSessionYear());
		
		return dao.listOutgoing(vo);
	}
	
	
	@Override
	public Page listDuring(MM7_01VO vo) throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		
		return dao.listDuring(vo);
	}
	
	@Override
	public MM7_01VO objectDoc(MM7_01VO vo) throws Exception {
		return dao.objectDoc(vo);
	}
	
	@Override
	public String saveDoc(MM7_01VO vo) throws Exception {
		String message = saveDocProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "1";	// 문서작성 완료
    	*/
		switch(Integer.parseInt(message)){
			default:
				log.debug("문서작성 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveDocProcess(MM7_01VO vo) throws Exception {
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear();	// 년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			dao.deleteDocReceive(vo);	// 수신/참조/숨은참조 삭제
			dao.updateDoc(vo);
			
			if(vo.getReceiveArray() != null){
				for(MM7_01VO receive : vo.getReceiveArray()){
					receive.setInsertName(user.getId());
					receive.setUpdateName(user.getId());
					receive.setIdnNo(vo.getIdnNo());
					dao.insertDocReceive(receive);
				}
			}
		} else {
			vo.setClubCode(user.getClubCode());
			String idnNo = dao.insertDoc(vo);
			
			if(vo.getReceiveArray() != null){
				for(MM7_01VO receive : vo.getReceiveArray()){
					receive.setInsertName(user.getId());
					receive.setUpdateName(user.getId());
					receive.setIdnNo(idnNo);
					dao.insertDocReceive(receive);
				}
			}
		}
		
		return "1";
	}
	
	@Override
	public List<MM7_01VO> listOrganCode(MM7_01VO vo) throws Exception {
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear();	// 년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		return dao.listOrganCode(vo);
	}
	
	@Override
	public List<MM7_01VO> listReceiveOrganCode(MM7_01VO vo) throws Exception {
		return dao.listReceiveOrganCode(vo);
	}
	
	@Override
	public List<MM7_01VO> listReceive(MM7_01VO vo) throws Exception {
		return dao.listReceive(vo);
	}
	
	@Override
	public List<MM7_01VO> listReceiveMember(MM7_01VO vo) throws Exception {
		return dao.listReceiveMember(vo);
	}
	
	@Override
	public Boolean saveDocSearchMember(MM7_01VO vo) throws Exception {
		return dao.saveDocSearchMember(vo);
	}
	
	@Override
	public String updateOutgoingCancel(MM7_01VO vo) throws Exception {
		String message = updateOutgoingCancelProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	message = "1";	// 발신취소 완료
    	*/
		switch(Integer.parseInt(message)){
			default:
				log.debug("발신취소 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String updateOutgoingCancelProcess(MM7_01VO vo) throws Exception {

		dao.deleteDocSearchMember(vo);	// 문서 조회인원 삭제
		dao.updateOutgoingCancel(vo);
		
		return "1";
	}
	
	@Override
	public Boolean deleteDoc(MM7_01VO vo) throws Exception {
		
		dao.deleteDocSearchMember(vo);	// 문서 조회인원 삭제
		dao.deleteDocReceive(vo);	// 수신/참조/숨은참조 클럽 삭제
		dao.deleteDoc(vo);	// 문서 삭제
		
		return true;
	}
	
	@Override
	public List<MM7_01VO> listWriteOrganCode(MM7_01VO vo) throws Exception {
		return dao.listWriteOrganCode(vo);
	}
	
	@Override
	public Integer unreadReceptionCount() throws Exception {
		MM7_01VO vo = new MM7_01VO();
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		vo.setClubCode(user.getClubCode());
		
		/** 회기년도 세팅 */
		vo.setSessionYear(CommonUtil.thisSessionYear());
		
		return dao.unreadReceptionCount(vo);
	}
}
