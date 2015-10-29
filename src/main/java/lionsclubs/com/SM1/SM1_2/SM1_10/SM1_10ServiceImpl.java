package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_10ServiceImpl extends AbstractServiceImpl implements SM1_10Service{
	
	@Autowired
	private SM1_10DAO dao;

	@Override
	public int insertList(SM1_10VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.insertData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;
	}

	@Override
	public int updateList(SM1_10VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.updateData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;
	}
	
	@Override
	public int deleteList(SM1_10VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.deleteData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;
	}
	
	private SM1_10VO_DATA setParamVo(SM1_10VO vo, int index) throws Exception {
		index--; 
		SM1_10VO_DATA rtnVo = new SM1_10VO_DATA();
		//rtnVo.setChkIdx(vo.getChkIdx().get(index));
		rtnVo.setIdnNo(vo.getIdnNo().get(index));
		rtnVo.setOrganCode(vo.getOrganCode().get(index));
		//rtnVo.setAppKindCode(vo.getAppKindCode().get(index));
		rtnVo.setAppDescCode(vo.getAppDescCode().get(index));
		rtnVo.setMemberNo(vo.getMemberNo().get(index));
		rtnVo.setMemberName(vo.getMemberName().get(index));
		rtnVo.setOrd(vo.getOrd().get(index));
		rtnVo.setfAgeCode(vo.getfAgeCode().get(index));
		rtnVo.setfOrganCodeText(vo.getfOrganCodeText().get(index));
		rtnVo.setfPos(vo.getfPos().get(index));
		rtnVo.setfClubName(vo.getfClubName().get(index));
		return rtnVo;
	}

	@Override
	public List<SM1_10VO_DATA> selectList(SM1_10VO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public int fileInfoUpload(SM1_10VO_FILE vo) throws Exception {
		return dao.fileInfoUpload(vo);
	}
	
	@Override
	public int reorderList(SM1_10VO vo) throws Exception {
		int cnt = dao.reorderList(vo);
		return cnt;
	}
}