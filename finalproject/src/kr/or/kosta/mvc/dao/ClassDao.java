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
	
// ���� Create --------------------------------------------------
	public void createClass(ClassVO vo) {
		ss.insert("class.createclasspro",vo);
	}

// ���� Read --------------------------------------------------	
	public int getTotalCount(dto.SearchVO svo) {
		return ss.selectOne("class.count",svo);
	}
	
	// ����¡ ó�� ����Ʈ�� �ѷ� �� dao
	// 2018.12.17 
	// ���� ��Ͽ��� Ŭ���� ��¥ ���ؼ� 
    // 0�ϰ�� �״�� �۵�
	// 1�� ��� Ŭ���� �ȵ�, ������ ����ȵ�)
	public List<ClassVO> readClass2(SearchVO sevo){
		return ss.selectList("class.selectlistclass2");
	}
	
	// ���� ���� �ҷ��� �� ����̶� ���� �ҷ����� dao
	public List<ClassVO> readoneClassC1(int num){
		return ss.selectList("class.classc1list",num);
	}
	
// ���� Update --------------------------------------------------
	public void updateClass2(ClassVO vo) {
		ss.update("class.updateclass2",vo);
	}
	
	// ���� ����Ʈ���� �� ���� �� �� ���� �ѷ��� dao  
	public ClassVO readoneClass(int c_num) {
		return ss.selectOne("class.selectoneclass", c_num);
	}
	
// ���� Delete --------------------------------------------------	
	public void deleteClass(int num) {
		ss.delete("class.deleteclass",num);
	}	


// ���Ǹ�, ���񽺺о�, ������ ���� �б��Ͽ� �˻� ����� ���
	public List<ClassVO> readClassSearch(SearchVO sevo) {
		System.out.println("searchType" + sevo.getSearchType());
		System.out.println("searchValue" + sevo.getSearchValue());
		return ss.selectList("class.listsearch", sevo);
	}
	
	
   /*�����κ�*/
	
	//������������ ����or����ư Ŭ���� class_list insert
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
	
	/*�����κ� ��*/
	
}
