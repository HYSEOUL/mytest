package kr.or.kosta.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.ClassVO;
import dto.Sc_listVO;
import dto.SearchVO;

@Repository
public class ClassDao {

	@Autowired
	private SqlSessionTemplate ss;
	
	public void createClass(ClassVO vo) {
		System.out.println("createClass : " + vo);
//		ss.insert("class.test");
		ss.insert("class.createclasspro",vo);
//		ss.insert("class.createclass",vo);
	}
	
	/* public void createClass2(ClassVO vo) {
		ss.insert("class.createclass2",vo);
	} */
	
	// 페이지 카운트에 개수 사용할 dao
	
	public int getTotalCount(SearchVO svo) {
		return ss.selectOne("class.count",svo);
	}
	
	public List<ClassVO> readClass() {
		List<ClassVO> list = ss.selectList("class.selectlistclass");
		return list;
	}
	// 페이징 처리 리스트를 뿌려 줄 dao
	// 2018.12.17 
	// 강의 목록에서 클릭시 날짜 비교해서 
    // 0일경우 그대로 작동
	// 1일 경우 클릭이 안되, 페이지 변경안됨)
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
	public ClassVO readoneClass(int c_num) {
		return ss.selectOne("class.selectoneclass", c_num);
	}
	
	// 강의 정보 불러올 때 댓글이랑 같이 불러오는 dao
	public List<ClassVO> readoneClassC1(int num){
//		System.out.println("전달 넘버값:"+num);
		return ss.selectList("class.classc1list",num);
	}
	
	//뿡뽕빵  아래꺼랑 동일한데...........??만들다..맘?
	public void updateClass() {
		ss.update("class.updateclass");
	}
	
	public void updateClass2(ClassVO vo) {
		ss.update("class.updateclass2",vo);
	}
	
	public void deleteClass(int num) {
		ss.delete("class.deleteclass",num);
	}
	
   /*다혜부분*/
	
	//class_list insert
	public void insertClassList(Sc_listVO scvo) {
		ss.insert("class.insertClassList",scvo);
	}
	//class_list update
	public void updateClassList(Sc_listVO scvo) {
		ss.update("class.updateClassList",scvo);
	}
	//class_list delete
	public void deleteclass_list(int sc_num) {
		ss.delete("class.deleteclass_list",sc_num);
	}
	
	/*다혜부분 끗*/
	
}
