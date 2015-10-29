package lionsclubs.com.SM1.SM1_1.SM1_03;

import java.util.List;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_03ServiceImpl extends AbstractServiceImpl implements SM1_03Service{

	@Autowired
	private SM1_03DAO dao;

	@Override
	public List<SM1_03VO> authGroupList(SM1_03VO vo) throws Exception {
		return dao.authGroupList(vo);
	}

	@Override
	public List<SM1_03VO> organAuthList(SM1_03VO vo) throws Exception {
		return dao.organAuthList(vo);
	}

	@Override
	public List<SM1_03VO> organUiAuthList(SM1_03VO vo) throws Exception {
		return dao.organUiAuthList(vo);
	}
	
	@Override
	public SM1_03VO SelectData(SM1_03VO vo) throws Exception {
		/*
		 * 직책정보 가져오기
		 */
		return dao.SelectData(vo);
	}	

	/**
	 * 조직권한 부여 - 추가
	 */
	@Override
	public void insert(SM1_03VO vo) throws Exception {
		//dao.deleteOrgan(vo);			/* 전체 삭제 */
		
		dao.authManageInsert(vo);
		
		vo.setUseYn("N");
		dao.organAuthInsert(vo);		/* 조직권한 부여 - 추가 */
		
	}

	/**
	 * 조직권한 부여 - 적용
	 */
	@Override
	public void update(SM1_03VO vo) throws Exception {
		
		List<String> oArray = vo.getOrganArray();
		
		dao.authManageInsert(vo);
		dao.updateInOragnN(vo);				/* 조직권한 부여 - 수정전에 전체 USE_YN=N으로 바꿈 */
		for (int i = 0; i < oArray.size(); i++) {
			vo.setOrganCode(oArray.get(i));
			vo.setUseYn("N");
			if(!"N".equals(vo.getOrganCode())){
				vo.setUseYn("Y");
				dao.updateInOragn(vo);		/* 조직권한 부여 - 수정 */
			}			
		}		
	}

	/**
	 * 조직권한 부여 - 삭제
	 */
	@Override
	public void delete(SM1_03VO vo) throws Exception {
		List<String> oArray = vo.getOrganArray();
		
		for (int i = 0; i < oArray.size(); i++) {
			vo.setOrganCode(oArray.get(i));
			if(!"N".equals(vo.getOrganCode())){
				dao.deleteOrganUiAll(vo);		/* 화면권한 부여 - 삭제 */
				dao.deleteOrganAll(vo);			/* 조직권한 부여 - 삭제 */
			}
		}
		
		if(dao.selectOrganEA(vo) == 0){
			dao.deleteManage(vo);				/* 조직권한 부여 - 마스터 삭제 */
		}
	}

	@Override
	public void updateUiAuth(SM1_03VO vo) throws Exception {
		List<String> sArray = vo.getSelectArray();
		List<String> iArray = vo.getInputArray();
		List<String> uArray = vo.getUinoArray();
		
		dao.deleteOrganUiAll(vo);			/* 화면권한 부여 - 삭제 */
		
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
	}

	@Override
	public SM1_03VO objectMoreAuthManage(SM1_03VO vo) throws Exception {
		return dao.objectMoreAuthManage(vo);
	}
	
	@Override
	public Boolean saveMoreAuthManage(SM1_03VO vo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		SM1_03VO objectMoreAuthManage = dao.objectMoreAuthManage(vo);
		
		if(objectMoreAuthManage == null){
			dao.insertMoreAuthManage(vo);
		} else {
			dao.updateMoreAuthManage(vo);
		}
		
		return Boolean.TRUE;
	}
}
