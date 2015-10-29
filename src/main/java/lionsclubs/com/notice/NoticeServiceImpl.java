package lionsclubs.com.notice;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.ext.jfile.service.JFileService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class NoticeServiceImpl extends AbstractServiceImpl implements NoticeService{
	@Autowired private NoticeDAO dao;
	@Autowired private JFileService jFileService;
	
	/**
	 * 게시판 리스트
	 */
	@Override
	public Page listNotice(NoticeVO vo) throws Exception {
		if(StringUtils.isEmpty(vo.getNoticeCode())){
			vo.setNoticeCode(vo.getMenuId());
		}
		
		return dao.listNotice(vo);
	}
	
	/**
	 * 게시판 정보
	 */
	@Override
	public NoticeVO objectNotice(NoticeVO vo) throws Exception {
		
		dao.updateNoticeHit(vo);		
		NoticeVO noticeVo = dao.objectNotice(vo);
//		noticeVo.setContent(StringEscapeUtils.unescapeHtml(noticeVo.getContent()));
		
		return noticeVo;
	}
	
	/**
	 * 게시판 입력
	 */
	@Override
	public String noticeInsert(NoticeVO vo) throws Exception {
		vo.setContent(vo.getContent());
		
		return dao.noticeInsert(vo);
	}
	
	/**
	 * 게시판 수정
	 */
	@Override
	public Integer noticeUpdate(NoticeVO vo) throws Exception {
		vo.setContent(vo.getContent());
		return dao.noticeUpdate(vo);
	}
	
	/**
	 * 게시판 삭제
	 */
	@Override
	public Integer noticeDelete(NoticeVO vo) throws Exception {
		NoticeVO notice = dao.objectNotice(vo);
		// 첨부파일을 삭제한다.
		jFileService.removeAttachFiles(notice.getFileId());
		
		// 덧글을 삭제한다.
		dao.deleteReply(vo);
		
		return dao.noticeDelete(vo);
	}
	
	/**
	 * 윗글/아랫글 페이징
	 */
	@Override
	public NoticeVO prenextPaging(NoticeVO vo) throws Exception {
		
		if(StringUtils.isEmpty(vo.getNoticeCode())){
			vo.setNoticeCode(vo.getMenuId());
		}
		
		return dao.prenextPaging(vo);
	}
	
	/**
	 * 게시판 덧글 리스트
	 */
	@Override
	public List<NoticeVO> listReply(NoticeVO vo) throws Exception {
		return dao.listReply(vo);
	}
	
	/**
	 * 게시판 덧글 정보
	 */
	@Override
	public NoticeVO objectReply(NoticeVO vo) throws Exception {
		return dao.objectReply(vo);
	}
	
	@Override
	public String saveReply(NoticeVO vo) throws Exception {
		String message = saveReplyProcess(vo);
		String sMessage = null;
   
    	/*
    	오류 메세지 정보
    	*/
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("해당글이 존재하지 않습니다.");
				sMessage = "해당글이 존재하지 않습니다.";
				break;		
			default:
				log.debug("덧글작성 완료.");
				sMessage = "1";
				break;
		}
		
		log.debug(message);
		return sMessage;
	}
	
	/**
	 * 덧글 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveReplyProcess(NoticeVO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isNotEmpty(vo.getReplyIdnNo()) 
				&& dao.objectReplyCount(vo) == 0){
			return "90";
		}
		
		if(StringUtils.isNotEmpty(vo.getReplyIdnNo())){
			dao.updateReply(vo);
		} else {
			dao.insertReply(vo);
		}
		
		return "1";
	}
	
	@Override
	public Integer updateDelReply(NoticeVO vo) throws Exception {
		return dao.updateDelReply(vo);
	}
	
	@Override
	public Integer replyTotalCnt(NoticeVO vo) throws Exception {
		return dao.replyTotalCnt(vo);
	}
	
	@Override
	public String objectNoticeKindCode(NoticeVO vo) throws Exception {
		if(StringUtils.isEmpty(vo.getNoticeCode())){
			vo.setNoticeCode(vo.getMenuId());
		}
		
		return dao.objectNoticeKindCode(vo);
	}
	
	@Override
	public Integer deleteNoticeScheduling() throws Exception {
		return dao.deleteNoticeScheduling();
	}
}
