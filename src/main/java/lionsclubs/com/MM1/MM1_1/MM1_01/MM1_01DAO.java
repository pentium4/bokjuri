package lionsclubs.com.MM1.MM1_1.MM1_01;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_01DAO extends LionsAbstractDAO{

	private String commonId = "lionsclubs.com.MM1.MM1_1.MM1_01.";

	public MM1_01VO MM1_01(MM1_01VO vo){
		return (MM1_01VO)selectByPk(commonId + "MM1_01", vo);
	}
	
	public void profileInsert(MM1_01VO vo) throws Exception {
		insert(commonId + "profileInsert", vo);
	}
	
	public Integer profileUpdate(MM1_01VO vo) throws Exception {
		return update(commonId + "profileUpdate", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM1_01VO> recommMemberList(MM1_01VO vo) throws Exception {
		return list(commonId + "recommMemberList", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM1_01VO> duplicate(MM1_01VO vo) throws Exception {
		return list(commonId + "duplicate", vo);
	}
	
	/**
	 * 회원번호와 성명 또는 생년월일 중복체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer duplicateCheck(MM1_01VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "duplicateCheck", vo);
	}

	/**
	 * 성명과 생년월일 중복체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer duplicateCheck2(MM1_01VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "duplicateCheck2", vo);
	}
	
	/**
	 * 인사기본 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer hrUpdate(MM1_01VO vo) throws Exception {
		return update(commonId + "hrUpdate", vo);
	}
	
	/**
	 * 이전/다음 memberNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_01VO memberNo(MM1_01VO vo) throws Exception {
		return (MM1_01VO) selectByPk(commonId + "memberNo", vo);
	}	
}
