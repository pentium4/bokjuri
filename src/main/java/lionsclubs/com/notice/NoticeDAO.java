package lionsclubs.com.notice;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.notice.";
	
	/**
	 * 게시판 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listNotice(NoticeVO vo) throws Exception {
		return listWithPaging(commonId + "listNotice", vo);
	}
	
	/**
	 * 게시판 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public NoticeVO objectNotice(NoticeVO vo) throws Exception {
		return (NoticeVO) selectByPk(commonId + "objectNotice", vo);
	}
	
	/**
	 * 게시판 입력
	 * @param vo
	 * @throws Exception
	 */
	public String noticeInsert(NoticeVO vo) throws Exception {
		return (String) insert(commonId + "noticeInsert", vo);
	}
	
	/**
	 * 게시판 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer noticeUpdate(NoticeVO vo) throws Exception {
		return update(commonId + "noticeUpdate", vo);
	}
	
	/**
	 * 게시판 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer noticeDelete(NoticeVO vo) throws Exception {
		return update(commonId + "noticeDelete", vo);
	}

	/**
	 * 조회수 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateNoticeHit(NoticeVO vo) throws Exception {
		return update(commonId + "updateNoticeHit", vo);
	}
	
	/**
	 * 윗글/아랫글 페이징
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public NoticeVO prenextPaging(NoticeVO vo) throws Exception {
		return (NoticeVO) selectByPk(commonId + "prenextPaging", vo);
	}
	
	/**
	 * 게시판 덧글 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeVO> listReply(NoticeVO vo) throws Exception {
		return list(commonId + "listReply", vo);
	}
	
	/**
	 * 게시판 덧글 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public NoticeVO objectReply(NoticeVO vo) throws Exception {
		return (NoticeVO) selectByPk(commonId + "objectReply", vo);
	}
	
	/**
	 * 게시판 덧글 정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer objectReplyCount(NoticeVO vo) throws Exception {
		return (Integer) selectByPk(commonId + "objectReplyCount", vo);
	}	
	
	/**
	 * 덧글 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean insertReply(NoticeVO vo) throws Exception {
		insert(commonId + "insertReply", vo);
		return Boolean.TRUE;
	}
	
	/**
	 * 덧글 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateReply(NoticeVO vo) throws Exception {
		return update(commonId + "updateReply", vo);
	}

	/**
	 * 덧글 삭제필드 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updateDelReply(NoticeVO vo) throws Exception {
		return update(commonId + "updateDelReply", vo);
	}
	
	/**
	 * 덧글 갯수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer replyTotalCnt(NoticeVO vo) throws Exception {
		return (Integer) selectByPk(commonId + "replyTotalCnt", vo);
	}

	/**
	 * 덧글모두 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteReply(NoticeVO vo) throws Exception {
		return delete(commonId + "deleteReply", vo);
	}
	
	/**
	 * 게시판 종류 코드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String objectNoticeKindCode(NoticeVO vo) throws Exception {
		return (String) selectByPk(commonId + "objectNoticeKindCode", vo);
	}
	
	/**
	 * 6개월이 지난 공개자료는 삭제한다.
	 * @return
	 * @throws Exception
	 */
	public Integer deleteNoticeScheduling() throws Exception {
		return delete(commonId + "deleteNoticeScheduling", null);
	}
}
