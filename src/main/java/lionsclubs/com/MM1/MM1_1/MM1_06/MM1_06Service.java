package lionsclubs.com.MM1.MM1_1.MM1_06;

import lionsclubs.com.cmm.pagging.Page;

public interface MM1_06Service {
	/**
	 * 회원 업체조회 리스트
	 * @return
	 * @throws Exception
	 */
	public Page selectList(MM1_06VO vo) throws Exception;
}
