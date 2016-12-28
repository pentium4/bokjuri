package lionsclubs.com.cmm.customtag.function;

import javax.servlet.jsp.tagext.TagSupport;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;

import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

public class TagUtils extends TagSupport {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String organCode = "K26000";
	}
	
	/**
	 * jsp content내용에 대해 enter가 있으면 replace하여 한줄내려준다.
	 * @param content
	 * @return
	 */
	public static String newline(String content){
		return content.replaceAll("\n", "<br/>");
	}

	/**
	 * 조직코드를 6자리를 입력받아서 000-000형식으로 반환한다.
	 * @param organCode
	 * @return
	 */
	public static String formatOrganCode(String organCode){
		
		if(StringUtils.isNotEmpty(organCode)){
			organCode = organCode.substring(0,3) + "-" + organCode.substring(3,6);
		}
		
		return organCode;
	}
	
	/*
	 * 회기기준 년도와 월을 입력하여 실제 년월을 반환한다.
	 */
	public static String calcYearMonth(String year, String month) throws Exception {
		if(Integer.parseInt(month) < 7) {
			year = String.valueOf(Integer.parseInt(year) - 0);
		}else {
			year = String.valueOf(Integer.parseInt(year) - 1);
		}
		return year + month;
	}
	
	/**
	 * 세션정보
	 * @return
	 * @throws Exception
	 */
	public static Object sessionObject() throws Exception {
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		return user;
	}
	
	/**
	 * 숫자금액을 한글로 변환
	 * @param money
	 * @return
	 * @throws Exception
	 */
	public static String convertHangul(String money) throws Exception {
		String[] han1 = {"","일","이","삼","사","오","육","칠","팔","구"};
		String[] han2 = {"","십","백","천"};
		String[] han3 = {"","만","억","조","경"};

		StringBuffer result = new StringBuffer();
		int len = money.length();
		for(int i = len - 1; i >= 0; i--){
			result.append(han1[Integer.parseInt(money.substring(len - i - 1, len - i))]);
			if(Integer.parseInt(money.substring(len - i - 1, len - i)) > 0)
				result.append(han2[i % 4]);
			if(i%4 == 0)
				result.append(han3[i / 4]);
		}
		
		return result.toString();
	}
}
