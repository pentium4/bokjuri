package lionsclubs.com.SM1.SM1_2.SM1_11;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_11ServiceImpl extends AbstractServiceImpl implements SM1_11Service{
	
	@Autowired
	private SM1_11DAO dao;

	@Override
	public int insertList(SM1_11VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.insertData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;
	}

	@Override
	public int updateList(SM1_11VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.updateData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;
	}
	
	@Override
	public int deleteList(SM1_11VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.deleteData(setParamVo(vo, vo.getChkIdx().get(i).intValue()));
		}
		return cnt;
	}
	
	private SM1_11VO_DATA setParamVo(SM1_11VO vo, int index) throws Exception {
		index--; 
		SM1_11VO_DATA rtnVo = new SM1_11VO_DATA();
		//rtnVo.setChkIdx(vo.getChkIdx().get(index));
		rtnVo.setIdnNo(vo.getIdnNo().get(index));
		rtnVo.setAgeCode(vo.getAgeCode().get(index));
		rtnVo.setOrganCode(vo.getOrganCode().get(index));
		//rtnVo.setAppKindCode(vo.getAppKindCode().get(index));
		rtnVo.setAppDescCode(vo.getAppDescCode().get(index));
		rtnVo.setMemberNo(vo.getMemberNo().get(index));
		rtnVo.setMemberName(vo.getMemberName().get(index));
		rtnVo.setOrd(vo.getOrd().get(index));
		
		rtnVo.setsPos1(vo.getsPos1().get(index));
		rtnVo.setsOrganCode(vo.getsOrganCode().get(index));
		rtnVo.setsPos2(vo.getsPos2().get(index));
		rtnVo.setsClubName(vo.getsClubName().get(index));
		return rtnVo;
	}

	@Override
	public List<SM1_11VO_DATA> selectList(SM1_11VO vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public int reorderList(SM1_11VO vo) throws Exception {
		int cnt = dao.reorderList(vo);
		return cnt;
	}
}