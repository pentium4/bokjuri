package lionsclubs.com.MM3.MM3_4.MM3_20;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM3.MM3_4.MM3_20.CODE_ADD_INFO;
import lionsclubs.com.MM3.MM3_4.MM3_22.MM3_22Service;
import lionsclubs.com.MM3.MM3_4.MM3_22.MM3_22VO;
import lionsclubs.com.MM3.MM3_4.MM3_24.MM3_24Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.excel.ExcelService;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM3_20ServiceImpl extends AbstractServiceImpl implements MM3_20Service{
	@Autowired private MM3_20DAO dao;
	@Resource private ExcelService excelService;
	@Resource private MM3_22Service mm322Service;
	@Resource private MM3_24Service mm324Service;
	
	@Override
	public List<Map<String, Object>> selectList(MM3_20VO vo) throws Exception {
		return (List<Map<String, Object>>)dao.selectList(vo);
	}
	
	/**
	 * 엑셀템플릿 다운로드
	 */
	@Override
	public Map<String, Object> excelTemplateDownload(MM3_20VO vo, Map<String, Object> modelMap)
			throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		List<String> colName = new ArrayList<String>();
		colName.add("No");
		colName.add("클럽코드");
		colName.add("클럽명");
		colName.add("신입회원");

		for(int i=0; i<vo.getCodeList().size(); i++){
			colName.add(vo.getCodeList().get(i).getCodeName() + "[" + vo.getCodeList().get(i).getCode() + "]");
		}

		modelMap.put("excelName", vo.getDistrictCode() + "제의무금월추가부과(" + (Integer.parseInt(vo.getThisYear())-1) + " - " + vo.getThisYear() + ")_" + date);
		modelMap.put("colName", colName);
		modelMap.put("colValue", dao.excelTemplateDownload(vo));
		return modelMap;
	}
	

	@Override
	public List<CODE_ADD_INFO> getCodeList(MM3_20VO vo) throws Exception {

		return (List<CODE_ADD_INFO>) dao.getCodeList(vo);
	}
	
	/**
	 * 클럽제의무금 부과 엑셀 올리기
	 */	
	@Override	
	public String excelUpload(MM3_20VO vo, HttpServletRequest request) throws Exception {
		Map<Object, Object> map = null;
    	final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
    	
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		while(itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
//			message = service.excelUploadProcess(vo, file.getInputStream());
			
			String extension = CommonUtil.getExtension(file.getOriginalFilename());
			System.out.println("extension : " + extension);
			
			if("xls".equals(extension)){
				map = excelService.xlsParser(file.getInputStream());
			} else if("xlsx".equals(extension)){
				map = excelService.xlsxParser(file.getInputStream());
			}
		}
		
		int cells = Integer.parseInt(map.get("cells").toString());
		//System.out.println("엑셀파일의 셀의 갯수 : " + cells);
		int limitCells =  vo.getCodeList().size() + 4;
		//System.out.println("허용되는 셀의 갯수 : " + limitCells);

        if(cells != limitCells){
        	return "의무금 부과 항목 갯수가 틀렸습니다.";
        }
        
        try{
	       	dao.expensesDelete2(vo);  //참조키 데이터 삭제
	        dao.expensesDelete(vo);   //club_mydues 마스터테이블 데이터 삭제
		    /* 일괄부과 입력 */
			expensesRegist(vo, map);
			/* 클럽납부금입력 */
			MM3_22VO mm322VO = new MM3_22VO();
			mm322VO.setSessionYear(vo.getThisYear());
			mm322VO.setDistrictCode(vo.getDistrictCode());
			mm322Service.insertDistrictItemPayment(mm322VO);
        }catch(Exception e){
        	e.printStackTrace();
        	return e.getMessage();
        }
        System.out.println("pass8");
        System.out.println("pass excel Upload");
        
        return "1";
	}
	
	/**
	 * 제의무금부과 입력
	 * @param vo
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public void expensesRegist(MM3_20VO vo, Map<Object, Object> map) throws Exception{
		int count = 0;
		String[] excelColumnKeyArray = new String[vo.getCodeList().size()];				//엑셀 컬럼인덱스를 저장하기 위한 배열
		
		int keyIndex = 4;
		for(int i=0; i<excelColumnKeyArray.length; i++){
			excelColumnKeyArray[i] = "data_" + keyIndex;
			keyIndex++;
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		@SuppressWarnings("unchecked")
		List<Map<Object, Object>> list = (List<Map<Object, Object>>) map.get("dataList");
		int rows = Integer.parseInt(map.get("rows").toString());
		
		String yyyymm = Integer.parseInt(vo.getThisYear()) - 1 + "07";
		Integer rateWon = mm324Service.objectRates(yyyymm);		
		
		for(int rowIdx = 1; rowIdx < list.size(); rowIdx++) {
			Map<Object, Object> data = list.get(rowIdx);
        	vo.setClubCode(data.get("data_1").toString());
        	
        	if(vo.getClubCode() == null || "".equals(vo.getClubCode())){
        		throw new Exception(data.get("data_2").toString() + " 클럽의 클럽코드가 존재하지 않습니다.");        	
        	}
        	
        	vo.setNewComer(data.get("data_3").toString());
        	try{
				if(vo.getNewComer() == null || "".equals(vo.getNewComer())){
					vo.setNewComer("0");
				}
				Long.parseLong(vo.getNewComer());
			}catch(Exception e){
        		throw new Exception(data.get("data_2").toString() + " 클럽의 신입회원 수가 숫자가 아닙니다.");
			}
			count++;
        	if(Long.parseLong(vo.getNewComer()) < 1) continue;
        	dao.expensesInsert(vo);
			int tmpIdnNo = dao.currentIdnNo(vo);
			vo.setIdnNo(String.valueOf(tmpIdnNo));
			for(int codeIdx = 0; codeIdx < excelColumnKeyArray.length; codeIdx++){
				String tmpValue = data.get(excelColumnKeyArray[codeIdx]).toString();
				try{
					if(tmpValue == null || "".equals(tmpValue)){
						tmpValue = "0";
					}
					Long.parseLong(tmpValue);
				}catch(Exception e){
	        		throw new Exception(data.get("data_2").toString() + " 클럽의 " + list.get(0).get(excelColumnKeyArray[codeIdx]) + " 금액이 숫자가 아닙니다.");
				}
				
				if(Long.parseLong(tmpValue) < 1L ) continue;
				vo.setItemCode(vo.getCodeList().get(codeIdx).getCode());
				
				
				if("$".equals(vo.getCodeList().get(codeIdx).getDollarKind())){
					vo.setDueDollar(tmpValue);
					vo.setDue(String.valueOf(Integer.parseInt(tmpValue) * rateWon));
				} else {
					vo.setDueDollar(null);
					vo.setDue(tmpValue);	
				}
				
				dao.expensesInsert2(vo);
        	}
		}
		
		if(count != rows-1){
    		throw new Exception("입력도중 에러가 발생하였습니다.");
		}
	}
	
	public Map<String, Object> selectSum(MM3_20VO vo) throws Exception {
		return dao.selectSum(vo);
	}
}
