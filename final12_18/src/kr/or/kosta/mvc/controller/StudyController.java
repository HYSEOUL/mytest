package kr.or.kosta.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.PageVO;
import dto.SearchVO;
import dto.StudyVO;
import kr.or.kosta.mvc.dao.StudyDAOInter;

@Controller
public class StudyController {
		
	// Dao�� ����
	@Autowired
	private StudyDAOInter StudyDAOInter;
	
	// ���͵� ���� ������ �̵�
	@GetMapping("/create_study")
	public String studyCreate() {
		return "study_Form";
	}


	@PostMapping("/createStudy")
	@ResponseBody
	public ModelAndView createStudy(@ModelAttribute("svo") StudyVO svo, HttpSession session , 
			HttpServletRequest request) {
		
		String img_path ="resources\\images";
		System.out.println("img_path"+img_path);
		String r_path = request.getRealPath("/");
		
		MultipartFile mfile = svo.getMf_img();
		
		String oriFn = mfile.getOriginalFilename();
		long size = mfile.getSize();
		String contentType = mfile.getContentType();
		
		System.out.println(r_path);
		System.out.println("���ϸ� : " + oriFn);
		System.out.println("����ũ�� : " + size);
		System.out.println("Type : " + contentType);
		
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\")
		.append(oriFn);
		System.out.println(path);
		
		File f = new File(path.toString());
		System.out.println(f.exists());
		
		// ���� ���ε� ����
		
		// �̹����� �̸��� ���� Database�� �����ϱ� ���ؼ�
		svo.setS_img(oriFn);
		StudyDAOInter.createStudy(svo);
		
		try {
			mfile.transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		String ms_id = (String) session.getAttribute("ms_id");	
		System.out.println(ms_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("svo", svo);
		mav.setViewName("redirect:/selectListStudy");
		return mav;//"redirect:create_study";
	}
	
	@RequestMapping(value="/selectListStudy", method=RequestMethod.GET)//?
	public ModelAndView selectListStudy(
			int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 9; //�� �������� ������ ����Ʈ ����
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
		
		//��ü ���ڵ� ��
		int totalRows = StudyDAOInter.getTotalCount(svo);
		System.out.println("totalRows : "+totalRows);
		
		int totalPages = 0;
		
		//��ü �������� ���ϴ� ����
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		
		//��ü ����� ���ϴ� ����
		int totalBlocks = 0;
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		
		//pageVO�� setter�� ���� ����
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
		mav.setViewName("study_list");
		
		List<StudyVO> list = StudyDAOInter.readListStudy(svo);
		
		//�������� ����Ʈ ���� ModelAndView�� ����ؼ� �� ����
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		mav.addObject("list",list);
		return mav;
	}
	
	// ���͵��, ���񽺺о�, ������ ���� �б��Ͽ� �˻� ����� ���
	@RequestMapping(value="/selectSearchStudy")
	public ModelAndView selectSearch(
			@RequestParam int page,
			@RequestParam String searchType, 
			@RequestParam String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 9; //�� �������� ������ ����Ʈ ����
		int pagesPerBlock = 5;
		int currentPage = page;
		int currentBlock = 0;
		
		System.out.println(page);
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

		// ��ü ���ڵ� ��
		int totalRows = StudyDAOInter.getTotalCount(svo);
		System.out.println("totalRows : " + totalRows);

		int totalPages = 0;

		// ��ü �������� ���ϴ� ����
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}

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
		mav.setViewName("study_list");
		
		List<StudyVO> list = StudyDAOInter.readStudySearch(svo);
		
		//�������� ����Ʈ ���� ModelAndView�� ����ؼ� �� ����
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		mav.addObject("list", list);
		
		return mav;
	}
	
	//selectOneStudy
	@RequestMapping(value="/selectOneStudy")
	public ModelAndView selectOneStudy(
			@RequestParam int s_num) {
		ModelAndView mav = new ModelAndView();
		StudyVO svo = StudyDAOInter.readOneStudy(s_num);
		mav.setViewName("study_listOne");
		mav.addObject("svo", svo);
		return mav;
	}
	//����������
	@RequestMapping(value="/updateStudyForm")
	public String updateStudyForm(Model m, @RequestParam int s_num) {
		StudyVO svo = StudyDAOInter.readOneStudy(s_num);
		m.addAttribute("svo",svo);
		return "study_update_Form";
	}
	//�����ϱ�
	@PostMapping("/updateStudy")
	public ModelAndView updateStudy(@ModelAttribute("svo") StudyVO svo, HttpSession session , 
			HttpServletRequest request) {
		String img_path ="resources\\images";
		String r_path = request.getRealPath("/");
		
		MultipartFile mfile = svo.getMf_img();
		
		String oriFn = mfile.getOriginalFilename();
		long size = mfile.getSize();
		String contentType = mfile.getContentType();
		
		System.out.println(r_path);
		System.out.println("���ϸ� : " + oriFn);
		System.out.println("����ũ�� : " + size);
		System.out.println("Type : " + contentType);
		
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\")
		.append(oriFn);
		System.out.println(path);
		
		File f = new File(path.toString());
		System.out.println(f.exists());
		
		// ���� ���ε� ����
		
		// �̹����� �̸��� ���� Database�� �����ϱ� ���ؼ�
		svo.setS_img(oriFn);
		StudyDAOInter.updateStudy(svo);
		try {
			mfile.transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		String ms_id = (String) session.getAttribute("ms_id");	
		System.out.println(ms_id);
		ModelAndView mav = new ModelAndView("redirect:selectOneStudy?num="+svo.getS_num());
		return mav;
	}
	
	
	//�����ϱ�
	@RequestMapping(value="/deleteStudy")
	public String deleteStudy(int num) {
		StudyDAOInter.deleteStudy(num);
		return "redirect:/selectListStudy";
		
	}
	
	
	
}
	
