package lionsclubs.com.MM7.MM7_1.MM7_01;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Repository;

@Repository
public class MM7_01DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM7.MM7_1.MM7_01.";

	public Page listReception(MM7_01VO vo) throws Exception {
		return listWithPaging(commonId + "listReception", vo);
	}

	public Page listOutgoing(MM7_01VO vo) throws Exception {
		return listWithPaging(commonId + "listOutgoing", vo);
	}

	public Page listDuring(MM7_01VO vo) throws Exception {
		return listWithPaging(commonId + "listDuring", vo);
	}

	public MM7_01VO objectDoc(MM7_01VO vo) throws Exception {
		return (MM7_01VO) selectByPk(commonId + "objectDoc", vo);
	}

	public String insertDoc(MM7_01VO vo) throws Exception {
		return (String) insert(commonId + "insertDoc", vo);
	}
	
	public Integer updateDoc(MM7_01VO vo) throws Exception {
		return update(commonId + "updateDoc", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM7_01VO> listOrganCode(MM7_01VO vo) throws Exception {
		return list(commonId + "listOrganCode", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM7_01VO> listReceiveOrganCode(MM7_01VO vo) throws Exception {
		return list(commonId + "listReceiveOrganCode", vo);
	}
	
	public Boolean insertDocReceive(MM7_01VO vo) throws Exception {
		insert(commonId + "insertDocReceive", vo);
		return true;
	}
	
	public Integer deleteDoc(MM7_01VO vo) throws Exception {
		return delete(commonId + "deleteDoc", vo);
	}
	
	public Integer deleteDocReceive(MM7_01VO vo) throws Exception {
		return delete(commonId + "deleteDocReceive", vo);
	}

	public Integer deleteDocSearchMember(MM7_01VO vo) throws Exception {
		return delete(commonId + "deleteDocSearchMember", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM7_01VO> listReceive(MM7_01VO vo) throws Exception {
		return list(commonId + "listReceive", vo);
	}

	@SuppressWarnings("unchecked")
	public List<MM7_01VO> listReceiveMember(MM7_01VO vo) throws Exception {
		return list(commonId + "listReceiveMember", vo);
	}
	
	public Boolean saveDocSearchMember(MM7_01VO vo) throws Exception {
		insert(commonId + "saveDocSearchMember", vo);
		return true;
	}
	
	public Integer updateOutgoingCancel(MM7_01VO vo) throws Exception {
		return update(commonId + "updateOutgoingCancel", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM7_01VO> listWriteOrganCode(MM7_01VO vo) throws Exception {
		return list(commonId + "listWriteOrganCode", vo);
	}
	
	public Integer unreadReceptionCount(MM7_01VO vo) throws Exception {
		return (Integer) selectByPk(commonId + "unreadReceptionCount", vo);
	}
}