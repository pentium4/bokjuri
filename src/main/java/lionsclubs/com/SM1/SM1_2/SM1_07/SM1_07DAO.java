package lionsclubs.com.SM1.SM1_2.SM1_07;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_07DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_2.SM1_07.";
	
	/**
	 * 코드 조회
	 * @param vo
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_07VO> SM1_07(SM1_07VO vo) throws Exception{
		return list(commonId + "SM1_07", vo);
	}
	
	/**
	 * 코드 입력
	 * @param vo
	 * @throws Exception
	 */
	public void SM1_07_InputInsert(SM1_07VO vo) throws Exception{
		insert(commonId + "SM1_07_InputInsert", vo);
	}
	
	/**
	 * 코드 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SM1_07_EditUpdate(SM1_07VO vo) throws Exception{
		return update(commonId + "SM1_07_EditUpdate", vo);
	}
	
	/**
	 * 코드 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SM1_07_Delete(SM1_07VO vo) throws Exception{
		return delete(commonId + "SM1_07_Delete", vo);
	}
	
	/**
	 * 그룹코드 select box 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_07VO> selectGroupCode() throws Exception{
		return list(commonId + "selectGroupCode", null);
	}
}
