package lionsclubs.com.MM3.MM3_7.MM3_33;

import java.util.List;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_33DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_7.MM3_33.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_33VO_DATA> selectList(MM3_33VO vo) {
		return (List<MM3_33VO_DATA>)list(commonId + "selectList", vo);
	}
	
	public MM3_33VO_DATA selectOrgan(String memberNo){
		return (MM3_33VO_DATA)selectByPk(commonId + "selectOrgan", memberNo);
    }

	public int insertData(MM3_33VO_DATA vo) {
		return this.update(commonId + "insert", vo);
	}

	public int updateData(MM3_33VO_DATA vo) {
		return this.update(commonId + "update", vo);
	}

	public int deleteData(MM3_33VO_DATA vo) {
		return this.update(commonId + "delete", vo);
	}
	
	public int deleteAppointment(MM3_33VO_DATA vo) {
		return this.update(commonId + "deleteAppointment", vo);
	}
	
	public Integer selectAppointment(MM3_33VO_DATA vo){
		return (Integer)selectByPk(commonId + "selectAppointment", vo);
    }
	

}
