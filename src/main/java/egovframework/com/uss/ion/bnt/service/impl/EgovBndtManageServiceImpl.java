package egovframework.com.uss.ion.bnt.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import egovframework.com.uss.ion.bnt.service.BndtCeckManage;
import egovframework.com.uss.ion.bnt.service.BndtCeckManageVO;
import egovframework.com.uss.ion.bnt.service.BndtDiary;
import egovframework.com.uss.ion.bnt.service.BndtDiaryVO;
import egovframework.com.uss.ion.bnt.service.BndtManage;
import egovframework.com.uss.ion.bnt.service.BndtManageVO;
import egovframework.com.uss.ion.bnt.service.EgovBndtManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.excel.EgovExcelService;

/**
 * 개요
 * - 당직관리에 대한 ServiceImpl 클래스를 정의한다.
 *
 * 상세내용
 * - 당직관리에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 당직관리의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 이용
 * @version 1.0
 * @created 06-15-2010 오후 2:08:56
 */


@Service("egovBndtManageService")
public class EgovBndtManageServiceImpl extends AbstractServiceImpl implements EgovBndtManageService {

	@Resource(name = "excelZipService")
    private EgovExcelService excelZipService;

	protected Log log = LogFactory.getLog(this.getClass());

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver mailmultipartResolver;

	@Resource(name="bndtManageDAO")
    private BndtManageDAO bndtManageDAO;

	/**
	 * 당직관리정보를 관리하기 위해 등록된 당직관리 목록을 조회한다.
	 * @param bndtManageVO - 당직관리 VO
	 * @return List - 당직관리 목록
	 */
	public List<BndtManageVO> selectBndtManageList(BndtManageVO bndtManageVO) throws Exception{
		return bndtManageDAO.selectBndtManageList(bndtManageVO);
	}

	/**
	 * 당직관리목록 총 갯수를 조회한다.
	 * @param bndtManageVO - 당직관리 VO
	 * @return int - 당직관리 카운트 수
	 */
	public int selectBndtManageListTotCnt(BndtManageVO bndtManageVO) throws Exception {
		return bndtManageDAO.selectBndtManageListTotCnt(bndtManageVO);
	}

	/**
	 * 등록된 당직관리의 상세정보를 조회한다.
	 * @param bndtManageVO - 당직관리 VO
	 * @return BndtManageVO - 당직관리 VO
	 */
	public BndtManageVO selectBndtManage(BndtManageVO bndtManageVO) throws Exception {
		bndtManageVO.setBndtDe(EgovStringUtil.removeMinusChar(bndtManageVO.getBndtDe()));
		BndtManageVO bndtManageVOTemp = new BndtManageVO();
		bndtManageVOTemp = bndtManageDAO.selectBndtManage(bndtManageVO);
		bndtManageVOTemp.setBndtDe(EgovDateUtil.formatDate(bndtManageVOTemp.getBndtDe(), "-"));

		return bndtManageVOTemp;
	}

	/**
	 * 당직관리정보를 신규로 등록한다.
	 * @param bndtManage - 당직관리 model
	 */
	public void insertBndtManage(BndtManage bndtManage) throws Exception {
		bndtManage.setBndtDe(EgovStringUtil.removeMinusChar(bndtManage.getBndtDe()));
		bndtManageDAO.insertBndtManage(bndtManage);
	}

	/**
	 * 기 등록된 당직관리정보를 수정한다.
	 * @param bndtManage - 당직관리 model
	 */
	public void updtBndtManage(BndtManage bndtManage) throws Exception {
		bndtManage.setBndtDe(EgovStringUtil.removeMinusChar(bndtManage.getBndtDe()));
		bndtManageDAO.updtBndtManage(bndtManage);
	}

	/**
	 * 기 등록된 당직관리정보를 삭제한다.
	 * @param bndtManage - 당직관리 model
	 */
	public void deleteBndtManage(BndtManage bndtManage) throws Exception {
		bndtManage.setBndtDe(EgovStringUtil.removeMinusChar(bndtManage.getBndtDe()));
		bndtManageDAO.deleteBndtManage(bndtManage);
	}

