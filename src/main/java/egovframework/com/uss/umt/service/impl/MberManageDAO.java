package egovframework.com.uss.umt.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *
 * </pre>
 */
@Repository("mberManageDAO")
public class MberManageDAO extends EgovComAbstractDAO{
	
    /** Log Info */
    protected Log log = LogFactory.getLog(this.getClass());

    /**
     * 기 등록된 특정 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param userSearchVO 검색조건
     * @return List<MberManageVO> 기업회원 목록정보
     */
    public List<MberManageVO> selectMberList(UserDefaultVO userSearchVO){
        return list("mberManageDAO.selectMberList", userSearchVO);
    }
    
    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return int 일반회원총갯수
     */
    public int selectMberListTotCnt(UserDefaultVO userSearchVO) {
        return (Integer)getSqlMapClientTemplate().queryForObject("mberManageDAO.selectMberListTotCnt", userSearchVO);
    }
    
    /**
     * 화면에 조회된 일반회원의 정보를 데이터베이스에서 삭제
     * @param delId 삭제 대상 일반회원아이디
     */
    public void deleteMber(String delId){
        delete("mberManageDAO.deleteMber_S", delId);
    }

    /**
     * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     * @param mberManageVO 일반회원 등록정보
     * @return String 등록결과
     */
    public String insertMber(MberManageVO mberManageVO){
        return (String)insert("mberManageDAO.insertMber_S", mberManageVO);
    }
    
    /**
     * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param mberId 상세조회대상 일반회원아이디
     * @return MberManageVO 일반회원 상세정보
     */
    public MberManageVO selectMber(String mberId){
        return (MberManageVO) selectByPk("mberManageDAO.selectMber_S", mberId);
    }

    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param mberManageVO 일반회원수정정보
     */
    public void updateMber(MberManageVO mberManageVO){
        update("mberManageDAO.updateMber_S",mberManageVO);
    }
    
    /**
     * 일반회원 약관확인
     * @param stplatId 일반회원약관아이디
     * @return List 일반회원약관정보
     */
    public List selectStplat(String stplatId){
    	return list("mberManageDAO.selectStplat_S", stplatId);
    }
    
    /**
     * 일반회원 암호수정
     * @param passVO 기업회원수정정보(비밀번호)
     */
    public void updatePassword(MberManageVO passVO) {
        update("mberManageDAO.updatePassword_S", passVO);
    }
    
    /**
     * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     * @param mberManageVO 일반회원암호 조회조건정보
     * @return MberManageVO 일반회원 암호정보
     */
    public MberManageVO selectPassword(MberManageVO mberManageVO){
    	return (MberManageVO) selectByPk("mberManageDAO.selectPassword_S", mberManageVO);
    }

}