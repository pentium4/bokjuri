package lionsclubs.com.MM3.MM3_5.MM3_25;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_25ServiceImpl extends AbstractServiceImpl implements MM3_25Service{
	
	@Autowired
	private MM3_25DAO dao;

	/**
	 * 클럽지구행사 점수 메인 리스트 화면 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<MM3_25VO> mList(MM3_25VO vo) throws Exception {
		
		return dao.mList(vo);
	}

	/**
	 * 클럽지구행사 점수 메인화면 행사추가
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public void mInsert(MM3_25VO vo) throws Exception {
		
		 dao.mInsert(vo);
	}

	/**
	 * 클럽지구행사 점수 메인화면 행사수정(테스트용)
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public Integer mUpdate(MM3_25VO vo) throws Exception {
		
		return dao.mUpdate(vo);
	}
	
	/**
	 * 클럽지구행사 점수 메인화면 행사삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public Integer mDelete(MM3_25VO vo) throws Exception {
		int p = 0;
		p = dao.mDeleteClub(vo);
		p = dao.mDelete(vo);
		return p;
	}

	@Override
	public MM3_25VO SelectEvent(MM3_25VO vo) throws Exception {
		
		return dao.SelectEvent(vo);
	}

	@Override
	public List<MM3_25VO> dList(MM3_25VO vo) throws Exception {
		return dao.dList(vo);
	}

	@Override
	public MM3_25HeadVO HeadList(MM3_25HeadVO vo) throws Exception {
		
		return dao.HeadList(vo);
	}

	@Override
	public MM3_25VO Select(MM3_25VO vo) throws Exception {
		return dao.Select(vo);
	}

	/*
	 * 클럽 점수 입력 및 수정
	 */
	@Override
	public void clubSave(MM3_25VO vo) throws Exception {
		if(vo.getScoreIdnNo() > 0){
			dao.clubUpdate(vo);
		}else{
			dao.clubInsert(vo);
		}
	}

	

}