    /**
	 * 당직일지 갯수를 조회한다.
	 * @param bndtManage - 당직관리
	 * @return int
	 * @exception Exception
	 */
    public int selectBndtDiaryTotCnt(BndtManage bndtManage) throws Exception {
    	bndtManage.setBndtDe(EgovStringUtil.removeMinusChar(bndtManage.getBndtDe()));
		return bndtManageDAO.selectBndtDiaryTotCnt(bndtManage);
	}

    /***** 당직 체크관리 *****/

	/**
	 * 당직체크관리정보를 관리하기 위해 등록된 당직체크관리 목록을 조회한다.
	 * @param bndtCeckManageVO - 당직체크관리 VO
	 * @return List - 당직체크관리 목록
	 */
	public List<BndtCeckManageVO> selectBndtCeckManageList(BndtCeckManageVO bndtCeckManageVO) throws Exception{
		return bndtManageDAO.selectBndtCeckManageList(bndtCeckManageVO);
	}

	/**
	 * 당직체크관리목록 총 갯수를 조회한다.
	 * @param bndtCeckManageVO - 당직체크관리 VO
	 * @return int - 당직체크관리 카운트 수
	 */
	public int selectBndtCeckManageListTotCnt(BndtCeckManageVO bndtCeckManageVO) throws Exception {
		return bndtManageDAO.selectBndtCeckManageListTotCnt(bndtCeckManageVO);
	}

	/**
	 * 등록된 당직체크관리의 상세정보를 조회한다.
	 * @param bndtCeckManageVO - 당직체크관리 VO
	 * @return BndtCeckManageVO - 당직체크관리 VO
	 */
	public BndtCeckManageVO selectBndtCeckManage(BndtCeckManageVO bndtCeckManageVO) throws Exception {
		return bndtManageDAO.selectBndtCeckManage(bndtCeckManageVO);
	}

	/**
	 * 당직체크관리정보를 신규로 등록한다.
	 * @param bndtCeckManage - 당직체크관리 model
	 */
	public void insertBndtCeckManage(BndtCeckManage bndtCeckManage) throws Exception {
		bndtManageDAO.insertBndtCeckManage(bndtCeckManage);
	}

	/**
	 * 기 등록된 당직체크관리정보를 수정한다.
	 * @param bndtCeckManage - 당직체크관리 model
	 */
	public void updtBndtCeckManage(BndtCeckManage bndtCeckManage) throws Exception {
		bndtManageDAO.updtBndtCeckManage(bndtCeckManage);
	}

	/**
	 * 기 등록된 당직체크관리정보를 삭제한다.
	 * @param bndtCeckManage - 당직체크관리 model
	 */
	public void deleteBndtCeckManage(BndtCeckManage bndtCeckManage) throws Exception {
		bndtManageDAO.deleteBndtCeckManage(bndtCeckManage);
	}

    /**
	 * 당직체크 중복여부 조회한다.
	 * @param bndtCeckManageVO - 당직체크관리 VO
	 * @return int
	 * @exception Exception
	 */
	public int selectBndtCeckManageDplctAt(BndtCeckManage bndtCeckManage) throws Exception {
		return bndtManageDAO.selectBndtCeckManageDplctAt(bndtCeckManage);
	}


    /***** 당직 일지 *****/

	/**
	 * 등록된 당직일지관리의 상세정보를 조회한다.
	 * @param bndtDiaryVO - 당직일지관리 VO
	 * @return BndtDiaryVO - 당직일지관리 VO
	 */
	public List selectBndtDiary(BndtDiaryVO bndtDiaryVO) throws Exception {
		return bndtManageDAO.selectBndtDiary(bndtDiaryVO);
	}

