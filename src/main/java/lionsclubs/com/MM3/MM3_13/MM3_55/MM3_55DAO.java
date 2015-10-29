package lionsclubs.com.MM3.MM3_13.MM3_55;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_55DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_13.MM3_55.";
	
	public MM3_55VO MM3_55(MM3_55VO vo) throws Exception {
		return (MM3_55VO) selectByPk(commonId + "MM3_55", vo);
	}
	
	/**
	 * 이전/다음 memberNo
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_55VO memberNo(MM3_55VO vo) throws Exception {
		return (MM3_55VO) selectByPk(commonId + "memberNo", vo);
	}
	
	public String initMemberNo(MM3_55VO vo) throws Exception {
		return (String) selectByPk(commonId + "initMemberNo", vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM3_55VO> listRepOrgan(MM3_55VO vo) throws Exception {
		return list(commonId + "listRepOrgan", vo);
	}

	public MM3_55VO objectRepOrgan(MM3_55VO vo) throws Exception {
		return (MM3_55VO) selectByPk(commonId + "objectRepOrgan", vo);
	}

	public Boolean insertRepOrgan(MM3_55VO vo) throws Exception {
		insert(commonId + "insertRepOrgan", vo);
		return Boolean.TRUE;
	}
	
	public Integer updateRepOrgan(MM3_55VO vo) throws Exception {
		return update(commonId + "updateRepOrgan", vo);
	}

	public Integer deleteRepOrgan(MM3_55VO vo) throws Exception {
		return delete(commonId + "deleteRepOrgan", vo);
	}
}
