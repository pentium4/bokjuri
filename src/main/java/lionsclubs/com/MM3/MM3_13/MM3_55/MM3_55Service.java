package lionsclubs.com.MM3.MM3_13.MM3_55;

import java.util.List;

public interface MM3_55Service {
	/**
	 * 간사정보
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_55VO MM3_55(MM3_55VO vo) throws Exception;

	/**
	 * 이전/다음 memberNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_55VO memberNo(MM3_55VO vo) throws Exception;
	
	/**
	 * 담당조직 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM3_55VO> listRepOrgan(MM3_55VO vo) throws Exception;
	
	/**
	 * 담당조직 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_55VO objectRepOrgan(MM3_55VO vo) throws Exception;
	
	/**
	 * 담당조직 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveRepOrgan(MM3_55VO vo) throws Exception;
	
	/**
	 * 담당조직 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteRepOrgan(MM3_55VO vo) throws Exception;
}
