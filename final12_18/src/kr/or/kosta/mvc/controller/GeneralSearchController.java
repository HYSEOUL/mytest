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
import dto.StudyVO;
import kr.or.kosta.mvc.dao.GeneralSearchDAO;

@Controller
public class GeneralSearchController {
	
	@Autowired
	private GeneralSearchDAO generalSearchDAO;
	
	// ���͵��, ���񽺺о�, ������ ���� �б��Ͽ� �˻� ����� ���
	@RequestMapping(value = "/selectGeneralSearch")
	public ModelAndView selectGeneralSearch(
			@RequestParam int page, 
			@RequestParam String searchType) {
		PageVO pageInfo = new PageVO();

		int rowsPerPage = 9; // �� �������� ������ ����Ʈ ����
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
		

		// ��ü ���ڵ� ��
		int totalRows = generalSearchDAO.getTotalCount(svo);
		System.out.println("totalRows : " + totalRows);

		int totalPages = 0;

		// ��ü �������� ���ϴ� ����
		
		if (totalRows % rowsPerPage == 0) { totalPages = totalRows / rowsPerPage; }
		else { totalPages = totalRows / rowsPerPage + 1; }
		

		// ��ü ����� ���ϴ� ����
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}

		// pageVO�� setter�� ���� ����
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
		switch (searchType) {
		case "1":
			searchValue = "��Ȱ";
			svo.setSearchValue(searchValue);
			System.out.println("�ܱ��� �˻�");
			List<ClassVO> list = generalSearchDAO.languageListSearch(svo);
			mav.addObject("list", list);
			break;
		}
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchValue", searchValue);
		mav.setViewName("general_search_form");

		return mav;
	}
	
}
