package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_24ServiceImpl extends AbstractServiceImpl implements MM2_24Service{
	
	@Autowired
	private MM2_24DAO_HEAD daoHead;

	@Autowired
	private MM2_24DAO_DATA daoData;

	@Override
	public List<MM2_24VO_OPT> loadConfIdnNo(MM2_24VO_PARAM vo) throws Exception {
		return daoHead.loadConfIdnNo(vo);
	}

	/**
	 * 회의정보 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public MM2_24VO_CONF_INFO loadConferenceBasicInfo(MM2_24VO_PARAM vo) throws Exception {
		return daoHead.loadConferenceBasicInfo(vo);
	}
	
	/**
	 * 회의추가
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@Override
	public String insertConferenceBasicInfo(MM2_24VO_CONF_INFO_INSERT vo) throws Exception {
		MM2_24VO_PARAM paramVo = new MM2_24VO_PARAM();
		paramVo.setYearCode(vo.getInsertYearCode());
		paramVo.setMonthCode(vo.getInsertMonthCode());
		paramVo.setOrganCode(vo.getInsertOrganCode());
		paramVo.setConfKindCode(vo.getInsertConfKindCode());
		paramVo.setConfDate(vo.getInsertConfDate());
		
		if(daoHead.getConferenceDateCount(paramVo)>0){
			return "동일한 날짜에 이미 회의가 존재합니다.";
		}
		
		if(daoHead.insertConferenceBasicInfo(vo) != 1) {
			return "회의정보 추가를 실패하였습니다.";
		}
		return "";
	}
	
	/**
	 * 회의수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@Override
	public String updateConferenceBasicInfo(MM2_24VO_CONF_INFO_UPDATE vo) throws Exception {
		MM2_24VO_PARAM paramVo = new MM2_24VO_PARAM();
		paramVo.setYearCode(vo.getUpdateYearCode());
		paramVo.setMonthCode(vo.getUpdateMonthCode());
		paramVo.setOrganCode(vo.getUpdateOrganCode());
		paramVo.setConfKindCode(vo.getUpdateConfKindCode());
		paramVo.setConfDate(vo.getUpdateConfDate());
		paramVo.setConfIdnNo(vo.getUpdateConfIdnNo());

		if(daoHead.getConferenceDateCount(paramVo)>0){
			return "동일한 날짜에 이미 회의가 존재합니다.";
		}
		
		if(daoHead.updateConferenceBasicInfo(vo) != 1) {
			return "회의정보 수정을 실패하였습니다.";
		}
		return "";
	}
	
	/**
	 * 회의삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@Override
	public String deleteConferenceBasicInfo(MM2_24VO_PARAM vo) throws Exception {
		try{

			/* 행사안내 전체 삭제*/
			daoHead.deleteEventInformation(vo);
			
			/* 심의안건 전체 삭제*/
			daoHead.deleteDeliberationAgenda(vo);

			/* 건의사항 전체 삭제*/
			daoHead.deleteSuggestion(vo);

			if(daoHead.deleteConferenceBasicInfo(vo) != 1) {
				throw new Exception("회의정보 삭제를 실패하였습니다.");
			}
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
		return "";
	}

	@Override
	public List<MM2_24VO_DATA> selectList(MM2_24VO_PARAM vo) throws Exception {
		return daoData.selectList(vo);
	}

	@Override
	public int insertList(MM2_24VO_PARAM vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= daoData.insertData(setParamVo(vo, vo.getChkIdx().get(i).intValue(),true));
		}
		return cnt;
	}

	@Override
	public int updateList(MM2_24VO_PARAM vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= daoData.updateData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;	
	}

	@Override
	public int deleteList(MM2_24VO_PARAM vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= daoData.deleteData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;	
	}

	@Override
	public int initList(MM2_24VO_PARAM vo) throws Exception {
		daoData.deleteAll(vo);
		return daoData.initList(vo);
	}

	
	private MM2_24VO_DATA setParamVo(MM2_24VO_PARAM vo, int index) throws Exception {
		return setParamVo(vo, index, false);
	}

	private MM2_24VO_DATA setParamVo(MM2_24VO_PARAM vo, int index, boolean isInsert) throws Exception {
		index--; 
		MM2_24VO_DATA rtnVo = new MM2_24VO_DATA();
		
		//rtnVo.setChkIdx(vo.getChkIdx().get(index))				;
		rtnVo.setInputOrganCode(isInsert ? vo.getOrganCode(): vo.getInputOrganCode().get(index))  ;
		rtnVo.setInputInIdnNo(vo.getInputInIdnNo().get(index))      ;
		rtnVo.setInputInOrder(vo.getInputInOrder().get(index))      ;
		rtnVo.setInputProcessOrdDesc(vo.getInputProcessOrdDesc().get(index)) ;
		rtnVo.setInputHost1(vo.getInputHost1().get(index))          ;
		rtnVo.setInputHost2(vo.getInputHost2().get(index))          ;
		rtnVo.setInputFileId(vo.getInputFileId().get(index))        ;
		rtnVo.setMemberNo(vo.getMemberNo())			                ;

		return rtnVo;
	}
	/**
	 * 파일첨부정보 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public int fileInfoUpload(MM2_24VO_FILE vo) throws Exception {
		return daoData.fileInfoUpload(vo);
	}
}
