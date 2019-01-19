package kr.or.kosta.mvc.controller;

import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.AdminVO;
import dto.BlockVO;
import dto.ClassVO;
import dto.M_studentVO;
import dto.M_teacherVO;
import dto.PageVO;
import dto.SearchVO;
import dto.StudyVO;
import kr.or.kosta.mvc.dao.AdminDAO;
import kr.or.kosta.mvc.dao.BlockDAO;
import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.StudyDAOInter;
import kr.or.kosta.mvc.service.ClassServiceInter;
import kr.or.kosta.util.Utility;

// ID : admin, PWD : 123
@Controller
public class AdminController {
	
	
	@Autowired
	private ClassServiceInter classserviceinter; 
	@Autowired
	private M_studentDAOInter m_studentDAOInter;
	@Autowired
	private StudyDAOInter studyDAOInter;
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private BlockDAO blockdao;
	
	/*
	 * �α�����, �α���, �α׾ƿ�
	 * */		
	@RequestMapping(value = "/admin")
	public String adminformView() {
		return  "adminform";
	}
	
	@PostMapping("/adminLogin")
	public ModelAndView adminlogin(
			HttpSession session,
			String a_id, String a_pwd,
			@RequestHeader("User-Agent") String userAgent) throws Exception {
		AdminVO avo = new AdminVO();
		if (a_id != null && a_pwd != null) {
			avo = adminDAO.adminLoginInfo(a_id, a_pwd);
		}
		ModelAndView mav = new ModelAndView();
		if (avo == null) {
			mav.setViewName("error");
		} else { 
			session.setAttribute("a_num", avo.getA_num());
			session.setAttribute("a_id", avo.getA_id());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@RequestMapping("/adminLogout")
	public ModelAndView adminLogout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("a_num");
		session.removeAttribute("a_id"); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	@RequestMapping("/showstuall")
	public ModelAndView showstuall(int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; 
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
		
		int totalRows = adminDAO.stucount(svo);
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
		mav.setViewName("adminstuall"); 	
		
		List<M_studentVO> msvo = adminDAO.selstuall(svo);
		mav.addObject("msvo",msvo); 	
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showteachall")
	public ModelAndView showteachall(int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; 
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
		
		int totalRows = adminDAO.teachcount(svo);
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
		mav.setViewName("adminteachall"); 	
		
		List<M_teacherVO> mtvo = adminDAO.selteachall(svo);
		mav.addObject("mtvo",mtvo);
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showclassall")
	public ModelAndView showclassall(
			int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; 
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
		
		int totalRows = adminDAO.classcount(svo);
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
		mav.setViewName("adminclassall"); 	
		
		List<ClassVO> cvo = adminDAO.selclassuall(svo);
		
		mav.addObject("cvo",cvo); 	
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showstudyall")
	public ModelAndView showstudyall(int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; 
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
			
		int totalRows = adminDAO.studycount(svo);
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
		mav.setViewName("adminstudyall"); 	
		
		List<StudyVO> studyvo = adminDAO.selstudyall(svo); 	
		mav.addObject("studyvo",studyvo); 	
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showblockall")
	public ModelAndView showblockall(int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; 
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
			
		int totalRows = adminDAO.blockcount(svo);
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
		
		mav.setViewName("adminblockall"); 	
		List<BlockVO> bvo = adminDAO.selblockall(svo); 
		
		mav.addObject("bvo",bvo); 	
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
// ���� ------------------------------------------------------------------------	
	@RequestMapping(value="/delstudent")
	public String delstudent(String ms_id) {
		m_studentDAOInter.deleteMsInfo(ms_id);
		return "redirect:/showstuall?page=1";
	}
	
	/*
	 * �߰������Դϴ�. ������ ���� ���δ� �����Դϴ�.
	 * ���� ��������: �䱸��� ��ǥġ �޼��߱⶧���� �ݺ��۾��� ���� �����Դϴ�.
	 * */ 
	@RequestMapping(value="/delteacher")
	public String delteacher(String ms_id) {
		
		return "";
	}
	
	@RequestMapping(value="/delclassone")
	public String delclassone(int num) throws Exception {
		classserviceinter.deleteClass(num); 	
		return "redirect:/showclassall?page=1";
	}
	
	@RequestMapping(value="/deletestudyone")
	public String deleteStudy(int num) {
		studyDAOInter.deleteStudy(num);
		return "redirect:/showstudyall?page=1";
	}
	
	@RequestMapping("/deleteblockone")
	public String deleteBlock(int num) {
		blockdao.deleteBlock(num);
		return "redirect:/showblockall?page=1";
	}
	
	
// POI ���� ----------------------------------------------------------------------	
	@RequestMapping(value = "/downloadExcel")
	public ModelAndView downloadExcel() {
		List<ClassVO> classlist = adminDAO.getClassList();
		System.out.println("downloadExcel() - 1");
		try {
			Object obj = classlist;
			System.out.println("downloadExcel() - 2");
			for (Field field : obj.getClass().getDeclaredFields()) {
				System.out.println("downloadExcel() - 3");
				field.setAccessible(true);
				Object value = field.get(obj);
			}
		} catch (Exception e) {
			System.out.println("downloadExcel() - 4");
			e.printStackTrace();
		}
		System.out.println("downloadExcel() - 5");
		return new ModelAndView("excelView", "classlist", classlist);
	}

// ��� ���� ----------------------------------------------------------------------
	@RequestMapping("/admintonggea")
	public String admintonggea(HttpServletRequest req, HttpServletResponse resp) {		

		int date1 = (Integer.parseInt(Utility.getCurrentDate("yy")) * 10000) + 1; 			
		req.setAttribute("today", Utility.getCurrentDate());

		int[] money = new int[13];
		for(int i = 1; i<13; i++) {
			date1 = date1 + 100;
			money[i] = adminDAO.seltongmoney(date1);
			
			if(i==12) {
				req.setAttribute("money", money);
			}
		}
		String[] cate = {"�ܱ���","������","����","�̼�","��","����","�ڰ���","���","��Ƽ","���α׷���"};
		int [] rescate = new int[10];
		for(int i = 0; i<10; i++) {
			rescate[i] = adminDAO.selecategory((cate[i]));
			if(i==9) {
				int ress=adminDAO.selecategory2();
				req.setAttribute("ress", ress);
				req.setAttribute("rescate", rescate);
			}
		}
		return "admintonggea";		
	}


}
