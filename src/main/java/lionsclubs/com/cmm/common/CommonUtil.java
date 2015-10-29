package lionsclubs.com.cmm.common;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

public class CommonUtil {
	/**
	 * @param args
	 * @throws Exception 
	 */

	public static void main(String[] args) throws Exception {
		/*
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("MMdd");
		
		String thisSessionYear = String.valueOf(calendar.get(Calendar.YEAR));
		
		if(Integer.parseInt("0630") < Integer.parseInt(sd.format(new Date()))){
			System.out.println(calendar.get(Calendar.YEAR) + 1);
		}
		
		System.out.println("thisSessionYear() : " + thisSessionYear());
		System.out.println("prevSessionYear() : " + String.valueOf(Integer.parseInt(thisSessionYear()) - 1));

		System.out.println("20140101".substring(4,8));
		
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(2015, 5-1, 17);
		int currentDay = calendar.get(calendar.DAY_OF_MONTH);
		int lastDay = calendar.getActualMaximum(calendar.DATE);
		
		System.out.println(lastDay);

		Calendar calendar = Calendar.getInstance();
		
		int currentDay = calendar.get(Calendar.DAY_OF_MONTH);
		int lastDay = calendar.getActualMaximum(Calendar.DATE);
		System.out.println(lastDay - currentDay);
		
		String d = "20140417";
		
		int year = Integer.parseInt(d.substring(0,4));
		int month = Integer.parseInt(d.substring(4,6));
		int day = Integer.parseInt(d.substring(6,8));		
		
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		
		System.out.println(thisYear());
		*/
		
		/*
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		System.out.println("CommonUtil.thisYear() + CommonUtil.thisMonth() : " + CommonUtil.thisYear() + CommonUtil.thisMonth());
		
		for(int i=0; i<300000; i++){
			date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			System.out.println("date : " + date);
		}
		*/
		
//		date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	
	/**
	 * 현재회기년도를 가져온다.
	 * @return
	 */
	public static String thisSessionYear() throws Exception {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("MMdd");

		String thisSessionYear = String.valueOf(calendar.get(Calendar.YEAR));
		
		if(Integer.parseInt(sd.format(new Date())) > Integer.parseInt("0630")){
			thisSessionYear = String.valueOf(Integer.parseInt(thisSessionYear) + 1);
		}
		
		return thisSessionYear;
	}
	
	/**
	 * 현재회기년월을 가져온다.
	 * @return
	 */
	public static String thisSessionYearMonth() throws Exception {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("MMdd");

		String thisSessionYearMonth = String.valueOf(calendar.get(Calendar.YEAR)) + String.valueOf(calendar.get(Calendar.MONTH));
		
		if(Integer.parseInt(sd.format(new Date())) > Integer.parseInt("0630")){
			thisSessionYearMonth = String.valueOf(Integer.parseInt(thisSessionYearMonth) + 1);
		}
		
		return thisSessionYearMonth;
	}	
	
	/**
	 * 현재월을 가져온다.
	 * @return
	 */
	public static String thisMonth() throws Exception {
		return new SimpleDateFormat("MM").format(new Date());
	}
	
	/**
	 * 현재날짜를 가져온다.
	 * @return
	 */
	public static String getToDay() throws Exception {
		return new SimpleDateFormat("yyyyMMdd").format(new Date());
	}
	
	/**
	 * 현재년을 가져온다.
	 * @return
	 */
	public static String thisYear() throws Exception{
		return new SimpleDateFormat("yyyy").format(new Date());
	}
	
	/**
	 * 이전회기년도를 가져온다.
	 * @return
	 */
	public static String prevSessionYear() throws Exception{
		return String.valueOf(Integer.parseInt(thisSessionYear()) - 1);
	}	

	
    /**
     * 브라우저 구분 얻기.
     *
     * @param request
     * @return
     */
	public static String getBrowser(HttpServletRequest request) throws Exception{
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Trident") > -1) {	// IE11 문자열 깨짐 방지
            return "Trident";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        return "Firefox";
    }
    
    /**
     * 파일 문자열 깨짐 방지
     * @param request
     * @param filename
     * @return
     * @throws Exception
     */
    public static String getFileName(HttpServletRequest request, String filename) throws Exception{
		String browser = getBrowser(request);

		//String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) {		// IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}
		
		return encodedFilename;    	
    }
    
    /**
     * 시작문자열과 끝문자열 사이에 있는 값 가져오기
     * @param str
     * @param start
     * @param end
     * @return
     */
    public static String getStartEndSubstr(String str, String start, String end) throws Exception{
    	
		int startIndex = str.indexOf("(") + 1;
		int endIndex = str.indexOf(")");
		
		String result = str.substring(startIndex,endIndex);    	
    	
    	return result;
    }
    
    /**
     * 파일확장자를 가져온다.
     * @return
     */
	public static String getExtension(String fileName) throws Exception {
		if(fileName == null)
			return null;
		return  fileName.lastIndexOf(".") > -1 ? fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase() : null; 
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
	 * yyyyMMdd 를 받아서 회기년도를 반환한다.
	 * @param date yyyyMMdd
	 * @return 회기년도
	 * @throws Exception
	 */
	public static String dateToSessionYear(String date) throws Exception {
		String d = date.replaceAll("\\.", "");
		String monthDay = d.substring(4,8);
		String sessionYear = d.substring(0,4);
		
		if(Integer.parseInt(monthDay) > Integer.parseInt("0630")){
			sessionYear = String.valueOf(Integer.parseInt(sessionYear) + 1);
		}
		
		return String.valueOf(sessionYear);
	}
	
	/**
	 * 세자리수마다 콤마를 추가한다.
	 * @param number
	 * @return
	 */
	public static String comma(int number){
		return new DecimalFormat("#,###").format(number);
	}
	
	/**
	 * 날짜체크
	 * @param str 날짜값
	 * @param format 날짜포멧 예) yyyyMMddHHmmss, yyyyMMdd
	 * @return
	 */
	public static boolean checkDate(String str, String format){
		boolean dateValidity = true;
	
		SimpleDateFormat df = new SimpleDateFormat(format, Locale.KOREA); //20041102101244
		df.setLenient(false); // false 로 설정해야 엄밀한 해석을 함.
	
		try {
			Date dt = df.parse(str);
		}
		catch(ParseException pe){
			dateValidity = false;
		}catch(IllegalArgumentException ae){
			dateValidity = false;
		}
	
		return dateValidity;
	}

	/**
	 * 입력날짜기준으로 마지막날짜로부터 몇일전인지 구한다.
	 * @return
	 */
	public static Integer getLastDayOfday(){
		Calendar calendar = Calendar.getInstance();
		
		int currentDay = calendar.get(Calendar.DAY_OF_MONTH);
		int lastDay = calendar.getActualMaximum(Calendar.DATE);
	
		return lastDay - currentDay;
	}
	
	/**
	 * 날짜 입력양식을 전달받아 현재 날짜를 반환.
	 * @param pattern 입력 양식.
	 * @return String 날짜 입력 양식.
	 */
	public static String getSysDate(String pattern) {
		return getDateString(new Date(), pattern);
	}
	
	/**
	 * Date 객체와 입력양식을 전달받아 날짜를 반환.
	 * @param date Date 객체.
	 * @param pattern 입력 양식.
	 * @return String 날짜.
	 */
	public static String getDateString(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}	
	
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
