package lionsclubs.com.SM1.SM1_3.SM1_09;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class SM1_09DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.SM1.SM1_3.SM1_09.";
	
	/**
	 * 메뉴리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_09VO> selectList(SM1_09VO vo) throws Exception {
        return list(commonId + "selectList", vo);
    }
	
	/**
	 * 메뉴 입력
	 * @param vo
	 * @throws Exception
	 */
	public void insert(SM1_09VO vo) throws Exception{
		insert(commonId + "insert", vo);
	}
	
	/**
	 * 메뉴 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer update(SM1_09VO vo) throws Exception{
		return update(commonId + "update", vo);
	}
	
	/**
	 * 메뉴 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer delete(SM1_09VO vo) throws Exception{
		return delete(commonId + "delete", vo);
	}
	
	
	/**
	 * 상단메뉴
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_09VO> headerMenuList(String memberNo) throws Exception {
		return list(commonId + "headerMenuList", memberNo);
	}
	
	/**
	 * 왼쪽메뉴
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SM1_09VO> leftMenuList(String memberNo) throws Exception {
		return list(commonId + "leftMenuList", memberNo);
	}
	
	/**
	 * 메뉴타이틀
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public SM1_09VO menuTitle(String menuId) throws Exception {
		return (SM1_09VO) selectByPk(commonId + "menuTitle", menuId);
	}
	
	/**
	 * 메뉴권한조회
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public SM1_09VO menuAuthorization(Map<String, Object> map) throws Exception {
		return (SM1_09VO) selectByPk(commonId + "menuAuthorization", map);
	}
}
