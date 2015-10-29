package lionsclubs.com.MM1.MM1_2.MM1_09;

import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_09DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_2.MM1_09.";
	
	/**
	 * 납부금입력 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_09VO> List(MM1_09VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public MM1_09VO Select(MM1_09VO vo) throws Exception {
		return (MM1_09VO)selectByPk(commonId + "Select", vo);
    }
	
	/**
	 * 조직코드 가져오기
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM1_09VO SelectOrganCode(MM1_09VO vo) throws Exception {
		return (MM1_09VO)selectByPk(commonId + "SelectOrganCode", vo);
    }
	
	/**
	 * 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String InsertMaster(MM1_09VO vo) throws Exception {
		return (String) insert(commonId + "InsertMaster", vo);
    }
	public void InsertImpost(MM1_09VO vo) throws Exception {
		insert(commonId + "InsertImpost", vo);
    }
	/*
	 * 납부금 - 입력
	 */
	public void InsertPayment(MM1_09VO vo) throws Exception {
		insert(commonId + "InsertPayment", vo);
    }
	
	/**
	 * 수정
	 * @param vo
	 * @throws Exception
	 */
	public void UpdateImpost(MM1_09VO vo) throws Exception {
		update(commonId + "UpdateImpost", vo);
    }
	
	/*
	 * 납부금 - 수정
	 */
	public void UpdatePayment(MM1_09VO vo) throws Exception {
		update(commonId + "UpdatePayment", vo);
    }
	
	/**
	 * 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */	
	public Integer DeleteMaster(MM1_09VO vo) throws Exception {
		return delete(commonId + "DeleteMaster", vo);
    }
	public Integer DeleteImpost(MM1_09VO vo) throws Exception {
		return delete(commonId + "DeleteImpost", vo);
    }
	/*
	 * 납부금 - 삭제
	 */
	public Integer DeletePayment(MM1_09VO vo) throws Exception {
		return delete(commonId + "DeletePayment", vo);
    }
	/*
	 * 경조사 삭제시 - (남아있는 부과금/납부금 수 체크)
	 */
	public Integer SelectPaymentCount(MM1_09VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectPaymentCount", vo);
    }
	
	public MM1_09VO SelectPaymentSum(MM1_09VO vo) throws Exception {
		return (MM1_09VO)selectByPk(commonId + "SelectPaymentSum", vo);
    }
	
	/**
	 * 정산형황 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SelectCalCount(MM1_09VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectCalCount", vo);
	}
	public String SelectCal(MM1_09VO vo) throws Exception {
		return (String)selectByPk(commonId + "SelectCal", vo);
    }
	public void InsertCal(MM1_09VO vo) throws Exception {
		insert(commonId + "InsertCal", vo);
    }
	
	/**
	 * select box 리스트
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_09VO> SelectClassList(Map<String, Object> map) throws Exception {
		return list(commonId + "SelectClassCode", map);
	} 
	
	@SuppressWarnings("unchecked")
	public List<MM1_09VO> SelectDetailList(Map<String, Object> map) throws Exception {
		return list(commonId + "SelectDetailCode", map);
	} 
	public String SelectDetailType(Map<String, Object> map) throws Exception {
		return (String)selectByPk(commonId + "SelectDetailType", map);
    }
	/**
	 * 회원 - 회비 데이터 가져오기
	 */
	public Integer SelectMemberPay(Map<String, Object> map) throws Exception {
		return (Integer)selectByPk(commonId + "SelectMemberPay", map);
    }
	/**
	 * 최근 정산일자 가져오기 
	 */
	public String SelectCDate(Map<String, Object> map) throws Exception {
		return (String)selectByPk(commonId + "SelectCDate", map);
    }

	@SuppressWarnings("unchecked")
	public List<MM1_09VO> listPayment(MM1_09VO vo) throws Exception {
		return list(commonId + "listPayment", vo);
	}

	public MM1_09VO objectPayment(MM1_09VO vo) throws Exception {
		return (MM1_09VO)selectByPk(commonId + "objectPayment", vo);
	}
	
	public MM1_09VO objectTreasurer(MM1_09VO vo) throws Exception {
		return (MM1_09VO)selectByPk(commonId + "objectTreasurer", vo);
	}
}
