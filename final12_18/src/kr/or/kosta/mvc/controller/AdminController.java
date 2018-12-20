package kr.or.kosta.mvc.controller;

import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
import kr.or.kosta.mvc.dao.ClassDao;
import kr.or.kosta.mvc.dao.M_studentDAOInter;
import kr.or.kosta.mvc.dao.StudyDAOInter;
import kr.or.kosta.mvc.service.ClassServiceInter;

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
	private ClassDao classdao;
	
	@Autowired
	private BlockDAO blockdao;
	
	@RequestMapping(value = "/admin")
	public String adminformView() {
		return  "adminform";
	}
	
	@PostMapping("/adminLogin")
	public ModelAndView loginfProcess(
			HttpSession session,
			String a_id, String a_pwd,
			@RequestHeader("User-Agent") String userAgent) throws Exception {
		AdminVO avo = new AdminVO();
		if (a_id != null && a_pwd != null) {
			avo = adminDAO.adminLoginInfo(a_id, a_pwd);
		}
//		System.out.println("userAgent : " + userAgent);
		ModelAndView mav = new ModelAndView();
		if (avo == null) {
			mav.setViewName("error");
		} else { // 로그인 성공
			session.setAttribute("a_num", avo.getA_num());
			session.setAttribute("a_id", avo.getA_id());
			//session.setAttribute("a_pwd", avo.getA_pwd());
			mav.setViewName("index");
		}
		return mav;
	}
	
	@RequestMapping("/showstuall")
	public ModelAndView showstuall(int page, String searchType, String searchValue) {
		/*페이징 처리*/
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; //한 페이지에 나오는 리스트 갯수
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
		
		//전체 레코드 수
//		int totalRows = classdao.getTotalCount(svo);	
		int totalRows = adminDAO.stucount(svo);
		int totalPages = 0;
		
		//전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		
		//전체 블록을 구하는 공식
		int totalBlocks = 0;
		System.out.println("토탈 페이지수"+totalPages);
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		System.out.println("토탈 블럭의 수: "+totalBlocks);
		//pageVO에 setter로 값을 주입
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
		mav.setViewName("adminstuall"); 	// 뷰 이름 결정
		
		List<M_studentVO> msvo = adminDAO.selstuall(svo);
		mav.addObject("msvo",msvo); 	// 담아서 보냄
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		System.out.println("페이지 인포: "+pageInfo);
		return mav;
	}
	
	@RequestMapping("/showclassall")
	public ModelAndView showclassall(int page, String searchType, String searchValue) {
		/*페이징 처리*/
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; //한 페이지에 나오는 리스트 갯수
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
		
		//전체 레코드 수		
		int totalRows = adminDAO.classcount(svo);
		int totalPages = 0;
		
		//전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		
		//전체 블록을 구하는 공식
		int totalBlocks = 0;
		System.out.println("토탈 페이지수"+totalPages);
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		System.out.println("토탈 블럭의 수: "+totalBlocks);
		//pageVO에 setter로 값을 주입
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
		mav.setViewName("adminclassall"); 	// 뷰 이름 결정
		
		List<ClassVO> cvo = adminDAO.selclassuall(svo);
		
		mav.addObject("cvo",cvo); 	// 담아서 보냄
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showteachall")
	public ModelAndView showteachall(int page, String searchType, String searchValue) {
		/*페이징 처리*/
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; //한 페이지에 나오는 리스트 갯수
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
		
		//전체 레코드 수		
		int totalRows = adminDAO.teachcount(svo);
		int totalPages = 0;
		
		//전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		
		//전체 블록을 구하는 공식
		int totalBlocks = 0;
		System.out.println("토탈 페이지수"+totalPages);
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		System.out.println("토탈 블럭의 수: "+totalBlocks);
		//pageVO에 setter로 값을 주입
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
		mav.setViewName("adminteachall"); 	// 뷰 이름 결정
		
		List<M_teacherVO> mtvo = adminDAO.selteachall(svo);
		mav.addObject("mtvo",mtvo);
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showstudyall")
	public ModelAndView showstudyall(int page, String searchType, String searchValue) {
		/*페이징 처리*/
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; //한 페이지에 나오는 리스트 갯수
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
		
		//전체 레코드 수 - 1차 수정구간		
		int totalRows = adminDAO.studycount(svo);
		int totalPages = 0;
		
		//전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		
		//전체 블록을 구하는 공식
		int totalBlocks = 0;
		
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		
		//pageVO에 setter로 값을 주입
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
		mav.setViewName("adminstudyall"); 	// 2차 수정구간
		
		List<StudyVO> studyvo = adminDAO.selstudyall(svo); 	// 3차 수정구간
		mav.addObject("studyvo",studyvo); 	// 4차 수정구간
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
	@RequestMapping("/showblockall")
	public ModelAndView showblockall(int page, String searchType, String searchValue) {
		/*페이징 처리*/
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 10; //한 페이지에 나오는 리스트 갯수
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
		
		//전체 레코드 수 - 1차 수정구간		
		int totalRows = adminDAO.blockcount(svo);
		int totalPages = 0;
		
		//전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		}else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		
		//전체 블록을 구하는 공식
		int totalBlocks = 0;
		
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		}else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		
		//pageVO에 setter로 값을 주입
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
		// 2차 수정구간
		mav.setViewName("adminblockall"); 	
		
		// 3차 수정구간
		List<BlockVO> bvo = adminDAO.selblockall(svo); 
		// 4차 수정구간
		mav.addObject("bvo",bvo); 	
		mav.addObject("pageInfo",pageInfo); 			
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		
		return mav;
	}
	
// ------------------------------------------------------------------------------------------
	@RequestMapping("/showclassone")
	public ModelAndView showblockall(int num) {
		ModelAndView mav = new ModelAndView();
		List<ClassVO> cvo = classdao.readoneClassC1(num);
		mav.setViewName("adminclassone");
		mav.addObject("cvo", cvo);
		
		return mav;
	}
	
// 삭제 ------------------------------------------------------------------------	
	
	@RequestMapping(value="/delclassone")
	public String delclassone(int num) throws Exception {
		classserviceinter.deleteClass(num); 	// 삭제 트랜잭션 처리
		return "redirect:/showclassall?page=1";
	}
	
	@RequestMapping(value="/delstudent")
	public String delstudent(String ms_id) {
		m_studentDAOInter.deleteMsInfo(ms_id);
		return "redirect:/showstuall?page=1";
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
	
	
	
// 테스트 구간 ----------------------------------------------------------------------	
	@RequestMapping(value="/downloadExcel")
	public ModelAndView downloadExcel() {
		List<ClassVO> classlist = adminDAO.getClassList();
		try {
		Object obj = classlist;
		for(Field field: obj.getClass().getDeclaredFields()) {
			field.setAccessible(true);
			Object value = field.get(obj);
			System.out.println("컬럼 명: "+field.getName());
			System.out.println("컬럼 값: "+value);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}				
		return new ModelAndView("excelView","classlist",classlist);
	}
	
//	@RequestMapping("/showstuall")
//	public ModelAndView showstuall(int page, String searchType, String searchValue) {
//		/*페이징 처리*/
//		PageVO pageInfo = new PageVO();
//		
//		int rowsPerPage = 10; //한 페이지에 나오는 리스트 갯수
//		int pagesPerBlock = 5;
//		
//		int currentPage = page;
//		int currentBlock = 0;		
//		if(currentPage%pagesPerBlock == 0) {
//			currentBlock = currentPage / pagesPerBlock;
//		}else {
//			currentBlock = currentPage / pagesPerBlock + 1;
//		}
//		
//		int startRow = (currentPage-1)*rowsPerPage+1;
//		int endRow = currentPage * rowsPerPage;
//		
//		SearchVO svo = new SearchVO();
//		svo.setBegin(String.valueOf(startRow));
//		svo.setEnd(String.valueOf(endRow));
//		svo.setSearchType(searchType);
//		svo.setSearchValue(searchValue);
//		
//		//전체 레코드 수
////		int totalRows = classdao.getTotalCount(svo);	
//		int totalRows = adminDAO.stucount(svo);
//		System.out.println("줄 수 :"+totalRows);
//		int totalPages = 0;
//		
//		//전체 페이지를 구하는 공식
//		if(totalRows % rowsPerPage == 0) {
//			totalPages = totalRows / rowsPerPage;
//		}else {
//			totalPages = totalRows / rowsPerPage + 1;
//		}
//		
//		//전체 블록을 구하는 공식
//		int totalBlocks = 0;
//		System.out.println("토탈 페이지수"+totalPages);
//		if(totalPages % pagesPerBlock == 0) {
//			totalBlocks = totalPages / pagesPerBlock;
//		}else {
//			totalBlocks = totalPages / pagesPerBlock + 1;
//		}
//		System.out.println("토탈 블럭의 수: "+totalBlocks);
//		//pageVO에 setter로 값을 주입
//		pageInfo.setCurrentPage(currentPage);
//		pageInfo.setCurrentBlock(currentBlock);
//		pageInfo.setRowsPerPage(rowsPerPage);
//		pageInfo.setPagesPerBlock(pagesPerBlock);
//		pageInfo.setStartRow(startRow);
//		pageInfo.setEndRow(endRow);
//		pageInfo.setTotalBlocks(totalBlocks);
//		pageInfo.setTotalPages(totalPages);
//		pageInfo.setTotalRows(totalRows);
//		
//		// ---------------------------------------
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("adminstuall"); 	// 뷰 이름 결정
//		
//		List<M_studentVO> msvo = adminDAO.selstuall(svo);
//		mav.addObject("msvo",msvo); 	// 담아서 보냄
//		mav.addObject("pageInfo",pageInfo); 			
//		mav.addObject("searchType",searchType);
//		mav.addObject("searchValue",searchValue);
//		
//		System.out.println("페이지 인포: "+pageInfo);
//		return mav;
//	}
}
