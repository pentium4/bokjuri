package lionsclubs.com.MM1.MM1_2.MM1_12;

import java.util.List;

import lionsclubs.com.MM1.MM1_2.MM1_13.MM1_13VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM1_12DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM1.MM1_2.MM1_12.";
	
	/**
	 * 약정금 리스트
	 * @param adbkVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MM1_12VO> List(MM1_12VO vo) throws Exception {
		return list(commonId + "List", vo);
    }
	
	public MM1_12VO Select(MM1_12VO vo) throws Exception {
		return (MM1_12VO)selectByPk(commonId + "Select", vo);
    }
	
	public MM1_12VO SelectOrganCode(MM1_12VO vo) throws Exception {
		return (MM1_12VO)selectByPk(commonId + "SelectOrganCode", vo);
    }

	/**
	 * 약정금 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer InsertMaster(MM1_12VO vo) throws Exception {
		insert(commonId + "InsertMaster", vo);
		return vo.getIdnNo();
    }
	public void InsertImpost(MM1_12VO vo) throws Exception {
		insert(commonId + "InsertImpost", vo);
    }
	/*
	 * 납부금 - 입력
	 */
	public String InsertPayment(MM1_12VO vo) throws Exception {
		return (String)insert(commonId + "InsertPayment", vo);
    }
	
	public Integer SelectPaymentSum(MM1_12VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "SelectPaymentSum", vo);
	}
	public Integer SelectPaymentSumLCIF(MM1_12VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "SelectPaymentSumLCIF", vo);
	}
	public Integer SelectPaymentSumQ(MM1_12VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "SelectPaymentSumQ", vo);
	}
	public Integer SelectPaymentSumLCIFQ(MM1_12VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "SelectPaymentSumLCIFQ", vo);
	}
	public Integer SelectDollar(MM1_12VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "SelectDollar", vo);
	}
	
	/**
	 * 약정금 수정
	 * @param vo
	 * @throws Exception
	 */
	public void UpdateImpost(MM1_12VO vo) throws Exception {
		update(commonId + "UpdateImpost", vo);
    }
	
	/**
	 * 약정금 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer DeleteMaster(MM1_12VO vo) throws Exception {
		return delete(commonId + "DeleteMaster", vo);
    }
	public Integer DeleteImpost(MM1_12VO vo) throws Exception {
		return delete(commonId + "DeleteImpost", vo);
    }
	/*
	 * 납부금 - 삭제
	 */
	public Integer DeletePayment(MM1_12VO vo) throws Exception {
		return delete(commonId + "DeletePayment", vo);
    }
	
	/**
	 * 납부금 수정 & 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void UpdatePaymentCount(MM1_12VO vo) throws Exception {
		update(commonId + "UpdatePaymentCount", vo);
    }
	public Integer DeletePaymentCount(MM1_12VO vo) throws Exception {
		return delete(commonId + "DeletePaymentCount", vo);
    }
	
	/**
	 * 정산형황 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer SelectCalCount(MM1_12VO vo) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject(commonId + "SelectCalCount", vo);
	}
	public String SelectCal(MM1_12VO vo) throws Exception {
		return (String)getSqlMapClientTemplate().queryForObject(commonId + "SelectCal", vo);
    }
	public void InsertCal(MM1_12VO vo) throws Exception {
		insert(commonId + "InsertCal", vo);
    }

	public Integer deleteIncomeExpend(MM1_12VO vo) throws Exception {
		return delete(commonId + "deleteIncomeExpend", vo);
    }
	
	public boolean insertIncomeExpend(MM1_12VO vo) throws Exception {
		insert(commonId + "insertIncomeExpend", vo);
		return true;
    }
}
