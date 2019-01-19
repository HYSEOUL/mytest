package kr.or.kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.ClassVO;
import dto.PageVO;
import dto.SearchVO;
import dto.StudyVO;
import kr.or.kosta.mvc.dao.ClassDao;
import kr.or.kosta.mvc.dao.GeneralSearchDAO;
import kr.or.kosta.mvc.service.ClassServiceInter;

@Controller
public class GeneralSearchController {

	@Autowired
	private GeneralSearchDAO generalSearchDAO;

	@RequestMapping(value = "/selectGeneralSearch")
	public ModelAndView selectGeneralSearch(@RequestParam int page, 
			@RequestParam String searchType) {
		PageVO pageInfo = new PageVO();

		int rowsPerPage = 9;
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

		ModelAndView mav = new ModelAndView();
		String searchValue = "";
		List<ClassVO> list;

		switch (searchType) {
		case "1":
			searchValue = "외국어";
			// searchType = "1";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchType : " + searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "2":
			searchValue = "스포츠";
			// searchType = "2";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchType : " + searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "3":
			searchValue = "음악";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "4":
			searchValue = "미술";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "5":
			searchValue = "댄스";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "6":
			searchValue = "연기";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "7":
			searchValue = "자격증";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "8":
			searchValue = "취미";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "9":
			searchValue = "뷰티";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		case "10":
			searchValue = "프로그래밍";
			svo.setSearchValue(searchValue);
			svo.setSearchType(searchType);
			System.out.println("searchValue : " + searchValue);
			break;
		}

		int totalRows = generalSearchDAO.getTotalCount(svo);
		System.out.println("totalRows : " + totalRows);

		int totalPages = 0;

		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
			System.out.println("totalRows % rowsPerPage : " + totalRows % rowsPerPage);
			System.out.println("totalRows / rowsPerPage : " + totalRows / rowsPerPage);
		} else {
			totalPages = totalRows / rowsPerPage + 1;
			System.out.println("totalRows / rowsPerPage + 1 : " + totalRows / rowsPerPage + 1);
		}

		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
			System.out.println("totalPages / pagesPerBlock : " + totalPages / pagesPerBlock);
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
			System.out.println("totalPages / pagesPerBlock + 1 : " + totalPages / pagesPerBlock + 1);
		}

		System.out.println("currentPage : " + currentPage);
		System.out.println("currentBlock : " + currentBlock);
		System.out.println("rowsPerPage : " + rowsPerPage);
		System.out.println("pagesPerBlock : " + pagesPerBlock);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		System.out.println("totalBlocks : " + totalBlocks);
		System.out.println("totalPages : " + totalPages);
		System.out.println("totalRows : " + totalRows);

		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalBlocks(totalBlocks);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalRows(totalRows);


		list = generalSearchDAO.generalListSearch(svo);
		mav.addObject("list", list);

		if (totalRows != 0) {
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("searchValue", searchValue);
			mav.setViewName("general_search_form");
		} else {
			mav.setViewName("no_search_result");
		}

		return mav;
	}

	@RequestMapping(value = "/totalSearch", method = RequestMethod.GET)
	public ModelAndView totalSearch(@RequestParam int page, 
			@RequestParam String searchType,
			@RequestParam String searchValue) {
		PageVO pageInfo = new PageVO();

		int rowsPerPage = 9;
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

		/*int totalRows;*/
		System.out.println(searchValue);
		System.out.println(searchType);
		
		int totalRows = 0;
		
		switch (searchType) {
		case "1":
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			totalRows = generalSearchDAO.getClassSearchCount(svo);
			System.out.println("searchType : " + searchType);
			break;
		case "2":
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			totalRows = generalSearchDAO.getClassSearchCount(svo);
			System.out.println("searchType : " + searchType);
			break;
		case "3":
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			totalRows = generalSearchDAO.getClassSearchCount(svo);
			System.out.println("searchType : " + searchType);
			break;
		case "4":
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			totalRows = generalSearchDAO.getStudySearchCount(svo);
			System.out.println("searchType : " + searchType);
			break;
		case "5":
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			totalRows = generalSearchDAO.getStudySearchCount(svo);
			System.out.println("searchType : " + searchType);
			break;
		case "6":
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			totalRows = generalSearchDAO.getStudySearchCount(svo);
			System.out.println("searchType : " + searchType);
			break;
		}

		System.out.println("totalRows : " + totalRows);

		int totalPages = 0;


		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
			System.out.println("totalRows % rowsPerPage : " + totalRows % rowsPerPage);
			System.out.println("totalRows / rowsPerPage : " + totalRows / rowsPerPage);
		} else {
			totalPages = totalRows / rowsPerPage + 1;
			System.out.println("totalRows / rowsPerPage + 1 : " + totalRows / rowsPerPage + 1);
		}

		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
			System.out.println("totalPages / pagesPerBlock : " + totalPages / pagesPerBlock);
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
			System.out.println("totalPages / pagesPerBlock + 1 : " + totalPages / pagesPerBlock + 1);
		}

		System.out.println("currentPage : " + currentPage);
		System.out.println("currentBlock : " + currentBlock);
		System.out.println("rowsPerPage : " + rowsPerPage);
		System.out.println("pagesPerBlock : " + pagesPerBlock);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		System.out.println("totalBlocks : " + totalBlocks);
		System.out.println("totalPages : " + totalPages);
		System.out.println("totalRows : " + totalRows);

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
		List<ClassVO> list;
		List<StudyVO> slist;

		switch (searchType) {
		case "1":
			list = generalSearchDAO.classListSearch(svo);
			mav.setViewName("general_search_form");
			System.out.println("generalSearchDAO : 1");
			mav.addObject("list", list);
			searchType = "강의명";
			svo.setSearchType(searchType);
			break;
		case "2":
			list = generalSearchDAO.classListSearch(svo);
			mav.setViewName("general_search_form");
			System.out.println("generalSearchDAO : 2");
			mav.addObject("list", list);
			searchType = "강의서비스분야";
			svo.setSearchType(searchType);
			break;
		case "3":
			list = generalSearchDAO.classListSearch(svo);
			mav.setViewName("general_search_form");
			System.out.println("generalSearchDAO : 3");
			mav.addObject("list", list);
			searchType = "강의지역";
			svo.setSearchType(searchType);
			break;
		case "4":
			slist = generalSearchDAO.studyListSearch(svo);
			mav.setViewName("general_search_form_study");
			System.out.println("generalSearchDAO : 4");
			mav.addObject("slist", slist);
			searchType = "스터디명";
			svo.setSearchType(searchType);
			break;
		case "5":
			slist = generalSearchDAO.studyListSearch(svo);
			mav.setViewName("general_search_form_study");
			System.out.println("generalSearchDAO : 5");
			mav.addObject("slist", slist);
			searchType = "스터디서비스분야";
			svo.setSearchType(searchType);
			break;
		case "6":
			slist = generalSearchDAO.studyListSearch(svo);
			mav.setViewName("general_search_form_study");
			System.out.println("generalSearchDAO : 6");
			mav.addObject("slist", slist);
			searchType = "스터디지역";
			svo.setSearchType(searchType);
			break;
		}

		if (totalRows != 0) {
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("searchValue", searchValue);
			mav.addObject("searchType", searchType);
		} else {
			mav.setViewName("no_search_result");
		}

		return mav;
	}
	
	@RequestMapping(value="/showclass", method=RequestMethod.GET)
	public ModelAndView list(
			int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 9;
		int pagesPerBlock = 5;
		int currentPage = page;
		int currentBlock = 0;
		
		if(currentPage%pagesPerBlock == 0) {
			currentBlock = currentPage / pagesPerBlock;
		}else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		
		int startRow = (currentPage-1)*rowsPerPage+1;
		int endRow = currentPage * rowsPerPage;
		
		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);
		
		int totalRows = generalSearchDAO.getClassSearchCount(svo);
		System.out.println("totalRows : "+totalRows);
		
		int totalPages = 0;
		
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}

		int totalBlocks = 0;
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalBlocks(totalBlocks);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalRows(totalRows);
		
		// ---------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("general_search_form");

		// Map�� Dao�� ����
		List<ClassVO> list = generalSearchDAO.classListSearch(svo);
		
		//�������� ����Ʈ ���� ModelAndView�� ����ؼ� �� ����
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		mav.addObject("list",list);
				
		return mav;
	}
	
		@RequestMapping(value="/selectStudy", method=RequestMethod.GET)//?
		public ModelAndView selectListStudy(
				int page, String searchType, String searchValue) {
			PageVO pageInfo = new PageVO();
			
			int rowsPerPage = 9;
			int pagesPerBlock = 5;
			int currentPage = page;
			int currentBlock = 0;
			
			if(currentPage%pagesPerBlock == 0) {
				currentBlock = currentPage / pagesPerBlock;
			}else {
				currentBlock = currentPage / pagesPerBlock + 1;
			}
			
			int startRow = (currentPage-1)*rowsPerPage+1;
			int endRow = currentPage * rowsPerPage;
			
			SearchVO svo = new SearchVO();
			svo.setBegin(String.valueOf(startRow));
			svo.setEnd(String.valueOf(endRow));
			svo.setSearchType(searchType);
			svo.setSearchValue(searchValue);
			
			int totalRows = generalSearchDAO.getStudySearchCount(svo);
			System.out.println("totalRows : "+totalRows);
			
			int totalPages = 0;
			
			if(totalRows % rowsPerPage == 0) {
				totalPages = totalRows / rowsPerPage;
			}else {
				totalPages = totalRows / rowsPerPage + 1;
			}
			
			int totalBlocks = 0;
			if(totalPages % pagesPerBlock == 0) {
				totalBlocks = totalPages / pagesPerBlock;
			}else {
				totalBlocks = totalPages / pagesPerBlock + 1;
			}
			
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
			mav.setViewName("general_search_form");
			
			List<StudyVO> slist = generalSearchDAO.studyListSearch(svo);
			
			mav.addObject("pageInfo",pageInfo);
			mav.addObject("searchType",searchType);
			mav.addObject("searchValue",searchValue);
			mav.addObject("slist", slist);
			return mav;
		}
}
