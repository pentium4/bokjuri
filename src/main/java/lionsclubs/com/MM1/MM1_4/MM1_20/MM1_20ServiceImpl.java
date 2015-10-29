package lionsclubs.com.MM1.MM1_4.MM1_20;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM1_20ServiceImpl extends AbstractServiceImpl implements MM1_20Service{

	@Autowired private MM1_20DAO dao;

	@Override
	public List<MM1_20VO> MM1_20(MM1_20VO vo) throws Exception {
		return dao.MM1_20(vo);
	}
	
	@Override
	public Map<String, Object> excelDownload(MM1_20VO vo, Map<String, Object> modelMap) throws Exception {
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		if("1".equals(vo.getKind())){
			modelMap.put("excelName", " 경력(선임_위촉)_조회(" + vo.getStartDate() + "_" + vo.getEndDate() + ")_" + date);
		} else if("2".equals(vo.getKind())){
			modelMap.put("excelName", "포상(" + vo.getStartDate() + "_" + vo.getEndDate() + ")_" + date);
		} else if("3".equals(vo.getKind())){
			modelMap.put("excelName", "교육(" + vo.getStartDate() + "_" + vo.getEndDate() + ")_" + date);
		} else {
			modelMap.put("excelName", "회원기본(" + vo.getStartDate() + "_" + vo.getEndDate() + ")_" + date);
		}
		
		List<String> colName = new ArrayList<String>();
		
		if("1".equals(vo.getKind())){
			colName.add("선임시작일");
			colName.add("선임종료일");
			colName.add("선임구분");
			colName.add("선임 직책 및 내용");
		} else if("2".equals(vo.getKind())){
			colName.add("시작기간");
			colName.add("종료기간");
			colName.add("주관");
			colName.add("항목");
			colName.add("포상수여자");
			colName.add("내용");
		} else if("3".equals(vo.getKind())){
			colName.add("시작기간");
			colName.add("종료기간");
			colName.add("주관");
			colName.add("항목");
			colName.add("내용");
		}
		colName.add("회번");
		if("Y".equals(vo.getSectorDistrict())){
			colName.add("지구조직");
		}
		if("Y".equals(vo.getClubCode())){
			colName.add("클럽코드");
		}
		if("Y".equals(vo.getSectorClub())){
			colName.add("클럽조직명");
		}
		if("Y".equals(vo.getArea())){
			colName.add("지역");
		}
		if("Y".equals(vo.getZone())){
			colName.add("지대");
		}
		if("Y".equals(vo.getName())){
			colName.add("성명");
		}
		if("Y".equals(vo.getChinName())){
			colName.add("한자");
		}
		if("Y".equals(vo.getEngName())){			
			colName.add("영문");
		}
		if("Y".equals(vo.getDistrictTitle())){
			colName.add("지구직책");
		}
		if("Y".equals(vo.getDivision())){
			colName.add("회원구분");
		}
		if("Y".equals(vo.getBirth())){
			colName.add("생년월일");
		}
		if("Y".equals(vo.getSingDate())){			
			colName.add("입회일자");
		}
		if("Y".equals(vo.getQuitKind())){			
			colName.add("활동/퇴회 구분");
		}
		if("Y".equals(vo.getQuitDate())){			
			colName.add("퇴회일자");
		}
		if("Y".equals(vo.getQuitDivision())){			
			colName.add("퇴회사유");
		}
		if("Y".equals(vo.getAddress())){			
			colName.add("현주소");
		}
		if("Y".equals(vo.getZipCode())){			
			colName.add("우편번호");
		}
		if("Y".equals(vo.getMobile())){			
			colName.add("휴대전화");
		}
		if("Y".equals(vo.getWorkTel())){			
			colName.add("직장전화");
		}
		if("Y".equals(vo.getHomeTel())){			
			colName.add("자택전화");
		}
		if("Y".equals(vo.getFax())){			
			colName.add("팩스번호");
		}
		if("Y".equals(vo.getMailAddress())){			
			colName.add("메일주소");
		}
		if("Y".equals(vo.getGmail())){			
			colName.add("HP/Gmail");
		}
		if("Y".equals(vo.getBusinessClass())){			
			colName.add("업종분류");
		}
		if("Y".equals(vo.getIndustry())){			
			colName.add("업종");
		}
		if("Y".equals(vo.getCompanyTitle())){			
			colName.add("업체직책");
		}
		if("Y".equals(vo.getCompanyName())){			
			colName.add("업체명");
		}
		if("Y".equals(vo.getCompanyAddress())){			
			colName.add("업체주소");
		}
		if("Y".equals(vo.getEndEducation())){			
			colName.add("최종학력");
		}
		if("Y".equals(vo.getNativeSchool())){			
			colName.add("출신학교");
		}
		if("Y".equals(vo.getMajorSubject())){			
			colName.add("전공과목");
		}
		if("Y".equals(vo.getArmy())){			
			colName.add("병력관계");
		}
		if("Y".equals(vo.getBlood())){			
			colName.add("혈액형");
		}
		if("Y".equals(vo.getHobby())){			
			colName.add("취미활동");
		}
		if("Y".equals(vo.getHeight())){			
			colName.add("신장");
		}
		if("Y".equals(vo.getRecommMemberNo())){			
			colName.add("추천자 회번");
		}
		if("Y".equals(vo.getRecommMemberName())){			
			colName.add("추천자 성명");
		}
		if("Y".equals(vo.getRecommRealtionship())){			
			colName.add("추천관계");
		}
		if("Y".equals(vo.getMarryStatus())){			
			colName.add("결혼여부");
		}
		if("Y".equals(vo.getGameteName())){			
			colName.add("배우자성명");
		}
		if("Y".equals(vo.getFamily())){			
			colName.add("본인가족");
		}
		if("Y".equals(vo.getChildren())){			
			colName.add("자녀");
		}
		if("Y".equals(vo.getClubTitle())){			
			colName.add("현클럽직책");
		}
		if("Y".equals(vo.getDivisionSector())){			
			colName.add("현클럽분과소속");
		}
		if("Y".equals(vo.getFirstSingDate())){			
			colName.add("최초입회일자");
		}		
		
		modelMap.put("colName", colName);
		
		if("1".equals(vo.getKind())){
			modelMap.put("colValue", dao.appointment(vo));
		} else if("2".equals(vo.getKind())){
			modelMap.put("colValue", dao.prize(vo));
		} else if("3".equals(vo.getKind())){
			modelMap.put("colValue", dao.education(vo));
		} else {
			modelMap.put("colValue", dao.MM1_20(vo));
		}
		
		return modelMap;
	}
}
