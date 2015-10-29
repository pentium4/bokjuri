package lionsclubs.com.MM2.MM2_5.MM2_29;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM2_29DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_5.MM2_29.";

	@SuppressWarnings("unchecked")
	public List<MM2_29VO> list(MM2_29VO vo) throws Exception {
		return list(commonId + "list", vo);
	}

	public MM2_29VO total(MM2_29VO vo) {
		return (MM2_29VO) selectByPk(commonId + "total", vo);
	}	
	
	public MM2_29VO detail(MM2_29VO vo) throws Exception {
		return (MM2_29VO) selectByPk(commonId + "detail", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM2_29VO> subTreeYearClubCodeList(MM2_29VO vo) throws Exception {
		return list(commonId + "subTreeYearClubCodeList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_29VO> eventClubMemberList(MM2_29VO vo) throws Exception {
		return list(commonId + "eventClubMemberList", vo);
	}
	
	public Boolean insertEventSponsor(MM2_29VO vo) throws Exception {
		insert(commonId + "insertEventSponsor", vo);
		return true;
	}
	
	public Integer updateEventSponsor(MM2_29VO vo) throws Exception {
		return update(commonId + "updateEventSponsor", vo);
	}
	
	public MM2_29VO eventClubObject(MM2_29VO vo) throws Exception {
		return (MM2_29VO) selectByPk(commonId + "eventClubObject", vo);
	}
	
	public String insertEventClub(MM2_29VO vo) throws Exception {
		return (String) insert(commonId + "insertEventClub", vo);
	}
	
	public Integer updateEventClub(MM2_29VO vo) throws Exception {
		return (Integer) update(commonId + "updateEventClub", vo);
	}
	
	public Integer insertEventMember(Object list) throws Exception {
		return batchInsert(commonId + "insertEventMember", list);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_29VO> eventClubList(MM2_29VO vo) throws Exception {
		return list(commonId + "eventClubList", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_29VO> eventMemberList(MM2_29VO vo) throws Exception {
		return list(commonId + "eventMemberList", vo);
	}

	public MM2_29VO eventMemberTotal(MM2_29VO vo) throws Exception {
		return (MM2_29VO) selectByPk(commonId + "eventMemberTotal", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM2_29VO> eventPhotoList(MM2_29VO vo) {
		return list(commonId + "eventPhotoList", vo);
	}
	
	public Integer deleteEventSponsor(MM2_29VO vo) throws Exception {
		return delete(commonId + "deleteEventSponsor", vo);
	}

	public Integer deleteEventClub(MM2_29VO vo) throws Exception {
		return delete(commonId + "deleteEventClub", vo);
	}

	public Integer deleteEventMember(MM2_29VO vo) throws Exception {
		return delete(commonId + "deleteEventMember", vo);
	}

	public Integer deleteEventClubAll(MM2_29VO vo) throws Exception {
		return delete(commonId + "deleteEventClubAll", vo);
	}

	public Integer deleteEventMemberAll(MM2_29VO vo) throws Exception {
		return delete(commonId + "deleteEventMemberAll", vo);
	}
}
