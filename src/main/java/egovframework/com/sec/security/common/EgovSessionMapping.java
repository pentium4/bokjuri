package egovframework.com.sec.security.common;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import lionsclubs.com.login.LoginVO;
import egovframework.rte.fdl.security.userdetails.EgovUserDetails;
import egovframework.rte.fdl.security.userdetails.jdbc.EgovUsersByUsernameMapping;


public class EgovSessionMapping extends EgovUsersByUsernameMapping {

    /**
     * EgovUserDetailsMapping 생성자
     * @param ds
     * @param usersByUsernameQuery
     */
    public EgovSessionMapping(DataSource ds, String usersByUsernameQuery) {
        super(ds, usersByUsernameQuery);
    }

    /*
     * (non-Javadoc)
     * @see
     * egovframework.rte.fdl.security.userdetails.jdbc
     * .EgovUsersByUsernameMapping
     * #mapRow(java.sql.ResultSet, int)
     */
    /**
     * EgovUsersByUsernameMapping 클래스를 상속받아
     * jdbc-user-service 에서 지정된 users-by-username-query
     * 의 쿼리문을 조회하여 ResultSet에 매핑된다.
     */
    @Override
    protected EgovUserDetails mapRow(ResultSet rs, int rownum) throws SQLException {
        String userid = rs.getString("userId");
        String password = rs.getString("password");
        boolean enabled = rs.getBoolean("enabled");

        String username = rs.getString("userName");
        
        // TODO USERS 테이블 컬럼 변경
        // 세션에서 관리되는 항목 추가
        // 예) String birthDay = rs.getString("birth_day");

        LoginVO userVO = new LoginVO();
        userVO.setId(userid);
        userVO.setSearchId(userid);	/* 검색유지 ID */
        userVO.setPassword(password);
        userVO.setName(username);
        userVO.setMobile(rs.getString("mobile"));
        userVO.setAssociationName(rs.getString("associationName"));	/* 연합회명 */
        userVO.setComplexName(rs.getString("complexName"));	/* 복합지구명 */
        userVO.setDistrictName(rs.getString("districtName"));	/* 지구명 */
        userVO.setClubName(rs.getString("clubName"));	/* 클럽명 */
        userVO.setAssociationCode(rs.getString("associationCode"));	/* 연합회코드 */
        userVO.setSearchAssociationCode(rs.getString("associationCode"));	/* 검색유지 연합회코드 */
        userVO.setComplexCode(rs.getString("complexCode"));	/* 복합지구코드 */
        userVO.setSearchComplexCode(rs.getString("complexCode"));	/* 검색유지 복합지구코드 */
        userVO.setDistrictCode(rs.getString("districtCode"));	/* 지구코드 */
        userVO.setSearchDistrictCode(rs.getString("districtCode"));	/* 검색유지 지구코드 */
        userVO.setClubCode(rs.getString("clubCode"));	/* 클럽코드 */
        userVO.setSearchClubCode(rs.getString("clubCode"));	/* 검색유지 클럽코드 */
        userVO.setClubTitleName(rs.getString("clubTitleName"));	/* 클럽직책명 */
        userVO.setClubTitleCode(rs.getString("clubTitleCode"));	/* 클럽직책코드 */
        userVO.setDistrictTitleName(rs.getString("districtTitleName"));	/* 지구직책명 */
        userVO.setDistrictTitleCode(rs.getString("districtTitleCode"));	/* 직구직책코드 */          
        
        userVO.setSearchOrganCode(rs.getString("clubCode"));	/* 직구직책코드 */
        
        // TODO USERS 테이블 컬럼 변경
        // 세션에서 관리되는 항목 추가
        // 예) userVO.setBirthDay(birthDay);

        return new EgovUserDetails(userid, password, enabled, userVO);
    }

}

