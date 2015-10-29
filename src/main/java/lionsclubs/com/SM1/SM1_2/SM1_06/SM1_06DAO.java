package lionsclubs.com.SM1.SM1_2.SM1_06;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_06DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_2.SM1_06.";
	
	/**
	 * 그룹코드 조회
	 * @param vo
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_06VO> SM1_06(SM1_06VO vo) throws Exception{
		return list(commonId + "SM1_06", vo);
	}
	
	/**
	 * 그룹코드 조회
	 * @param vo
	 * @return
	 * @throws Exception 
	 */
	public SM1_06VO SM1_06_Object(SM1_06VO vo) throws Exception{
		return (SM1_06VO)selectByPk(commonId + "SM1_06_Object", vo);
	}
	
	/**
	 * 그룹코드 입력
	 * @param vo
	 * @throws Exception
	 */
	public void SM1_06_InputInsert(SM1_06VO vo) throws Exception{
		insert(commonId + "SM1_06_InputInsert", vo);
	}
	
	/**
	 * 그룹코드 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SM1_06_EditUpdate(SM1_06VO vo) throws Exception{
		return update(commonId + "SM1_06_EditUpdate", vo);
	}
	
	/**
	 * 그룹코드 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SM1_06_Delete(SM1_06VO vo) throws Exception{
		return delete(commonId + "SM1_06_Delete", vo);
	}	
}
