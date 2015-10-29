package lionsclubs.com.MM2.MM2_4.MM2_27;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24VO_PARAM;
import lionsclubs.com.MM2.MM2_4.MM2_26.MM2_26VO_DATA;
import lionsclubs.com.MM2.MM2_4.MM2_26.MM2_26VO_PARAM;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jfile.service.JFileService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


@Service
public class MM2_27ServiceImpl extends AbstractServiceImpl implements MM2_27Service{
	@Autowired private ServletContext servletContext;
	@Autowired private MM2_27DAO daoData;
	@Autowired private JFileService jFileService;

	@Override
	public int deleteList(MM2_27VO_PARAM vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= daoData.deleteData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;	
	}

	@Override
	public int insertList(MM2_27VO_PARAM vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= daoData.insertData(setParamVo(vo, vo.getChkIdx().get(i).intValue(),true));
		}
		return cnt;
	}

	@Override
	public List<MM2_27VO_DATA> selectList(MM2_24VO_PARAM vo) throws Exception {
		return daoData.selectList(vo);
	}

	@Override
	public int updateList(MM2_27VO_PARAM vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= daoData.updateData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;	
	}

	@Override
	public int fileInfoUpload(MM2_27VO_FILE vo) throws Exception {
		return daoData.fileInfoUpload(vo);
	}

	private MM2_27VO_DATA setParamVo(MM2_27VO_PARAM vo, int index) throws Exception {
		return setParamVo(vo, index, false);
	}

	private MM2_27VO_DATA setParamVo(MM2_27VO_PARAM vo, int index, boolean isInsert) throws Exception {
		index--; 
		MM2_27VO_DATA rtnVo = new MM2_27VO_DATA();
		
		if(isInsert){
			rtnVo.setInputSessionYyyy(vo.getYearCode())		;
			rtnVo.setInputSessionMm(vo.getMonthCode())		;
			rtnVo.setInputOrganCode(vo.getOrganCode())		;
			rtnVo.setInputConfKindCode(vo.getConfKindCode());
			rtnVo.setInputConfIdnNo(vo.getConfIdnNo())		;
		}else{
			rtnVo.setInputSessionYyyy(vo.getInputSessionYyyy().get(index))	;
			rtnVo.setInputSessionMm(vo.getInputSessionMm().get(index))		;
			rtnVo.setInputOrganCode(vo.getInputOrganCode().get(index))		;
			rtnVo.setInputConfKindCode(vo.getInputConfKindCode().get(index));
			rtnVo.setInputConfIdnNo(vo.getInputConfIdnNo().get(index))		;
		}
		
		
		rtnVo.setInputIdnNo(vo.getInputIdnNo().get(index))		;
		rtnVo.setInputInDate(vo.getInputInDate().get(index));
		rtnVo.setInputInDesc(vo.getInputInDesc().get(index))	;
		rtnVo.setInputInPerson(vo.getInputInPerson().get(index))	;
		rtnVo.setInputTakeStatus(vo.getInputTakeStatus().get(index))	;
		rtnVo.setInputFileId(vo.getInputFileId().get(index))		;
		
		rtnVo.setMemberNo(vo.getMemberNo())			                ;
	
		return rtnVo;
	}

	@Override
	public String copy(MM2_27VO_PARAM vo) throws Exception {
		String message = copyProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("동일한 기타토의를 복사할 수 없습니다.");
				sMessage = "동일한 기타토의를 복사할 수 없습니다.";
				break;
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String copyProcess(MM2_27VO_PARAM vo) throws Exception {
		if(vo.getYearCode().equals(vo.getCopyYearCode())
				&& vo.getMonthCode().equals(vo.getCopyMonthCode())
				&& vo.getOrganCode().equals(vo.getCopyOrganCode())
				&& vo.getConfKindCode().equals(vo.getCopyConfKindCode())
				&& vo.getConfIdnNo().equals(vo.getCopyConfIdnNo())){
			return "90";
		}
		
		daoData.deleteCopy(vo);
		daoData.insertCopy(vo);
		
		return "1";
	}
	
	@Override
	public Map<String, Object> excelDownload(MM2_24VO_PARAM vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM2/MM2_4/MM2_27/template.xlsx");
		modelMap.put("destFileName", "기타토의_" + date + ".xlsx");
		
		return modelMap;
	}
}
