package lionsclubs.com.MM3.MM3_5.MM3_27;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_27ServiceImpl extends AbstractServiceImpl implements MM3_27Service{

	@Autowired
	private MM3_27DAO dao;

	@Override
	public List<MM3_27VO_DATA> selectList(MM3_27VO_PARAM vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public String mergeData(MM3_27VO_DATA vo) throws Exception {
		
		MM3_27VO_DATA mdata = dao.SelectDate(vo);
		
		if("Y".equals(mdata.getDateYn())) {
			vo.setInputFirst(mdata.getMm() == 1 || mdata.getMday() == 0 ? vo.getInputFirst().replace(".", "") : "");
			vo.setInputSecond(mdata.getMm() == 2 || mdata.getMday() == 0 ? vo.getInputSecond().replace(".", "") : "");
			vo.setInputThird(mdata.getMm() == 3 || mdata.getMday() == 0 ? vo.getInputThird().replace(".", "") : "");
			vo.setInputFourth(mdata.getMm() == 4 || mdata.getMday() == 0 ? vo.getInputFourth().replace(".", "") : "");
			vo.setInputFifth(mdata.getMm() == 5 || mdata.getMday() == 0 ? vo.getInputFifth().replace(".", "") : "");
			vo.setInputSixth(mdata.getMm() == 6 || mdata.getMday() == 0 ? vo.getInputSixth().replace(".", "") : "");
			vo.setInputSeventh(mdata.getMm() == 7 || mdata.getMday() == 0 ? vo.getInputSeventh().replace(".", "") : "");
			vo.setInputEighth(mdata.getMm() == 8 || mdata.getMday() == 0 ? vo.getInputEighth().replace(".", "") : "");
			vo.setInputNineth(mdata.getMm() == 9 || mdata.getMday() == 0 ? vo.getInputNineth().replace(".", "") : "");
			vo.setInputTenth(mdata.getMm() == 10 || mdata.getMday() == 0 ? vo.getInputTenth().replace(".", "") : "");
			vo.setInputEleventh(mdata.getMm() == 11 || mdata.getMday() == 0 ? vo.getInputEleventh().replace(".", "") : "");
			vo.setInputTwelveth(mdata.getMm() == 12 || mdata.getMday() == 0 ? vo.getInputTwelveth().replace(".", "") : "");
			
			return (dao.mergeData(vo)==1) ? "Y" : "수정이 되지 않았습니다.";
		
		}else{
			return mdata.getmDate() + " 까지만 수정 가능 합니다.";
		}
	}


}
