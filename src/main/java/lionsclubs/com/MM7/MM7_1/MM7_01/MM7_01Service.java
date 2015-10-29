package lionsclubs.com.MM7.MM7_1.MM7_01;

import java.util.List;

import lionsclubs.com.cmm.pagging.Page;

public interface MM7_01Service {

	/**
	 * 문서수신함
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listReception(MM7_01VO vo) throws Exception;
	
	/**
	 * 문서발신함
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listOutgoing(MM7_01VO vo) throws Exception;

	/**
	 * 내작성문서함
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Page listDuring(MM7_01VO vo) throws Exception;

	/**
	 * 문서 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM7_01VO objectDoc(MM7_01VO vo) throws Exception;

	/**
	 * 문서 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String saveDoc(MM7_01VO vo) throws Exception;
	
	/**
	 * 조직코드 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM7_01VO> listOrganCode(MM7_01VO vo) throws Exception;
	
	/**
	 * 수신/참조/숨은참조 조직코드 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM7_01VO> listReceiveOrganCode(MM7_01VO vo) throws Exception;
	
	/**
	 * 수신처 접수확인
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM7_01VO> listReceive(MM7_01VO vo) throws Exception;
	
	/**
	 * 수신자 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM7_01VO> listReceiveMember(MM7_01VO vo) throws Exception;
	
	/**
	 * 문서 조회인원 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean saveDocSearchMember(MM7_01VO vo) throws Exception;
	
	/**
	 * 발신취소(저장상태로 업데이트)
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String updateOutgoingCancel(MM7_01VO vo) throws Exception;
	
	/**
	 * 문서삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean deleteDoc(MM7_01VO vo) throws Exception;
	
	/**
	 * 문서쓰기 조직코드 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<MM7_01VO> listWriteOrganCode(MM7_01VO vo) throws Exception;
	
	/**
	 * 읽지않은 수신문서 카운트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer unreadReceptionCount() throws Exception;
}
