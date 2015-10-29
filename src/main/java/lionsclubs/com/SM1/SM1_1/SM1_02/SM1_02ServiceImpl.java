package lionsclubs.com.SM1.SM1_1.SM1_02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import lionsclubs.com.SM1.SM1_1.SM1_02.SM1_02VO;

@Service
public class SM1_02ServiceImpl extends AbstractServiceImpl implements SM1_02Service{

	@Autowired
	private SM1_02DAO dao;

	@Override
	public List<SM1_02VO> selectList(SM1_02VO vo) throws Exception {
		return (List<SM1_02VO>)dao.selectList(vo);
	}

	@Override
	public List<SM1_02VO> selectUiAuthList(SM1_02VO vo) throws Exception {
		return (List<SM1_02VO>)dao.selectUiAuthList(vo);
	}
	
	@Override
	public void insert(SM1_02VO vo) throws Exception {
		/*
		 *  시스템권한 그룹관리 저장
		 */
		dao.insert(vo);
		
	}
	
	@Override
	public void update(SM1_02VO vo) throws Exception {
		
		/*
		 *  시스템권한 그룹관리 수정
		 */
		dao.update(vo);
		
	}

	@Override
	public void delete(SM1_02VO vo) throws Exception {
		dao.deleteUiAuth(vo);
		dao.deleteTitle(vo);
		//
		dao.delete(vo);		
	}

	@Override
	public void updateAuth(SM1_02VO vo) throws Exception {
		
		dao.deleteUiAuth(vo);
		dao.deleteTitle(vo);
		
		List<String> sArray = vo.getSelectArray();
		List<String> iArray = vo.getInputArray();
		List<String> tArray = vo.getTitleArray();
		List<String> uArray = vo.getUinoArray();
		
		for (int i = 0; i < sArray.size(); i++) {
			vo.setSelect(sArray.get(i));
			vo.setUiNo(uArray.get(i));
			
			if("Y".equals(vo.getSelect())){
				dao.updateSelect(vo);		/* 화면권한 - 조회 */
			}
		}
		
		for (int i = 0; i < iArray.size(); i++) {
			vo.setInput(iArray.get(i));
			vo.setUiNo(uArray.get(i));
			
			if("Y".equals(vo.getInput())){
				dao.updateInput(vo);		/* 화면권한 - 저장 */
			}
		}
		
		for (int i = 0; i < tArray.size(); i++) {
			vo.setTitleCode(tArray.get(i));
			if(!"N".equals(vo.getTitleCode())){
				dao.updateUpdate(vo);		/* 직책권한 - 저장 */
			}
		}
		
	}

	@Override
	public List<SM1_02VO> selectOrganList(SM1_02VO vo)
			throws Exception {
		return (List<SM1_02VO>)dao.selectOrganList(vo);
	}

	@Override
	public void limitupdate(SM1_02VO vo) throws Exception {
		dao.limitUpdate(vo);
	}

	
}
