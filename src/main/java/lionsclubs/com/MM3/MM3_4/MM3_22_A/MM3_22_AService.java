package lionsclubs.com.MM3.MM3_4.MM3_22_A;

import java.util.List;

public interface MM3_22_AService {

	/**
	 * 클럽납부금 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_22_AVO> select(MM3_22_AVO vo) throws Exception;
	
	/**
	 * 클럽납부금 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String insertClubPayment(MM3_22_AVO vo) throws Exception;
	
	/**
	 * 클럽납부금 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateClubPayment(MM3_22_AVO vo) throws Exception;
	
	/**
	 * 클럽납부금 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String deleteClubPayment(MM3_22_AVO vo) throws Exception;
	
	/**
	 * 클럽납부금 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_22_AVO objectClubPayment(MM3_22_AVO vo) throws Exception;
	
}
