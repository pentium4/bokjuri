package lionsclubs.com.MM1.MM1_2.MM1_13;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_13DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_2.MM1_13.";
	
	/**
	 * 임원분담금 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_13VO> List(MM1_13VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public MM1_13VO Select(MM1_13VO vo) throws Exception {
		return (MM1_13VO)selectByPk(commonId + "Select", vo);
    }
	
	public String SelectOrganCode(MM1_13VO vo) throws Exception {
		return (String)selectByPk(commonId + "SelectOrganCode", vo);
    }
	
	public String SelectPositionCode(MM1_13VO vo) throws Exception {
		return (String)selectByPk(commonId + "SelectPositionCode", vo);
    }
	
	/**
	 * 분담금 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer InsertMaster(MM1_13VO vo) throws Exception {
		insert(commonId + "InsertMaster", vo);
		return vo.getIdnNo();
    }
	
	public void InsertImpost(MM1_13VO vo) throws Exception {
		insert(commonId + "InsertImpost", vo);
    }
	
	/*
	 * 납부금 - 입력
	 */
	public String InsertPayment(MM1_13VO vo) throws Exception {
		return (String)insert(commonId + "InsertPayment", vo);
    }
	
	public Integer SelectPaymentCountMax(MM1_13VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectPaymentCountMax", vo);
	}
	
	public Integer SelectPaymentSum(MM1_13VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectPaymentSum", vo);
	}
	
	public Integer SelectPaymentSumQ(MM1_13VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectPaymentSumQ", vo);
	}
	
	public Integer SelectPaymentSum33(MM1_13VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectPaymentSum33", vo);
	}
	
	public Integer SelectImpostSum33(MM1_13VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectImpostSum33", vo);
	}
	
	/**
	 * 분담금 수정
	 * @param vo
	 * @throws Exception
	 */
	public void UpdateImpost(MM1_13VO vo) throws Exception {
		update(commonId + "UpdateImpost", vo);
    }
	
	public void UpdateImpost2(MM1_13VO vo) throws Exception {
		update(commonId + "UpdateImpost2", vo);
    }
	
	/**
	 * 분담금 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer DeleteMaster(MM1_13VO vo) throws Exception {
		return delete(commonId + "DeleteMaster", vo);
    }
	
	public Integer DeleteImpost(MM1_13VO vo) throws Exception {
		return delete(commonId + "DeleteImpost", vo);
    }
	/*
	 * 납부금 - 삭제
	 */
	public Integer DeletePayment(MM1_13VO vo) throws Exception {
		return delete(commonId + "DeletePayment", vo);
    }
	
	/*
	 * 납부금 - 삭제
	 */
	public Integer DeletePaymentCount(MM1_13VO vo) throws Exception {
		return delete(commonId + "DeletePaymentCount", vo);
    }	
	
	/**
	 * 납부금 수정 & 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void UpdatePaymentCount(MM1_13VO vo) throws Exception {
		update(commonId + "UpdatePaymentCount", vo);
    }
	
	/**
	 * 정산형황 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SelectCalCount(MM1_13VO vo) throws Exception {
		return (Integer)selectByPk(commonId + "SelectCalCount", vo);
	}
	
	public String SelectCal(MM1_13VO vo) throws Exception {
		return (String)selectByPk(commonId + "SelectCal", vo);
    }
	
	public String SelectCalLock(MM1_13VO vo) throws Exception {
		return (String)selectByPk(commonId + "SelectCalLock", vo);
    }
	
	public void InsertCal(MM1_13VO vo) throws Exception {
		insert(commonId + "InsertCal", vo);
    }
	
	/**
	 * 지구관리 > 임원선임/분담금 [MM3_33]
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_13VO> SelectDeleteList(MM1_13VO vo) throws Exception {
		return list(commonId + "SelectDeleteList", vo);
    }
	
	public Integer deleteIncomeExpend(MM1_13VO vo) throws Exception {
		return delete(commonId + "deleteIncomeExpend", vo);
    }
	
	public boolean insertIncomeExpend(MM1_13VO vo) throws Exception {
		insert(commonId + "insertIncomeExpend", vo);
		return true;
    }
}
