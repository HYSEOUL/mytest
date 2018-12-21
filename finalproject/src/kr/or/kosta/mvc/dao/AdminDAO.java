package kr.or.kosta.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import annomapper.AdminMapper;
import dto.AdminVO;
import dto.BlockVO;
import dto.ClassVO;
import dto.M_studentVO;
import dto.M_teacherVO;
import dto.SearchVO;
import dto.StudyVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public AdminVO adminLoginInfo(String a_id, String a_pwd) {
		Map<String, Object> adminMap = new HashMap<>();
		adminMap.put("a_id", a_id);
		adminMap.put("a_pwd", a_pwd);

		return ss.selectOne("admin.readLogin", adminMap);
	}
	
	// ------------------------------------------------------------ 
	
	// 강의 수 페이징 처리 
	public int classcount(SearchVO svo) {
		return ss.selectOne("admin.classcount",svo);
	}
	
	public List<ClassVO> selclassuall(SearchVO svo){
		List<ClassVO> cvo = ss.selectList("admin.selclassuall",svo);
		return cvo;
	}
	
	public ClassVO selclassone(int num) {
		ClassVO cvo = ss.selectOne("admin.selclassone",num);
		return cvo;
	}
	// -------------------------------------------------------------
	
	// 학생 수 페이징 처리
	public int stucount(SearchVO svo) {
		return ss.selectOne("admin.stucount",svo);
	}
		
	public List<M_studentVO> selstuall(SearchVO svo){
		List<M_studentVO> msvo = ss.selectList("admin.selstuall",svo);
		return msvo;
	}
	
	//---------------------------------------------------------------------	
	// 강사 수 페이징 처리
	public int teachcount(SearchVO svo) {
		return ss.selectOne("admin.teachcount",svo);
	}
	
	public List<M_teacherVO> selteachall(SearchVO svo){
		List<M_teacherVO> mtvo = ss.selectList("admin.selteachall",svo);
		return mtvo;
	}
	//---------------------------------------------------------------------
	
	// 스터디 페이징 처리
	public int studycount(SearchVO searchvo) {
		return ss.selectOne("admin.studycount",searchvo);
	}
	
	public List<StudyVO> selstudyall(SearchVO searchvo){
		List<StudyVO> svo = ss.selectList("admin.selstudyall",searchvo);
		return svo;
	}
	
	
// 신고 페이징 처리 --------------------------------------------------------------
	public int blockcount(SearchVO svo) {
		return ss.selectOne("admin.blockcount",svo);
	}
	
	public List<BlockVO> selblockall(SearchVO svo){
		List<BlockVO> bvo = ss.selectList("admin.selblockall",svo);
		return bvo;
	}
	
//	어노테이션  --------------------------------------------------------------	
	public List<ClassVO> getClassList(){
		AdminMapper mapper = ss.getMapper(AdminMapper.class);
		// 어노테이션 동작
		List<ClassVO> cvo = mapper.getClassList();
		return cvo;
	}
}