	/**
	 * 당직일지관리정보를 신규로 등록한다.
	 * @param bndtDiary - 당직일지관리 model
	 * @param diaryForUpdt - String
	 */
	public void insertBndtDiary(BndtDiary bndtDiary, String diaryForInsert) throws Exception {

		BndtDiary bndtDiaryTemp;
		String [] bndtDiaryValues = diaryForInsert.split("[@]");
		String [] sTempBndtDiary;
		String    sTemp=null;
		for (int i=0; i<bndtDiaryValues.length ; i++){
			bndtDiaryTemp = new BndtDiary();
			sTemp = bndtDiaryValues[i];
			sTempBndtDiary = sTemp.split("[$]");
			bndtDiaryTemp.setBndtDe(bndtDiary.getBndtDe());
			bndtDiaryTemp.setBndtId(bndtDiary.getBndtId());
			bndtDiaryTemp.setBndtCeckSe(sTempBndtDiary[0]);
			bndtDiaryTemp.setBndtCeckCd(sTempBndtDiary[1]);
			bndtDiaryTemp.setChckSttus(sTempBndtDiary[2]);
			bndtDiaryTemp.setFrstRegisterId(bndtDiary.getFrstRegisterId());

			bndtManageDAO.insertBndtDiary(bndtDiaryTemp);
		}
	}

	/**
	 * 기 등록된 당직일지관리정보를 수정한다.
	 * @param bndtDiary - 당직일지관리 model
	 * @param diaryForUpdt - String
	 */
	public void updtBndtDiary(BndtDiary bndtDiary, String diaryForUpdt) throws Exception {

		BndtDiary bndtDiaryTemp;
		String [] bndtDiaryValues = diaryForUpdt.split("[@]");
		String [] sTempBndtDiary;
		String    sTemp=null;
		for (int i=0; i<bndtDiaryValues.length ; i++){
			bndtDiaryTemp = new BndtDiary();
			sTemp = bndtDiaryValues[i];
			sTempBndtDiary = sTemp.split("[$]");
			bndtDiaryTemp.setBndtDe(bndtDiary.getBndtDe());
			bndtDiaryTemp.setBndtId(bndtDiary.getBndtId());
			bndtDiaryTemp.setBndtCeckSe(sTempBndtDiary[0]);
			bndtDiaryTemp.setBndtCeckCd(sTempBndtDiary[1]);
			bndtDiaryTemp.setChckSttus(sTempBndtDiary[2]);
			bndtDiaryTemp.setLastUpdusrId(bndtDiary.getLastUpdusrId());

			bndtManageDAO.updtBndtDiary(bndtDiaryTemp);
		}
	}

	/**
	 * 기 등록된 당직일지관리정보를 삭제한다.
	 * @param bndtDiary - 당직일지관리 model
	 */
	public void deleteBndtDiary(BndtDiary bndtDiary) throws Exception {
		bndtManageDAO.deleteBndtDiary(bndtDiary);
	}


	/*###  엑셀 일괄처리 프로세스 ###*/

	/**
	 * 당직자 excel생성
	 * @param  inputStream InputStream
	 * @return  String
	 * @exception Exception
	 */
	public List<BndtManageVO> selectBndtManageBnde(InputStream inputStream)throws Exception{
	    int bndtSheetRowCnt = 0;
	    String xlsFile = null;
	    String sTempNm = null;
	    String sTempId = null;


	    List<BndtManageVO> list = new ArrayList<BndtManageVO>();
	    try {
	    	String   sBndtDe = null;
	    	HSSFWorkbook hssfWB = excelZipService.loadWorkbook(inputStream);
	    	// 엑셀 파일 시트 갯수 확인 sheet = 1
            if(hssfWB.getNumberOfSheets()== 1)
            {
                HSSFSheet bndtSheet  = hssfWB.getSheetAt(0);  //당직자 시트 가져오기
                HSSFRow   bndtRow    = bndtSheet.getRow(1); //당직자 row 가져오기
                bndtSheetRowCnt      = bndtRow.getPhysicalNumberOfCells(); //당직자 cell Cnt
                int rowsCnt=bndtSheet.getPhysicalNumberOfRows(); //행 갯수 가져오기

                for(int j=1; j<rowsCnt; j++){ //row 루프
                	BndtManageVO bndtManageVO = new BndtManageVO();
                    HSSFRow row=bndtSheet.getRow(j); //row 가져오기
                    if(row!=null){
                        int cells = row.getPhysicalNumberOfCells(); //cell 갯수 가져오기
                        HSSFCell cell = null;
                    	cell = row.getCell(0);  //당직일자
                    	if(cell!=null){
                    		 sBndtDe = (String)cell.getStringCellValue();
                    	}
                        cell = row.getCell(1); //당직자ID
                        if(cell!=null){
                	    	sTempId = (String)cell.getStringCellValue();
                    	}
                        cell = row.getCell(2); //당직자명
                        if(cell!=null){
                	    	sTempNm = (String)cell.getStringCellValue();
                    	}
                        bndtManageVO.setTempBndtNm(sTempNm); // 당직자ID
                        bndtManageVO.setTempBndtId(sTempId); // 당직자명
                    	bndtManageVO = bndtManageDAO.selectBndtManageBnde(bndtManageVO);
                    	bndtManageVO.setBndtDe(sBndtDe);
                    	bndtManageVO.setDateWeek(getDateWeekInt(sBndtDe));
                        bndtManageVO.setTempBndtWeek(getDateWeekString(sBndtDe));
                        list.add(bndtManageVO);
                    }
                }
            }
        }catch(Exception e){
        	//e.printStackTrace();
    	    throw e;	// 2011.10.10 보안점검 후속조치
        }
		return  list ;
	}

