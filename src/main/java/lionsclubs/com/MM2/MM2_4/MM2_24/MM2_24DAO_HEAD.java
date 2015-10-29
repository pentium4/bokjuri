package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.util.List;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM2_24DAO_HEAD extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_4.MM2_24.HEAD.";
	
	
	/**
	 * 회의일자 콤보 option 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */  
	@SuppressWarnings("unchecked")
	public List<MM2_24VO_OPT> loadConfIdnNo(MM2_24VO_PARAM vo) throws Exception{
		return (List<MM2_24VO_OPT>)list(commonId + "loadConfIdnNo", vo);
	}


	/**
	 * 회의정보 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM2_24VO_CONF_INFO loadConferenceBasicInfo(MM2_24VO_PARAM vo) throws Exception{
		return (MM2_24VO_CONF_INFO)selectByPk(commonId + "loadConferenceBasicInfo", vo);
	}

	
	/**
	 * 회의정보 중복일자 여부 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer getConferenceDateCount(MM2_24VO_PARAM vo) throws Exception{
		return (Integer)selectByPk(commonId + "getConferenceDateCount", vo);
	}
	
	/**
	 * 회의추가
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	public Integer insertConferenceBasicInfo(MM2_24VO_CONF_INFO_INSERT vo) throws Exception{
		return update(commonId + "insertConferenceBasicInfo", vo);
	}
	
	/**
	 * 회의수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	public Integer updateConferenceBasicInfo(MM2_24VO_CONF_INFO_UPDATE vo) throws Exception{
		return update(commonId + "updateConferenceBasicInfo", vo);
	}
	
	/**
	 * 회의삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	public Integer deleteConferenceBasicInfo(MM2_24VO_PARAM vo) throws Exception{
		return delete(commonId + "deleteConferenceBasicInfo", vo);
	}
	
	/* 행사안내 전체 삭제*/
	public Integer deleteEventInformation(MM2_24VO_PARAM vo) throws Exception{
		return delete(commonId + "deleteEventInformation", vo);
	}
	
	/* 심의안건 전체 삭제*/
	public Integer deleteDeliberationAgenda(MM2_24VO_PARAM vo) throws Exception{
		return delete(commonId + "deleteDeliberationAgenda", vo);
	}

	/* 건의사항 전체 삭제*/
	public Integer deleteSuggestion(MM2_24VO_PARAM vo) throws Exception{
		return delete(commonId + "deleteSuggestion", vo);
	}	
}
