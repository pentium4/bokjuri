package lionsclubs.com.notice;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;

public interface NoticeService {

	/**
	 * 게시판 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listNotice(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public NoticeVO objectNotice(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 입력
	 * @param vo
	 * @throws Exception
	 */
	public String noticeInsert(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer noticeUpdate(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer noticeDelete(NoticeVO vo) throws Exception;
	
	/**
	 * 윗글/아랫글 페이징
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public NoticeVO prenextPaging(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 덧글 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<NoticeVO> listReply(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 덧글 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public NoticeVO objectReply(NoticeVO vo) throws Exception;
	
	/**
	 * 덧글저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveReply(NoticeVO vo) throws Exception;

	/**
	 * 덧글 삭제필드 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateDelReply(NoticeVO vo) throws Exception;

	/**
	 * 덧글 갯수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer replyTotalCnt(NoticeVO vo) throws Exception;
	
	/**
	 * 게시판 종류 코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String objectNoticeKindCode(NoticeVO vo) throws Exception;
	
	/**
	 * 6개월이 지난 공개자료는 삭제한다.
	 * @return
	 * @throws Exception
	 */
	public Integer deleteNoticeScheduling() throws Exception;
}
