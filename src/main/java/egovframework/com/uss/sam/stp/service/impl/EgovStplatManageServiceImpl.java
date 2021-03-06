package egovframework.com.uss.sam.stp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.uss.sam.stp.service.EgovStplatManageService;
import egovframework.com.uss.sam.stp.service.StplatManageDefaultVO;
import egovframework.com.uss.sam.stp.service.StplatManageVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;



/**
 * 
 * 약관내용을 처리하는 서비스 구현 클래스
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *
 * </pre>
 */
@Service("StplatManageService")
public class EgovStplatManageServiceImpl extends AbstractServiceImpl implements
        EgovStplatManageService {

    @Resource(name="StplatManageDAO")
    private StplatManageDAO stplatManageDAO;
        
    /** ID Generation */    
	@Resource(name="egovStplatManageIdGnrService")
	private EgovIdGnrService idgenService;

    
    /**
	 * 글을 조회한다.
	 * @param vo
	 * @return 조회한 글
	 * @exception Exception
	 */
    public StplatManageVO selectStplatDetail(StplatManageVO vo) throws Exception {
        StplatManageVO resultVO = stplatManageDAO.selectStplatDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 약관정보 글 목록을 조회한다.
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
    public List selectStplatList(StplatManageDefaultVO searchVO) throws Exception {
        return stplatManageDAO.selectStplatList(searchVO);
    }

    /**
	 * 약관정보 글 총 갯수를 조회한다.
	 * @param searchVO
	 * @return 글 총 갯수
	 */
    public int selectStplatListTotCnt(StplatManageDefaultVO searchVO) {
		return stplatManageDAO.selectStplatListTotCnt(searchVO);
	}
    
	/**
	 * 약관정보 글을 등록한다.
	 * @param vo
	 * @exception Exception
	 */
    public void insertStplatCn(StplatManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
		String	useStplatId = idgenService.getNextStringId();

		vo.setUseStplatId(useStplatId);
		
    	stplatManageDAO.insertStplatCn(vo);    	
    }
    
	/**
	 * 약관정보 글을 수정한다.
	 * @param vo
	 * @exception Exception
	 */
    public void updateStplatCn(StplatManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	           	
    	stplatManageDAO.updateStplatCn(vo);    	
    }

	/**
	 * 약관정보 글을 삭제한다.
	 * @param vo
	 * @exception Exception
	 */
    public void deleteStplatCn(StplatManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
    	stplatManageDAO.deleteStplatCn(vo);    	
    }
    
}