	/**
	 * 당직정보를 일괄등록처리한다.
	 * @param bndtManageVO     - 당직관리 VO
	 * @param String           - 당직자정보
    */
	public void insertBndtManageBnde(BndtManageVO bndtManageVO,
			                         String checkedBndtManageForInsert) throws Exception {
		BndtManage bndtManage;
		int insertCnt    = 0;
		String [] bndtManageValues = checkedBndtManageForInsert.split("[$]");
		String [] sTempBndtManage;
		String    sTemp=null;

		if(checkedBndtManageForInsert != null && !checkedBndtManageForInsert.equals("")){
			for (int i=0; i<bndtManageValues.length ; i++){
				bndtManage = new BndtManage();
				sTemp = bndtManageValues[i];
				sTempBndtManage = sTemp.split(",");
				bndtManage.setBndtDe(sTempBndtManage[0]);
				bndtManage.setBndtId(sTempBndtManage[1]);
				bndtManage.setRemark("당직일괄등록");
				bndtManage.setFrstRegisterId(bndtManageVO.getFrstRegisterId());

				bndtManageDAO.insertBndtManage(bndtManage);
			}
		}
	}

    /**
	 * 당직관리 건수를 조회한다.
	 * @param bndtManage - 당직관리
	 * @return int
	 * @exception Exception
	 */
    public int selectBndtManageMonthCnt(BndtManageVO bndtManageVO) throws Exception {
		return bndtManageDAO.selectBndtManageMonthCnt(bndtManageVO);
	}

	/**
	 * 해당일자와 현재일자의 일수 계산
	 * @param annvrsryManageVO
	 * @return long
	 */
	private int getDateWeekInt(String sDate) throws Exception{

    	String sDayOfWeek     = null;
    	int    iWeek           = 0;
    	sDayOfWeek = EgovStringUtil.removeMinusChar(sDate);
		Calendar target_day = Calendar.getInstance();
		target_day.set(Integer.parseInt(sDayOfWeek.substring(0,4)),Integer.parseInt(sDayOfWeek.substring(4,6))-1,Integer.parseInt(sDayOfWeek.substring(6,8)));
		iWeek = target_day.get(target_day.DAY_OF_WEEK);
		return iWeek;
	}

	/**
	 * 해당일자와 현재일자의 일수 계산
	 * @param annvrsryManageVO
	 * @return long
	 */
	private String getDateWeekString(String sDate) throws Exception{

    	String sDayOfWeek     = null;
    	String sDayOfWeekReturnValue  = null;
    	sDayOfWeek = EgovStringUtil.removeMinusChar(sDate);
        String[] dayOfWeek={"일","월","화","수","목","금","토"};
        Calendar target_day=new GregorianCalendar();
		target_day.set(Integer.parseInt(sDayOfWeek.substring(0,4)),Integer.parseInt(sDayOfWeek.substring(4,6))-1,Integer.parseInt(sDayOfWeek.substring(6,8)));

		sDayOfWeekReturnValue = EgovDateUtil.formatDate(sDayOfWeek, "-")+" "+dayOfWeek[target_day.get(Calendar.DAY_OF_WEEK)-1];

        return sDayOfWeekReturnValue;

	}
}
