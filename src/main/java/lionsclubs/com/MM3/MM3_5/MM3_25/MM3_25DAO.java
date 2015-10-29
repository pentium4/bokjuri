package lionsclubs.com.MM3.MM3_5.MM3_25;

import java.util.List;

import lionsclubs.com.MM2.MM2_1.MM2_02.MM2_02VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

/**
 * @author OZNET
 *
 */

@Repository
public class MM3_25DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_5.MM3_25.";
	
	/**
	 * 메인화면	
	 */
	public List<MM3_25VO> mList(MM3_25VO vo) throws Exception{
		return list(commonId + "List", vo);
	}
	
	/**
	 * 조회화면 리스트(테스트용)
	 */
	public MM3_25VO SelectEvent(MM3_25VO vo) throws Exception{
		return (MM3_25VO) selectByPk(commonId + "SelectEvent", vo);
	}
	/**
	 * 입력화면
	 */
	public void mInsert(MM3_25VO vo) throws Exception{
		insert(commonId + "mInsert", vo);
	}
	
	/**
	 * 수정
	 */
	public Integer mUpdate(MM3_25VO vo) throws Exception{
		return update(commonId + "mUpdate", vo);
	}
	/**
	 * 클럽별 점수 입력 및 수정
	 */
	public void clubInsert(MM3_25VO vo) throws Exception{
		insert(commonId + "clubInsert", vo);
	}
	public Integer clubUpdate(MM3_25VO vo) throws Exception{
		return update(commonId + "clubUpdate", vo);
	}
	
	/**
	 * 삭제
	 */
	public Integer mDelete(MM3_25VO vo) throws Exception{
		return delete(commonId + "mDelete", vo);	
	}
	public Integer mDeleteClub(MM3_25VO vo) throws Exception{
		return delete(commonId + "mDeleteClub", vo);	
	}
	
	/**
	 * 메인화면 조회
	 */
	public List<MM3_25VO> dList(MM3_25VO vo) throws Exception{
		return list(commonId + "detailList", vo);
	}
	
	/**
	 * 화면 상단조회
	 */
	public MM3_25HeadVO HeadList(MM3_25HeadVO vo) throws Exception {
		return (MM3_25HeadVO)selectByPk(commonId + "headInfo", vo);
    }
	
	public MM3_25VO Select(MM3_25VO vo){
		return (MM3_25VO)selectByPk(commonId + "Select", vo);
    }
	
}
