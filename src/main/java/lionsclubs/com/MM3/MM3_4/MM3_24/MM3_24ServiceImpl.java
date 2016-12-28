package lionsclubs.com.MM3.MM3_4.MM3_24;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_24ServiceImpl extends AbstractServiceImpl implements MM3_24Service{
	
	@Autowired
	private MM3_24DAO dao;

	@Override
	public java.util.List<MM3_24VO> List(MM3_24VO vo) throws Exception {
		return dao.List(vo);
	}

	@Override
	public void Insert(MM3_24VO vo) throws Exception {
		
	}

	@Override
	public void Update(MM3_24VO vo) throws Exception {
		List<String> dollarArray = vo.getDollarArray();
		List<String> wonArray = vo.getWonArray();
		List<String> ordersArray = vo.getOrdersArray();
		
		//dao.DeleteAll(vo);
		
		for (int i = 0; i < wonArray.size(); i++) {
			vo.setDollar(dollarArray.get(i));
			vo.setWon(wonArray.get(i).replaceAll("\\,", ""));
			
			String month = getFormattedNumber(Integer.valueOf(ordersArray.get(i)), "00");
			String year = (Integer.valueOf(ordersArray.get(i))>6) ? vo.getPrevYear() : vo.getThisYear();
			vo.setYyyyMm(year+month);
			if(vo.getDollar()!=null || vo.getWon()!=null){
				dao.Update(vo);
			}
		}
		
	}
	
	@Override
	public Integer objectRates(String yyyymm) throws Exception {
		return dao.objectRates(yyyymm);
	}
	
	/**
     * 입력된 숫자를 지정된 형태로 출력한다.
     * 숫자가 아닌 값이 들어오면 입력값을 그대로 돌려준다.<BR><BR>
     *
     * 사용예) getFormattedNumber(1, "00000")<BR>
     * 결   과) "00001"<BR><BR>
     *
     * @param pInstr long
     * @return String
     */
   public String getFormattedNumber( long num, String format ) {
    String result;       
    StringBuffer formattedNum = new StringBuffer();
       String strNum = "" + num ;

       if (format == null) {
          result = strNum;
       }else{
          try {
             for ( int i=0 ; i < format.length() - strNum.length(); i++ ) {
                 formattedNum.append(format.charAt(i));
             }
             formattedNum.append(strNum);
         }catch( Exception e ){
             result = "error";
        };
     }
     result = formattedNum.toString();
     return result;
  }
}
