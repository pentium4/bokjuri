package lionsclubs.com.MM3.MM3_12.MM3_49;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;

public interface MM3_49Service {
	/**
	 * 전클럽 부과/납부금 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page MM3_49(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 부과/납부금 합계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_49VO total(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 부과 대상 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_49VO> listImpost(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 부과금 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveImpost(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 부과금 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteImpost(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 부과금 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_49VO objectImpost(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 납부 대상 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_49VO> listPayment(MM3_49VO vo) throws Exception;
	
	/**
	 * 전클럽 납부 처리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String payment(MM3_49VO vo) throws Exception;
}
