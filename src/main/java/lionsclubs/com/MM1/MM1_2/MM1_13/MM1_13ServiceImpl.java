package lionsclubs.com.MM1.MM1_2.MM1_13;

import java.util.List;

import lionsclubs.com.MM2.MM2_2.MM2_14.MM2_14DAO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_13ServiceImpl extends AbstractServiceImpl implements MM1_13Service{
	
	@Autowired private MM1_13DAO dao;
	@Autowired private MM2_14DAO dao14;

	@Override
	public List<MM1_13VO> List(MM1_13VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public MM1_13VO Select(MM1_13VO vo) throws Exception {
		return dao.Select(vo);
	}

	@Override
	public String SelectOrganCode(MM1_13VO vo) throws Exception {
		return dao.SelectOrganCode(vo);
	}
	
	@Override
	public String SelectPositionCode(MM1_13VO vo) throws Exception {
		return dao.SelectPositionCode(vo);
	}

	@Override
	public String Insert(MM1_13VO vo) throws Exception {
		String message = insertProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getCaYm()+ "(회기년월) 지구직책 정보가 없습니다.");
				sMessage = vo.getCaYm()+ "(회기년월) 지구직책 정보가 없습니다.";
				break;
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;		
	}

	public String insertProcess(MM1_13VO vo) throws Exception {
		/*
		 * 정산현황 체크
		 */
		int calcount = dao.SelectCalCount(vo);
		if(calcount == 0) {
			dao.InsertCal(vo);
		}
		
		vo.setTargetPositionCode(SelectPositionCode(vo));
		if(StringUtils.isEmpty(vo.getTargetPositionCode())){
			return "90";
		}
		
		/*
		1. 분담금 - 마스터 저장 
		 */
		vo.setIdnNo(dao.InsertMaster(vo));
		/*
		 *	2. 분담금 - 부과금 저장
		 */
		vo.setTargetPositionCode(SelectPositionCode(vo));
		
		dao.InsertImpost(vo);			
		
		return "1";
	}
	
	
	@Override
	public String Update(MM1_13VO vo) throws Exception {
		/*
		 * 정산현황이 마감되지 않았을때만 수정 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		if(!"Y".equals(confirmyn)){
			vo.setPaymentSum(dao.SelectPaymentSum(vo));
			int dsum = vo.getImpost() - vo.getPaymentSum();
			/*
			 * 총부과금을 넘을때... 
			 */
			if(dsum < 0) {
				confirmyn = "A";
			}else{
				dao.UpdateImpost(vo);
			}
		}
		return confirmyn;
	}

	@Override
	public String Delete(MM1_13VO vo) throws Exception {
		String message = deleteProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("납부금이 존재 합니다.\n납부금을 삭제후 부과금을 삭제해 주세요.");
				sMessage = "납부금이 존재 합니다.\n납부금을 삭제후 부과금을 삭제해 주세요.";
				break;
			default:
				log.debug("삭제 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;		
	}

	public String deleteProcess(MM1_13VO vo) throws Exception {
		if(dao.SelectPaymentSum(vo) > 0){
			return "90";
		}
		
		// 부과금 삭제
		dao.DeleteImpost(vo);
		
		// 마스터 삭제
		dao.DeleteMaster(vo);
		
		return "1";
	}
	
	@Override
	public String InsertPayment(MM1_13VO vo) throws Exception {
		/*
		 * 정산현황 체크
		 */
		vo.setCaYm(vo.getPaymentDate().substring(0,6));				
		int calcount = dao.SelectCalCount(vo);
		if(calcount == 0) {
			dao.InsertCal(vo);
		} 
		
		/*
		 * 정산현황이 마감되지 않았을때만 저장 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		if(!"Y".equals(confirmyn)){
			vo.setPaymentSum(dao.SelectPaymentSum(vo));
			int dsum = vo.getImpost() - (vo.getPaymentSum() + vo.getPayment());
			
			/*
			 * 총부과금을 넘을때... 
			 */
			if(dsum < 0) {
				confirmyn = "A";
			}else{
				/*
				 * 납부금 저장 
				 */
				vo.setPaymentFinish("Y");
				vo.setPaymentCount(dao.InsertPayment(vo));
				
				this.incomeExpendProcess(vo);				
			}
		}
		return confirmyn;
	}

	@Override
	public String UpdatePayment(MM1_13VO vo) throws Exception {
		/*
		 * 정산현황 체크
		 */
		vo.setCaYm(vo.getPaymentDate().substring(0,6));				
		int calcount = dao.SelectCalCount(vo);
		if(calcount == 0) {
			dao.InsertCal(vo);
		} 
		
		/*
		 * 정산현황이 마감되지 않았을때만 저장 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		if(!"Y".equals(confirmyn)){
			vo.setPaymentSum(dao.SelectPaymentSumQ(vo));
			int dsum = vo.getImpost() - (vo.getPaymentSum() + vo.getPayment());
			
			/*
			 * 총부과금을 넘을때... 
			 */
			if(dsum < 0) {
				confirmyn = "A";
			}else{
				vo.setPaymentFinish("Y");
				dao.UpdatePaymentCount(vo);
				
				dao.deleteIncomeExpend(vo);
				this.incomeExpendProcess(vo);
			}
		}
		return confirmyn;
	}

	@Override
	public String DeletePayment(MM1_13VO vo) throws Exception {
		vo.setCaYm(vo.getPaymentDate().substring(0,6));
		String confirmyn = dao.SelectCal(vo);
		if(!"Y".equals(confirmyn)){
			dao.DeletePaymentCount(vo);
			
			dao.deleteIncomeExpend(vo);
		}
		return confirmyn;
	}
	
	/**
	 * 지구관리 > 임원선임/분담금
	 * 	1. 정산현황 체크
	 *  2. 납부금이 있으면 삭제 안함
	 */
	@Override
	public String Delete2(MM1_13VO vo) throws Exception {
		Integer p = 0;
		/*
		 * 정산현황 : 정산 확정여부 체크
		 */
		String confirmyn = dao.SelectCalLock(vo);
		List<MM1_13VO> delList = null;		
		if(!"Y".equals(confirmyn)){
			delList = dao.SelectDeleteList(vo);
			for (int i = 0; i < delList.size(); i++) {
				vo.setIdnNo(delList.get(i).getIdnNo());
				
				/*
				 * 완료가 아닐경우 - 수입예산/지출예산 으로 들어간 데이터 삭제
				 */
				dao.deleteIncomeExpend(vo);
				
				//--------------------------------------------------------------------------
				p = dao.DeletePayment(vo);
				if(p >= 0) {
					p = dao.DeleteImpost(vo);		
				}
				if(p >= 0) {
					p = dao.DeleteMaster(vo);		
				}
			}
		}
		
		return confirmyn;
	}
	
	/**
	 * 지구관리 > 임원선임/분담금
	 * 	1. 정산현황 체크
	 *  2. 분담금 처리시 체크
	 */
	@Override
	public String Check2(MM1_13VO vo) throws Exception {
		/*
		 * 정산현황이 마감되지 않았을때만 삭제 가능!! 
		 */
		String confirmyn = dao.SelectCalLock(vo);
		int psum = 0;
		int isum = 0;
		
		if(!"Y".equals(confirmyn)){
			if(dao.SelectImpostSum33(vo) != null){
				isum = dao.SelectImpostSum33(vo);		// 부과금
				psum = dao.SelectPaymentSum33(vo);		// 납부한 금액 총액
				
				if(vo.getImpost() == isum && isum > 0){
					confirmyn = "EQUAL";				// 기존 부과금과 새로운 부과금이 같을 경우
				}else if(vo.getImpost() > isum && isum > 0){
					confirmyn = "MANY";					// 기존 부과금보다 새로운 부과금이 많을 경우 (많은 금액으로 부과금만 업데이트한다.) 
				}else{
					if(psum > vo.getImpost() && isum > 0){
						confirmyn = "P";				// 납부금한 금액보다 새로운 부과금이 적을 경우 변경하지 않는다.
					}
					if(psum < vo.getImpost() && isum > vo.getImpost()){
						confirmyn = "EQUAL";			// 납부한 금액보다는 크고 기존 부과금보다는 적을 경우 변경하지 않는다.
					}
				}
			} else {
				confirmyn = "N";	
			}
		}
		
		return confirmyn;
	}
	
	/**
	 * 지구관리 > 임원선임/분담금
	 * 	1. 정산현황 체크
	 *  2. 분담금 INSERT 
	 */
	@Override
	public String Insert2(MM1_13VO vo) throws Exception {
		String confirmyn = "N";
		/*
		 * 정산현황 체크
		 */		
		int calcount = dao.SelectCalCount(vo);
		if(calcount == 0) {
			dao.InsertCal(vo);
		}
		
		/*
			1. 분담금 - 마스터 저장 
		 */
		vo.setIdnNo(dao.InsertMaster(vo));
		/*
		 *	2. 분담금 - 부과금 저장
		 */
		if(StringUtils.isEmpty(vo.getTargetPositionCode())) {
			vo.setTargetPositionCode(SelectPositionCode(vo));
			confirmyn = "E";
		}else{
			dao.InsertImpost(vo);	
		}
		
		return confirmyn;
	}
	
	/**
	 * 지구관리 > 임원선임/분담금
	 * 2014-08-29 : 부과금만 수정한다.
	 */
	@Override
	public String Update2(MM1_13VO vo) throws Exception {
		dao.UpdateImpost2(vo);
		return "N";
	}
	
	/**
	 * 임원분담금 데이터로 [지출, 지출예산, 수입예산] 데이터 추가하기  : 2014-07-22
	 * @throws Exception
	 */
	public void incomeExpendProcess(MM1_13VO vo) throws Exception {
		// 결손일 경우
		if("Y".equals(vo.getPaymentDefect())){
//			vo.setClassItemCode("1120");
//			vo.setDetailItemCode("1000");	/* 결손금 */
//			vo.setInexCode("1010");	/* 그룹코드 : 8510 [ 지출 : 1010 ] */
//			dao.insertIncomeExpend(vo);	/* 수입/지출 테이블에 결손금 지출로 입력한다. */
			
		// 결손이 아닐경우
		} else {
			vo.setClassItemCode("1040");
			vo.setDetailItemCode("1030");	/* 임원분담금  */
			vo.setInexCode("1010");	/* 그룹코드 : 8510 [ 지출 : 1010 ] */
			dao.insertIncomeExpend(vo);	/* 수입/지출 테이블에 분담금 지출로 입력한다. */
		}
	}
}
