package kr.or.kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.ClassVO;
import dto.PageVO;
import dto.SearchVO;
import kr.or.kosta.mvc.dao.ClassDao;
import kr.or.kosta.mvc.dao.GeneralSearchDAO;
import kr.or.kosta.mvc.service.ClassServiceInter;

@Controller
public class GeneralSearchController {
	
	@Autowired
	private GeneralSearchDAO generalSearchDAO;
	
	// 서비스 분야 10개에 대한 데이터 출력
	// 1.외국어	2.스포츠	3.음악	4.미술	5.댄스
	// 6.연기	7.자격증	8.취미	9.뷰티	10.프로그래밍
	@RequestMapping(value = "/selectGeneralSearch")
	public ModelAndView selectGeneralSearch(
			@RequestParam int page, 
			@RequestParam String searchType) {
		PageVO pageInfo = new PageVO();

		int rowsPerPage = 9; // 한 페이지에 나오는 리스트 갯수
		int pagesPerBlock = 5;
		int currentPage = page;
		int currentBlock = 0;

		System.out.println(page);
		if (currentPage % pagesPerBlock == 0) {
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}

		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;

		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));

		// 전체 레코드 수
		int totalRows = generalSearchDAO.getTotalCount(svo);
		System.out.println("totalRows : " + totalRows);

		int totalPages = 0;

		// 전체 페이지를 구하는 공식

		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}

		// 전체 블록을 구하는 공식
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}

		// pageVO에 setter로 값을 주입
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalBlocks(totalBlocks);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalRows(totalRows);

		ModelAndView mav = new ModelAndView();
		String searchName = "";
		String searchValue = "";
		List<ClassVO> list;

		switch (searchType) {
		case "1":
			searchValue = "외국어";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "2":
			searchValue = "스포츠";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "3":
			searchValue = "음악";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "4":
			searchValue = "미술";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "5":
			searchValue = "댄스";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "6":
			searchValue = "연기";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "7":
			searchValue = "자격증";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "8":
			searchValue = "취미";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "9":
			searchValue = "뷰티";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		case "10":
			searchValue = "프로그래밍";
			svo.setSearchValue(searchValue);
			System.out.println("searchValue : " + searchValue);
			break;
		}
		
		list = generalSearchDAO.generalListSearch(svo);
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchValue", searchValue);
		mav.setViewName("general_search_form");

		return mav;
	}
}
