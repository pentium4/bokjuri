package lionsclubs.com.SM1.SM1_2.SM1_06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_06ServiceImpl extends AbstractServiceImpl implements SM1_06Service{

	@Autowired
	private SM1_06DAO dao;
	
	/**
	 * 그룹코드 조회
	 */
	@Override
	public List<SM1_06VO> SM1_06(SM1_06VO vo) throws Exception {
		return dao.SM1_06(vo);
	}
	
	/**
	 * 그룹코드 조회
	 */
	@Override
	public SM1_06VO SM1_06_Object(SM1_06VO vo) throws Exception {
		return dao.SM1_06_Object(vo);
	}
	
	/**
	 * 그룹코드 입력
	 */
	@Override
	public void SM1_06_InputInsert(SM1_06VO vo) throws Exception {
		dao.SM1_06_InputInsert(vo);
	}
	
	/**
	 * 그룹코드 수정
	 */
	@Override
	public Integer SM1_06_EditUpdate(SM1_06VO vo) throws Exception {
		return dao.SM1_06_EditUpdate(vo);
	}
	
	/**
	 * 그룹코드 삭제
	 */
	@Override
	public Integer SM1_06_Delete(SM1_06VO vo) throws Exception {
		return dao.SM1_06_Delete(vo);
	}
}
