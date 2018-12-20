package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassVO;
import dto.SearchVO;

@Repository
public class ClassDao {

	@Autowired
	private SqlSessionTemplate ss;
	
	public void createClass(ClassVO vo) {
//		ss.insert("class.test");
		ss.insert("class.createclasspro",vo);
//		ss.insert("class.createclass",vo);
	}
	
	public void createClass2(ClassVO vo) {
		ss.insert("class.createclass2",vo);
	}
	
	// 페이지 카운트에 개수 사용할 dao
	public int getTotalCount(dto.SearchVO svo) {
		return ss.selectOne("class.count",svo);
	}
	
	public List<ClassVO> readClass() {
		List<ClassVO> list = ss.selectList("class.selectlistclass");
		return list;
	}
	// 페이징 처리 리스트를 뿌려 줄 dao
	public List<ClassVO> readClass2(SearchVO sevo){
		return ss.selectList("class.selectlistclass2");
	}
	
	// 강의명, 서비스분야, 지역에 따라 분기하여 검색 결과를 출력
	public List<ClassVO> readClassSearch(SearchVO sevo) {
		System.out.println("searchType" + sevo.getSearchType());
		System.out.println("searchValue" + sevo.getSearchValue());
		return ss.selectList("class.listsearch", sevo);
	}
	
	// 강의 리스트에서 글 선택 시 글 내용 뿌려줄 dao <- 2018/12/14 not use 
	public ClassVO readoneClass(int num) {
		return ss.selectOne("class.selectoneclass",num);
	}
	
	// 강의 정보 불러올 때 댓글이랑 같이 불러오는 dao
	public List<ClassVO> readoneClassC1(int num){
//		System.out.println("전달 넘버값:"+num);
		return ss.selectList("class.classc1list",num);
	}
	
	public void updateClass() {
		ss.update("class.updateclass");
	}
	
	public void updateClass2(ClassVO vo) {
		ss.update("class.updateclass2",vo);
	}
	
	public void deleteClass(int num) {
		ss.delete("class.deleteclass",num);
	}
	
}
