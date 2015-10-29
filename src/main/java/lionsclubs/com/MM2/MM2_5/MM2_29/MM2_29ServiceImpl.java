package lionsclubs.com.MM2.MM2_5.MM2_29;

import java.util.ArrayList;
import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.ext.jfile.service.JFileService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_29ServiceImpl extends AbstractServiceImpl implements MM2_29Service{
	@Autowired private MM2_29DAO dao;
	@Autowired private JFileService jFileService;
	
	@Override
	public List<MM2_29VO> list(MM2_29VO vo) throws Exception {
		return dao.list(vo);
	}
	
	@Override
	public MM2_29VO total(MM2_29VO vo) throws Exception {
		return dao.total(vo);
	}
	
	@Override
	public MM2_29VO detail(MM2_29VO vo) throws Exception {
		return dao.detail(vo);
	}
	
	@Override
	public Boolean delete(MM2_29VO vo) throws Exception {
		MM2_29VO detail = dao.detail(vo);
		// 첨부파일을 삭제한다.
		jFileService.removeAttachFiles(detail.getFileId());
		
		// 모든행사인원을 삭제한다.
		MM2_29VO eventClubObject = dao.eventClubObject(vo);
		dao.deleteEventMemberAll(eventClubObject);
		// 모든클럽행사를 삭제한다.
		dao.deleteEventClubAll(vo);
		// 행사입력을 삭제한다.
		dao.deleteEventSponsor(vo);
		
		return true;
	}
	
	@Override
	public List<MM2_29VO> subTreeYearClubCodeList(MM2_29VO vo) throws Exception {
		return dao.subTreeYearClubCodeList(vo);
	}
	
	@Override
	public List<MM2_29VO> eventClubMemberList(MM2_29VO vo) throws Exception {
		MM2_29VO eventClubObject = dao.eventClubObject(vo);
		if(eventClubObject != null){
			vo.setEventClubIdnNo(eventClubObject.getEventClubIdnNo());	
		}
		
		return dao.eventClubMemberList(vo);
	}
	
	@Override
	public Boolean insertEventSponsor(MM2_29VO vo) throws Exception {
		return dao.insertEventSponsor(vo);
	}
	
	@Override
	public Integer updateEventSponsor(MM2_29VO vo) throws Exception {
		return dao.updateEventSponsor(vo);
	}

	@Override
	public String saveEventMemberProcess(MM2_29VO vo) throws Exception {
		
		String message = saveEventMember(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("행사마감이 되어 저장되지 않습니다.");
				sMessage = "행사마감이 되어 저장되지 않습니다.";
				break;
			default:
				log.debug("행사저장 완료.");
				sMessage = "0";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String saveEventMember(MM2_29VO vo) throws Exception {
		
		MM2_29VO detail = dao.detail(vo);
		// 행사마감
		if(detail.getFinishYn().equals("Y")){
			return "90";
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		MM2_29VO eventClubObject = dao.eventClubObject(vo);
		// 클럽행사가 존재하면 클럽행사 정보를 업데이트 한다.
		if(eventClubObject != null){
			vo.setEventClubIdnNo(eventClubObject.getEventClubIdnNo());
			dao.updateEventClub(vo);
		// 클럽행사가 존재하지 않으면 클럽행사 정보를 입력한다.
		} else {
			String eventClubIdnNo = dao.insertEventClub(vo);
			vo.setEventClubIdnNo(eventClubIdnNo);
		}
		
		dao.deleteEventMemberAll(vo);

		if(vo.getEventMemberArray() != null){
			List<MM2_29VO> eventMemberList = new ArrayList<MM2_29VO>();
			for(MM2_29VO eventMember : vo.getEventMemberArray()){
				eventMember.setEventClubIdnNo(vo.getEventClubIdnNo());
				eventMember.setInsertName(user.getId());
				eventMember.setUpdateName(user.getId());
				eventMemberList.add(eventMember);
			}
			
			dao.insertEventMember(eventMemberList);
		}
		
		return "0";
	}
	
	@Override
	public MM2_29VO eventClubObject(MM2_29VO vo) throws Exception {
		return dao.eventClubObject(vo);
	}
	
	@Override
	public List<MM2_29VO> eventClubList(MM2_29VO vo) throws Exception {
		return dao.eventClubList(vo);
	}
	
	@Override
	public Boolean deleteEventClub(MM2_29VO vo) throws Exception {
		// 모든행사인원을 삭제한다.
		dao.deleteEventMemberAll(vo);
		// 클럽행사를 삭제한다.
		dao.deleteEventClub(vo);
		
		return true;
	}
	
	@Override
	public List<MM2_29VO> eventMemberList(MM2_29VO vo) throws Exception {
		return dao.eventMemberList(vo);
	}
	
	@Override
	public MM2_29VO eventMemberTotal(MM2_29VO vo) throws Exception {
		return dao.eventMemberTotal(vo);
	}
	
	@Override
	public List<MM2_29VO> eventPhotoList(MM2_29VO vo) throws Exception {
		return dao.eventPhotoList(vo);
	}
}
