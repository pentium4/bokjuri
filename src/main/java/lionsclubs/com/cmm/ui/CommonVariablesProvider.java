package lionsclubs.com.cmm.ui;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM7.MM7_1.MM7_01.MM7_01Service;
import lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09Service;
import lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09VO;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Component;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

/**
 * 공통적인 변수 들을 제공 함
 * @author uchung
 *
 */
@Component
public class CommonVariablesProvider implements IVariablesProvider {
	@Resource private SM1_09Service sm109Service;
	@Resource private MM7_01Service mm701Service;
	
	@Override
	public void provideVariables(Map<String, Object> vars, boolean ui,
			String context, HttpServletRequest request) {
		try {
			// 로그인된 사용자
			Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(isAuthenticated){
				LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
				
				if(!user.getIsSessionChange()){
					vars.put("sessionChange", "N");
				} else {
					vars.put("sessionChange", "Y");
				}
				
				vars.put("id", user.getId());	/* ID */
				vars.put("password", user.getPassword());	/* 패스워드 */
				vars.put("name", user.getName());	/* 이름 */
				vars.put("mobile", user.getMobile());	/* 휴대폰 번호 */
				vars.put("associationName", user.getAssociationName());	/* 연합회명 */
				vars.put("complexName", user.getComplexName());	/* 복합지구명 */
				vars.put("districtName", user.getDistrictName());	/* 지구명 */
				vars.put("clubName", user.getClubName());	/* 클럽명 */
				vars.put("associationCode", user.getAssociationCode());	/* 연합회코드 */
				vars.put("complexCode", user.getComplexCode());	/* 복합지구코드 */
				vars.put("districtCode", user.getDistrictCode());	/* 지구코드 */
				vars.put("clubCode", user.getClubCode());	/* 클럽코드 */
				vars.put("clubTitleName", user.getClubTitleName());	/* 클럽직책명 */
				vars.put("clubTitleCode", user.getClubTitleCode());	/* 클럽직책코드 */
				vars.put("districtTitleName", user.getDistrictTitleName());	/* 지구직책명 */
				vars.put("districtTitleCode", user.getDistrictTitleCode());	/* 직구직책코드 */
				
				vars.put("headerMenuList", sm109Service.headerMenuList());
				vars.put("leftMenuList", sm109Service.leftMenuList());
				
				String menuId = request.getParameter("menuId");
				if(menuId != null){
					SM1_09VO sm109vo = sm109Service.menuAuthorization(menuId);
					// 메뉴권한
					vars.put("menuAuthorization", sm109vo);
					vars.put("select", sm109vo.getSelect());
					vars.put("input", sm109vo.getInput());
				}
				
				/* 새로운 문서 갯수 */
				vars.put("newReceptionCount", mm701Service.unreadReceptionCount());				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static String scheme(String url) {
		int idx = url.indexOf(':');
		return idx == -1 ? "http" : url.substring(0, idx);
	}
	private static String contextPath(String url) {
		if (url.startsWith("/")) {
			int slashEndIdx = url.indexOf('/', 1);
			return url.substring(0, slashEndIdx==-1?url.length():slashEndIdx);
		}
		int idx = url.indexOf("://");
		int slashIdx = idx==-1?-1:url.indexOf('/', idx + 4);
		int slashEndIdx = slashIdx==-1?-1:url.indexOf('/', slashIdx + 1);
		if (slashIdx == -1) {
			return null;
		}
		return url.substring(slashIdx, slashEndIdx==-1?url.length():slashEndIdx);
	}  
	private static String serverName(String url) {
		int idx = url.indexOf("://");
		if (idx != -1) {
			int firstSlashIdx = url.indexOf('/', idx + 4);
			int colonIdx = firstSlashIdx==-1?-1:url.indexOf(':', idx + 4);
			if (colonIdx != -1 && colonIdx < firstSlashIdx) {
				return url.substring(idx + 3, colonIdx);
			}
			return url.substring(idx + 3, firstSlashIdx==-1?url.length():firstSlashIdx);
		}
		return "localhost";
	}

	
}
