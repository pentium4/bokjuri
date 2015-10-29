package lionsclubs.com.SM1.SM1_1.SM1_02;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class SM1_02DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_1.SM1_02.";
	
	/**
	 * 권한그룹 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<SM1_02VO> selectList(SM1_02VO vo) throws Exception {
        return list(commonId + "selectList", vo);
    }
	
	/**
	 * 화면권한 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<SM1_02VO> selectUiAuthList(SM1_02VO vo) throws Exception {
        return list(commonId + "selectUiAuthList", vo);
    }
	
	/**
	 * 직책등록 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<SM1_02VO> selectOrganList(SM1_02VO vo) throws Exception {
        return list(commonId + "selectOrganList", vo);
    }
	
	/**
	 * 권한그룹 추가
	 * @param vo
	 * @throws Exception
	 */
	public void insert(SM1_02VO vo) throws Exception {
		insert(commonId + "insert", vo);
	}
	public void update(SM1_02VO vo) throws Exception {
		update(commonId + "update", vo);
	}
	
	/**
     * 권한그룹 삭제
     */
    public void delete(SM1_02VO vo){
    	delete(commonId + "delete", vo);
    }
    /**
     * 화면권한 삭제
     */
    public void deleteUiAuth(SM1_02VO vo){
    	delete(commonId + "deleteUiAuth", vo);
    }
    
    /**
     * 화면권한 수정
     */
    public void updateSelect(SM1_02VO vo){
    	update(commonId + "updateSelect", vo);
    }
    public void updateInput(SM1_02VO vo){
    	update(commonId + "updateInput", vo);
    }
    
    /**
     * 직책권한 수정
     */
    public void updateUpdate(SM1_02VO vo){
    	update(commonId + "updateUpdate", vo);
    }
    
    /**
     * 직책권한 삭제
     */
    public void deleteTitle(SM1_02VO vo){
    	delete(commonId + "deleteTitle", vo);
    }
    
    /**
     * 권한그룹 - 권한조직 수정
     */
    public void limitUpdate(SM1_02VO vo){
    	update(commonId + "limitUpdate", vo);
    }
}
