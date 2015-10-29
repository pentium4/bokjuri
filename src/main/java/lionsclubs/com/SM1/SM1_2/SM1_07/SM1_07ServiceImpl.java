package lionsclubs.com.SM1.SM1_2.SM1_07;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_07ServiceImpl extends AbstractServiceImpl implements SM1_07Service{

	@Autowired
	private SM1_07DAO dao;
	
	/**
	 * 코드 조회
	 */
	@Override
	public List<SM1_07VO> SM1_07(SM1_07VO vo) throws Exception {
		return dao.SM1_07(vo);
	}
	
	/**
	 * 코드 입력
	 */
	@Override
	public void SM1_07_InputInsert(SM1_07VO vo) throws Exception {
		dao.SM1_07_InputInsert(vo);
	}
	
	/**
	 * 코드 수정
	 */
	@Override
	public Integer SM1_07_EditUpdate(SM1_07VO vo) throws Exception {
		return dao.SM1_07_EditUpdate(vo);
	}
	
	/**
	 * 코드 삭제
	 */
	@Override
	public Integer SM1_07_Delete(SM1_07VO vo) throws Exception {
		return dao.SM1_07_Delete(vo);
	}
	
	/**
	 * 그룹코드 select box 리스트
	 */
	@Override
	public List<SM1_07VO> selectGroupCode() throws Exception {
		return dao.selectGroupCode();
	}
}
