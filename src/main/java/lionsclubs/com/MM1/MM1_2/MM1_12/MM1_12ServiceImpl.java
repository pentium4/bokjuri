package lionsclubs.com.MM1.MM1_2.MM1_12;

import java.util.List;

import lionsclubs.com.MM1.MM1_2.MM1_13.MM1_13VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_12ServiceImpl extends AbstractServiceImpl implements MM1_12Service{
	@Autowired private MM1_12DAO dao;

	@Override
	public List<MM1_12VO> List(MM1_12VO vo) throws Exception {
		return dao.List(vo);
	}
	
	@Override
	public MM1_12VO Select(MM1_12VO vo) throws Exception {
		return dao.Select(vo);
	}

	@Override
	public String SelectOrganCode(MM1_12VO vo) throws Exception {
		MM1_12VO aa = dao.SelectOrganCode(vo);
		return aa.getOrganCode();
	}

	@Override
	public String Insert(MM1_12VO vo) throws Exception {
		String message = insertProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug(vo.getCaYm()+ "(회기년월)의 환율데이터가 없으므로 입력이 불가합니다.");
				sMessage = vo.getCaYm()+ "(회기년월)의 환율데이터가 없으므로 입력이 불가합니다.";
				break;
			default:
				log.debug("입력 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;
	}
	
	public String insertProcess(MM1_12VO vo) throws Exception {
		/*
		 * 정산현황 체크
		 */
		int calcount = dao.SelectCalCount(vo);
		if(calcount == 0) {
			dao.InsertCal(vo);
		}
		
		int d = 0;
		/* LCIF기금 */
		if("1000".equals(vo.getDetailItemCode()) 
				&& "Y".equals(vo.getXdata())){
			d = dao.SelectDollar(vo);
			if(d > 0) { 
				vo.setPersonalImpost(vo.getImpost());
				vo.setImpost(d * vo.getImpost());			/* LCIF기금 : 납부금 입력시 : 환율 저장 */
				
			}else{
				return "90";
			}
		}
		
		/*
		1. 약정금 - 마스터 저장 
		 */
		vo.setIdnNo(dao.InsertMaster(vo));
		/*
		 *	2. 약정금 - 부과금 저장
		 */
		dao.InsertImpost(vo);
		
		return "1";
	}	

	@Override
	public String Update(MM1_12VO vo) throws Exception {
		/*
		 * 정산현황이 마감되지 않았을때만 수정 가능!! 
		 */
		String confirmyn = dao.SelectCal(vo);
		
		int d = 0;
		float dsum = 0;
		boolean acheck = true;
		if(!"Y".equals(confirmyn)){
			/* LCIF기금 */
			if("1000".equals(vo.getDetailItemCode()) 
					&& "Y".equals(vo.getXdata())){
				d = dao.SelectDollar(vo);
				if(d > 0) { 
					vo.setPersonalImpost(vo.getImpost());
					vo.setImpost(d * vo.getImpost());			/* LCIF기금 : 납부금 입력시 : 환율 저장 */
					
					vo.setPaymentSum(dao.SelectPaymentSumLCIF(vo));
					dsum = vo.getPersonalImpost() - vo.getPaymentSum();
				}else{
					confirmyn = "E";
					acheck = false;
				}
			}else{
				vo.setPaymentSum(dao.SelectPaymentSum(vo));
				dsum = vo.getImpost() - vo.getPaymentSum();
			}
			
			if(acheck){
				/*
				 * 총부과금을 넘을때... 
				 */
				if(dsum < 0) {
					confirmyn = "A";
				}else{
					dao.UpdateImpost(vo);
				}
			}
		}
		return confirmyn;
	}

	@Override
	public String Delete(MM1_12VO vo) throws Exception {
		String message = deleteProcess(vo);
		String sMessage = null;
   
		switch(Integer.parseInt(message)){
			case 90: 
				log.debug("납부금이 존재 합니다.\n납부금을 삭제후 약정금을 삭제해 주세요.");
				sMessage = "납부금이 존재 합니다.\n납부금을 삭제후 약정금을 삭제해 주세요.";
				break;
			default:
				log.debug("삭제 완료.");
				sMessage = "1";
				break;
		}
		log.debug(message);
		return sMessage;		
	}
	
	public String deleteProcess(MM1_12VO vo) throws Exception {
		if((dao.SelectPaymentSum(vo) + dao.SelectPaymentSumLCIF(vo)) > 0){
			return "90";
		}
		
		// 부과금 삭제
		dao.DeleteImpost(vo);
		
		// 마스터 삭제
		dao.DeleteMaster(vo);
		
		return "1";
	}
	

	@Override
	public String InsertPayment(MM1_12VO vo) throws Exception {
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
		int d = 1;
		float dsum = 0;
		if(!"Y".equals(confirmyn)){
			/*
			 * 납부금 저장 
			 */
			if("1000".equals(vo.getDetailItemCode()) 
					&& "Y".equals(vo.getXdata())){
				d = dao.SelectDollar(vo);
				if(d > 0) {
					vo.setDollar(vo.getPayment());			
					vo.setPayment(d * vo.getPayment());		/* LCIF기금 : 납부금 입력시 : 환율계산해서 저장 */
					
					vo.setPaymentSum(dao.SelectPaymentSumLCIF(vo));
					dsum = vo.getPersonalImpost() - (vo.getPaymentSum() + vo.getDollar());
				}
			}else{				
				vo.setPaymentSum(dao.SelectPaymentSum(vo));
				dsum = vo.getImpost() - (vo.getPaymentSum() + vo.getPayment());
			}
			
			/*
			 * 총부과금을 넘을때... 
			 */
			if(dsum < 0) {
				confirmyn = "A";
			} else {				
				if(d > 0){
					vo.setPaymentFinish("Y");
					vo.setPaymentCount(dao.InsertPayment(vo));
					
					this.incomeExpendProcess(vo);
				}else{
					confirmyn = "E";
				}
			}
		}
		return confirmyn;
	}

	@Override
	public String UpdatePayment(MM1_12VO vo) throws Exception {
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
		int d = 1;
		float dsum = 0;
		if(!"Y".equals(confirmyn)){
			/*
			 * 납부금 저장 
			 */
			if("1000".equals(vo.getDetailItemCode()) 
					&& "Y".equals(vo.getXdata())){
				d = dao.SelectDollar(vo);
				if(d > 0) {
					vo.setDollar(vo.getPayment());			
					vo.setPayment(d * vo.getPayment());		/* LCIF기금 : 납부금 입력시 : 환율계산해서 저장 */
					
					vo.setPaymentSum(dao.SelectPaymentSumLCIFQ(vo));
					dsum = vo.getPersonalImpost() - (vo.getPaymentSum() + vo.getDollar());
				}
			} else {
				vo.setPaymentSum(dao.SelectPaymentSumQ(vo));
				dsum = vo.getImpost() - (vo.getPaymentSum() + vo.getPayment());
			}

			/*
			 * 총부과금을 넘을때... 
			 */
			if(dsum < 0) {
				confirmyn = "A";
			} else {
				if(d > 0){
					vo.setPaymentFinish("Y");
					dao.UpdatePaymentCount(vo);
					
					dao.deleteIncomeExpend(vo);					
					this.incomeExpendProcess(vo);
				} else {
					confirmyn = "E";					/* 환율정보가 없는 경우 */
				}
			}
		}
		return confirmyn;
	}

	@Override
	public String DeletePayment(MM1_12VO vo) throws Exception {
		/*
		 * 정산현황이 마감되지 않았을때만 저장 가능!! 
		 */
		vo.setCaYm(vo.getPaymentDate().substring(0,6));		
		String confirmyn = dao.SelectCal(vo);
		if(!"Y".equals(confirmyn)){
			dao.DeletePaymentCount(vo);
			
			dao.deleteIncomeExpend(vo);
		}
		return confirmyn;
	}
	
	/**
	 * 임원분담금 데이터로 [지출, 지출예산, 수입예산] 데이터 추가하기  : 2014-07-22
	 * @throws Exception
	 */
	public void incomeExpendProcess(MM1_12VO vo) throws Exception {
		// 결손일 경우
		if("Y".equals(vo.getPaymentDefect())){
//			vo.setClassItemCode("1120");
//			vo.setDetailItemCode("1000");	/* 결손금 */
//			vo.setInexCode("1010");	/* 그룹코드 : 8510 [ 지출 : 1010 ] */
//			dao.insertIncomeExpend(vo);	/* 수입/지출 테이블에 결손금 지출로 입력한다. */
			
		// 결손이 아닐경우
		} else {
			vo.setClassItemCode("1160");
			vo.setInexCode("1010");	/* 그룹코드 : 8510 [ 지출 : 1010 ] */
			dao.insertIncomeExpend(vo);	/* 수입/지출 테이블에 분담금 지출로 입력한다. */
		}
	}	
}
