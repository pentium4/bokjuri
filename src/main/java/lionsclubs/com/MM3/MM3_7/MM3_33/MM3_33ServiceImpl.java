package lionsclubs.com.MM3.MM3_7.MM3_33;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03Service;
import lionsclubs.com.MM1.MM1_1.MM1_03.MM1_03VO;
import lionsclubs.com.MM1.MM1_2.MM1_13.MM1_13Service;
import lionsclubs.com.MM1.MM1_2.MM1_13.MM1_13VO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_33ServiceImpl extends AbstractServiceImpl implements MM3_33Service{
	
	@Autowired private MM3_33DAO dao;
	@Resource private MM1_03Service service03;
	@Resource private MM1_13Service service13;

	@Override
	public List<MM3_33VO_DATA> selectList(MM3_33VO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(vo);
	}

	@Override
	public int insertList(MM3_33VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.insertData(setParamVo(vo, vo.getChkIdx().get(i).intValue() -1));
		}
		return cnt;
	}

	@Override
	public int updateList(MM3_33VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.updateData(setParamVo(vo, vo.getChkIdx().get(i).intValue() -1));
		}
		return cnt;
	}

	@Override
	public int deleteList(MM3_33VO vo) throws Exception {
		int cnt = 0;
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			cnt+= dao.deleteData(setParamVo(vo, vo.getChkIdx().get(i).intValue() -1));
		}
		return cnt;
	}
	
	private MM3_33VO_DATA setParamVo(MM3_33VO vo, int index) throws Exception {
		//index--; 
		MM3_33VO_DATA rtnVo = new MM3_33VO_DATA();
		rtnVo.setIdnNo(vo.getIdnNo().get(index));
		rtnVo.setOrganCode(vo.getOrganCode().get(index));
		rtnVo.setOrganName(vo.getOrganName().get(index));
		rtnVo.setMemberNo(vo.getMemberNo().get(index));
		rtnVo.setMemberName(vo.getMemberName().get(index));
		//rtnVo.setSessionYear(vo.getSessionYear().get(index));
		rtnVo.setTitleCode(vo.getTitleCode().get(index));
		rtnVo.setDirectorAnte(vo.getDirectorAnte().get(index));
		rtnVo.setAppointDate(vo.getAppointDate().get(index));
		
		rtnVo.setSessionYear(vo.getThisYear());
		rtnVo.setInsertName(vo.getInsertName());
		rtnVo.setUpdateName(vo.getUpdateName());
		return rtnVo;
	}

	/**
	 * 개인발령적용
	 */
	@Override
	public String insertPerson(MM3_33VO vo) throws Exception {
		MM3_33VO_DATA mm33 = new MM3_33VO_DATA();
		MM1_03VO vo03 = new MM1_03VO();
		MM1_13VO vo13 = new MM1_13VO();
		String confirm_yn = "";
		int asum = 0;
		/*
		 * 선임 정보 먼저 삭제 - 겸임일 경우 겸임정보를 다 넣기 위해서 기존 내용 먼저 삭제 처리함.
		 * 분담금도 먼저 삭제 
		 */
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			mm33 = setParamVo(vo, i);
			asum = dao.selectAppointment(mm33);
			if(asum > 0){				
				// 1. 선임정보 삭제
				try{
					dao.deleteAppointment(mm33);					
					//service03.memberDelete(mm33.getMemberNo());	/* 초기화 */
				}catch(Exception e){
					e.printStackTrace();
		        	return "선택한"+ (i+1) +"행의 "+ mm33.getMemberName() + "["+ mm33.getMemberNo() +"]님의 기존 선임 정보를 삭제하지 못했습니다.";
		        }
			}
			
			// 2. 분담금 삭제
			vo13.setCaYm(mm33.getAppointDate().substring(0,6));
			vo13.setOneYear(mm33.getSessionYear());
			vo13.setOrganCode(mm33.getOrganCode());
			vo13.setClassItemCode("1040");
			vo13.setDetailItemCode("1000");
			vo13.setTargetMemberNo(mm33.getMemberNo());
			vo13.setMemberNo(mm33.getMemberNo());
			try {
				service13.Delete2(vo13);
			} catch(Exception e) {
				e.printStackTrace();
	        	return "선택한"+ (i+1) +"행의 "+ mm33.getMemberName() + "["+ mm33.getMemberNo() +"]님의 기존 분담금 정보를 삭제하지 못했습니다.";
	        }			
		}
		/*
		 * 선인 정보 입력 및 분담금 저장
		 */
		for(int i = 0; i < vo.getChkIdx().size(); i++){
			//mm33 = setParamVo(vo, vo.getChkIdx().get(i).intValue());
			mm33 = setParamVo(vo, i);
			
			// 2. 선임정보 insert
			vo03.setMemberNo(mm33.getMemberNo());
			vo03.setStartDate(mm33.getAppointDate());
			vo03.setEndDate(mm33.getSessionYear()+"0630");
			vo03.setAppKindCode("1010");						/* 선임 구분 코드 */
			vo03.setOrganCode(mm33.getOrganCode());				/* 소속 클럽 코드 */
			vo03.setAppSectorCode(vo.getThisOrganCode());		/* 선임 소속 코드 */
			vo03.setAppDescCode(mm33.getTitleCode());			/* 지구 직책 코드 */
			vo03.setInsertName(mm33.getInsertName());
			vo03.setUpdateName(mm33.getUpdateName());
			try{
				service03.Insert(vo03);
			}catch(Exception e){
	        	return "선택한"+ (i+1) +"행의 "+ mm33.getMemberName() + "["+ mm33.getMemberNo() +"]님의 선임 정보를 입력하지 못했습니다.";
	        }
			
			
			// 3. 분담금 insert
			vo13.setCaYm(mm33.getAppointDate().substring(0,6));
			vo13.setOrganCode(mm33.getOrganCode());
			vo13.setStampCode("1000");
			vo13.setGenDate(mm33.getAppointDate());
			vo13.setClassItemCode("1040");
			vo13.setDetailItemCode("1000");
			vo13.setImpost(Integer.parseInt(mm33.getDirectorAnte()));
			vo13.setImpostMemberNo(mm33.getInsertName());
			vo13.setMemberNo(mm33.getMemberNo());
			vo13.setTargetMemberNo(mm33.getMemberNo());
			vo13.setTargetMemberName(mm33.getMemberName());			// error일 경우 성명이 필요
			vo13.setTargetPositionCode(mm33.getTitleCode());
			vo13.setInsertName(mm33.getInsertName());
			vo13.setUpdateName(mm33.getUpdateName());	
			
			try{
				confirm_yn = pushPayment(i, vo13);
			}catch(Exception e){
				e.printStackTrace();
	        	return e.getMessage();
	        }
			
		}
		return confirm_yn;
	}
	
	public String pushPayment(int i, MM1_13VO vo13) throws Exception {
		String confirm_yn = "N";
		
		if(vo13.getImpost() > 0){
			confirm_yn = service13.Check2(vo13);
			
			if("P".equals(confirm_yn)){
        		throw new Exception("선택한 " + (i+1) +"행의 "+ vo13.getTargetMemberName() + "["+ vo13.getTargetMemberNo() +"]님의 지구임원 분담금 납부금보다 새로 부과된 금액이 작아서 전체 자료가 변경되지 않습니다.");        	
        	} else if("Y".equals(confirm_yn)){
				// 삭제가 안되는 경우 
				throw new Exception("선택한 " + (i+1) +"행의 "+ vo13.getTargetMemberName() + "["+ vo13.getTargetMemberNo() +"]님의 분기내 월정산이 되어서 적용할 수 없습니다.");    
				//break;
			} else if(!"P".equals(confirm_yn) && !"EQUAL".equals(confirm_yn) && !"MANY".equals(confirm_yn)){
				confirm_yn = service13.Insert2(vo13);  
				
				if("E".equals(confirm_yn)){
					// 잭책코드가 없어서 저장이 안되는 경우 
					throw new Exception("선택한 " + (i+1) +"행의 "+ vo13.getTargetMemberName() + "["+ vo13.getTargetMemberNo() +"]님의 직책코드가 없어서 입력할 수 없습니다.");  
					//break;
				}
        	} else if("MANY".equals(confirm_yn)){
				confirm_yn = service13.Update2(vo13);   	// 기존 부과금 보다 금액이 크면 큰 금액으로 적용한다.  	
        	} else if("EQUAL".equals(confirm_yn)){
				/*
				 * 1. 기존 부과금에 대한 납부가 끝난 경우
				 * 2. 기존 부과금과 새로 넣는 부과금이 같으면 그냥 넘어간다.
				 * 3. 기존 부과금보다 작고 납부한 금액보다 큰경우도 그냥 넘어간다.
				 */
				confirm_yn = "N";
			}
		}
		
		return confirm_yn;
	}

	@Override
	public MM3_33VO_DATA selectOrgan(String memberNo) throws Exception {
		return dao.selectOrgan(memberNo);
	}
}
