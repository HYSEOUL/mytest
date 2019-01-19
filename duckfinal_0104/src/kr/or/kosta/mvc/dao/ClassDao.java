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
	
	// ������ ī��Ʈ�� ���� ����� dao
	
	public int getTotalCount(SearchVO svo) {
		return ss.selectOne("class.count",svo);
	}
	
	public List<ClassVO> readClass() {
		List<ClassVO> list = ss.selectList("class.selectlistclass");
		return list;
	}
	// ����¡ ó�� ����Ʈ�� �ѷ� �� dao
	// 2018.12.17 
	// ���� ��Ͽ��� Ŭ���� ��¥ ���ؼ� 
    // 0�ϰ�� �״�� �۵�
	// 1�� ��� Ŭ���� �ȵ�, ������ ����ȵ�)
	public List<ClassVO> readClass2(SearchVO sevo){
		return ss.selectList("class.selectlistclass2");
	}
	
	// ���Ǹ�, ���񽺺о�, ������ ���� �б��Ͽ� �˻� ����� ���
	public List<ClassVO> readClassSearch(SearchVO sevo) {
		System.out.println("searchType" + sevo.getSearchType());
		System.out.println("searchValue" + sevo.getSearchValue());
		return ss.selectList("class.listsearch", sevo);
	}
	
	// ���� ����Ʈ���� �� ���� �� �� ���� �ѷ��� dao <- 2018/12/14 not use 
	public ClassVO readoneClass(int c_num) {
		return ss.selectOne("class.selectoneclass", c_num);
	}
	
	// ���� ���� �ҷ��� �� ����̶� ���� �ҷ����� dao
	public List<ClassVO> readoneClassC1(int num){
//		System.out.println("���� �ѹ���:"+num);
		return ss.selectList("class.classc1list",num);
	}
	
	//�׻ͻ�  �Ʒ����� �����ѵ�...........??�����..��?
	public void updateClass() {
		ss.update("class.updateclass");
	}
	
	public void updateClass2(ClassVO vo) {
		ss.update("class.updateclass2",vo);
	}
	
	public void deleteClass(int num) {
		ss.delete("class.deleteclass",num);
	}
	
   /*�����κ�*/
	
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
	
	/*�����κ� ��*/
	
}
