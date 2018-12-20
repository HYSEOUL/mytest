package kr.or.kosta.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.ClassVO;
import dto.StudyVO;
import kr.or.kosta.mvc.dao.SearchDaoInter;

@Controller
public class SearchController {

	@Autowired
	private SearchDaoInter searchDaoInter;

	// index.jsp 에서 post 방식으로 searchField action값을 통해서
	// searchview()메소드로 접근함.
	// searchType은 select태그의 변수값이고,
	// searchName은 input="text"의 id값임.
	@RequestMapping("/searchField")
	public String searchview(@RequestParam String searchType, 
			@RequestParam String searchName, Model m) {
		System.out.println(searchName + " : " + searchType);
		// Map으로 searchType과 searchName을 묶어서 저장함.
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchName", searchName);
		String viewName = "";
		// select 태그에서 저장된 option value의 값을 통하여 switch문으로 접근함.
		// value는 1,2,3,4 값으로 들어옴.
		switch (searchType) {
		case "1": // 통합검색 (case 2, 3, 4)의 모든 결과를 보여줌.
			List<ClassVO> classList = searchDaoInter.readClassSearch(map);
			List<ClassVO> teacherList = searchDaoInter.readTeacherSearch(map);
			List<StudyVO> studyList = searchDaoInter.readStudySearch(map);
			m.addAttribute("classList", classList);
			m.addAttribute("teacherList", teacherList);
			m.addAttribute("studyList", studyList);
			viewName = "searchAll";
			break;
		case "2": // 강의명에 따른 강의검색
			List<ClassVO> clist = searchDaoInter.readClassSearch(map);
			m.addAttribute("clist", clist);
			viewName = "searchClass";
			break;
		case "3": // 강사명에 따른 강의검색
			List<ClassVO> mlist = searchDaoInter.readTeacherSearch(map);
			m.addAttribute("mlist", mlist);
			viewName = "searchTeacher";
			break;
		case "4": // 스터디명에 따른 스터디검색
			List<StudyVO> slist = searchDaoInter.readStudySearch(map);
			m.addAttribute("slist", slist);
			viewName = "searchStudy";
			break;
		}
		return viewName;
	}
}
