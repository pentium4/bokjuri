package lionsclubs.com.SM1.SM1_1.SM1_03;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_03DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_1.SM1_03.";
	
	/**
	 * 권한그룹 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_03VO> authGroupList(SM1_03VO vo) throws Exception {
		return list(commonId + "authGroupList", vo);
    }
	
	/**
	 * 권한그룹 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_03VO> organAuthList(SM1_03VO vo) throws Exception {
		return list(commonId + "organAuthList", vo);
    }
	
	
	
	/**
	 * 권한그룹 선택 - 추가창에서 호출하는 권한그룹 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<SM1_03VO> organUiAuthList(SM1_03VO vo) throws Exception {
        return list(commonId + "organUiAuthList", vo);
    }
	
	/**
	 * 직책 가져오기
	 */
	public SM1_03VO SelectData(SM1_03VO vo) throws Exception {
		return (SM1_03VO)selectByPk(commonId + "SelectData", vo);
	}
	
	/**
	 * 조직권한 추가 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void authManageInsert(SM1_03VO vo) throws Exception{
		insert(commonId + "authManageInsert", vo);
	}
	
	public void organAuthInsert(SM1_03VO vo) throws Exception {
		insert(commonId + "organAuthInsert", vo);
    }
	
	/**
	 * 화면권한 부여 - 화면 UI별 저장
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	public void updateSelect(SM1_03VO vo) throws Exception {
		update(commonId + "updateSelect", vo);
    }
	
	public void updateInput(SM1_03VO vo) throws Exception {
		update(commonId + "updateInput", vo);
    }
    
    /**
     * 조직권한 부여 - 적용 버튼
     */
    public void updateInOragnN(SM1_03VO vo){
    	/*
    	 * 수정전에..전체 사용 N으로 셋팅!!!
    	 */
    	update(commonId + "updateInOragnN", vo);
    }
    
    public void updateInOragn(SM1_03VO vo){
    	update(commonId + "updateInOragn", vo);
    }
	
	/**
	 * 조직권한 부여 - 삭제 버튼
	 */
    public void deleteOrganUiAll(SM1_03VO vo){
    	delete(commonId + "deleteOrganUiAll", vo);
    }
    
    public void deleteOrganAll(SM1_03VO vo){
    	delete(commonId + "deleteOrganAll", vo);
    }
    
    public void deleteManage(SM1_03VO vo){
    	delete(commonId + "deleteManage", vo);
    }
    
	public int selectOrganEA(SM1_03VO vo){
    	return (Integer) selectByPk(commonId + "eaSelect", vo);
    }
    
    /**
     * 추가권한 상세
     * @param vo
     * @return
     * @throws Exception
     */
	public SM1_03VO objectMoreAuthManage(SM1_03VO vo) throws Exception {
		return (SM1_03VO)selectByPk(commonId + "objectMoreAuthManage", vo);
	}
	
	public Boolean insertMoreAuthManage(SM1_03VO vo){
		insert(commonId + "insertMoreAuthManage", vo);
    	return Boolean.TRUE;
    }	
	
    public Integer updateMoreAuthManage(SM1_03VO vo){
    	return update(commonId + "updateMoreAuthManage", vo);
    }	
}
