package lionsclubs.com.MM2.MM2_6.MM2_32;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17Service;
import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17VO_PARAM;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_32ServiceImpl extends AbstractServiceImpl implements MM2_32Service{
	@Autowired private ServletContext servletContext;
	@Autowired private MM2_32DAO dao;
	@Resource private MM2_17Service mm217Service;
	
	private void setPrevVo(MM2_32VO vo, MM2_17VO_PARAM prevVo) throws Exception {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		String realYm = CommonUtil.calcYearMonth(vo.getSessionYear(),vo.getMonth());
		calendar.set(Integer.parseInt(realYm.substring(0, 4)), Integer.parseInt(realYm.substring(4, 6)) - 1, 1);
		calendar.add(Calendar.MONTH, -1); 
		prevVo.setMonth(new SimpleDateFormat("MM").format(calendar.getTime()));
		String newYear = CommonUtil.dateToSessionYear(new SimpleDateFormat("yyyyMMdd").format(calendar.getTime()));
		prevVo.setSessionYear(newYear);
	}
	
	@Override
	public MM2_32VO summary(MM2_32VO vo) throws Exception {
		MM2_17VO_PARAM prevVo = new MM2_17VO_PARAM();
		prevVo.setOrganCode(vo.getOrganCode());
		prevVo.setMonth(vo.getMonth());
		prevVo.setSessionYear(vo.getSessionYear());
		
		if(!"".equals(prevVo.getMonth())) {
			setPrevVo(vo, prevVo);
		}else{
			prevVo.setSessionYear(String.valueOf(Integer.parseInt(prevVo.getSessionYear()) -1));
		}		
		
		/*전월의 이월잔액, 정기예금, 회비미수,기타미수 조회 */
		Map<String,Object> mapPrevCalcData = mm217Service.getBaseCalcInfo(prevVo);
		
		/* 전월잔액 */
		Long prevMonthTotal = (Long) mapPrevCalcData.get("MONTH_TOTAL");
		vo.setPrevMonthTotal(prevMonthTotal);

		/* 전월 정기예금 */
		Long prevDepositTotal = (Long) mapPrevCalcData.get("DEPOSIT_TOTAL");
		vo.setPrevDepositTotal(prevDepositTotal);
		
		MM2_17VO_PARAM mm217Vo = new MM2_17VO_PARAM();
		mm217Vo.setOrganCode(vo.getOrganCode());
		mm217Vo.setMonth(vo.getMonth());
		mm217Vo.setSessionYear(vo.getSessionYear());
		
		/* 회비미수금 조회 */
		Long duesAttempt = mm217Service.getNotIncome1000Total(mm217Vo);
		vo.setDuesAttempt(duesAttempt);
		
		/* 기타미수금 조회 */
		Long notIncomeEtcTotal = mm217Service.getNotIncomeEtcTotal(mm217Vo);
		vo.setNotIncomeEtcTotal(notIncomeEtcTotal);
		
		/* 수입항목 총계 조회 */
		Long incomeTotal = mm217Service.getIncomeTotal(mm217Vo);
		vo.setIncomeTotal(incomeTotal);
		
		/* 지출항목 총계 조회 */
		Long expTotal = mm217Service.getExpTotal(mm217Vo);
		vo.setExpTotal(expTotal);
		
		/* 결손정보 조회 */
		Map<String, Double> depTotalData = mm217Service.getDepTotalInfo(mm217Vo);
		Double depTotal = depTotalData.get("AMOUNT_1000") + depTotalData.get("AMOUNT_CLUB") + depTotalData.get("AMOUNT_ETC");
		vo.setDepTotal(depTotal);
		
		return vo;
	}
	
	@Override
	public List<MM2_32VO> MM2_32(MM2_32VO vo) throws Exception {
		List<MM2_32VO> list = dao.classItemCode(vo);
		
		for(MM2_32VO vo2 : list){
			vo.setClassItemCode(vo2.getClassItemCode());
			vo2.setList(dao.MM2_32(vo));
		}
		
		return list;
	}
	
	@Override
	public Map<String, Object> excelDownload(MM2_32VO vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		modelMap.put("templateFileName", servletContext.getRealPath("") + "/WEB-INF/jsp/lionsclubs/com/MM2/MM2_6/MM2_32/template.xlsx");
		modelMap.put("destFileName", "수지계산서(수입내역)_" + date + ".xlsx");
		
		return modelMap;
	}
}
