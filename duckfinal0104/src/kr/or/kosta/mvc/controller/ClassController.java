package kr.or.kosta.mvc.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.C1_reviewVO;
import dto.ClassVO;
import dto.PageVO;
import dto.S_mileageVO;
import dto.Sc_listVO;
import dto.SearchVO;
import kr.or.kosta.mvc.dao.C1_ReviewDao;
import kr.or.kosta.mvc.dao.ClassDao;
import kr.or.kosta.mvc.dao.Ms_mileageDAO;
import kr.or.kosta.mvc.service.BuyPointService;
import kr.or.kosta.mvc.service.ClassServiceInter;


@Controller
public class ClassController {
	
	// DAO 주입
	@Autowired
	private ClassDao classdao;
	@Autowired
	private C1_ReviewDao c1dao;
	@Autowired
	private Ms_mileageDAO msDao;
	@Autowired
	private BuyPointService bps;
	
	@Autowired
	private ClassServiceInter classserviceinter;
	
	@RequestMapping(value="createclass")
	public String movecreateclass() {
		return "class_Form";
	}
	
	@RequestMapping(value="classcreate",method=RequestMethod.POST)
	public ModelAndView createclassOpenAop(
			ClassVO cvo,
			HttpSession session , 
			HttpServletRequest request) {
		/*String mt_id = (String) session.getAttribute("mt_id");*/
		String img_path ="resources\\images";
		System.out.println("img_path : " + img_path);
		String r_path = request.getRealPath("/");
		
		//cvo.setMf_img(mf_img);
		MultipartFile mfile = cvo.getMf_img();
		
		System.out.println(mfile);
		
		String oriFn = mfile.getOriginalFilename();
		long size = mfile.getSize();
		String contentType = mfile.getContentType();
		
		System.out.println(r_path);
		System.out.println("파일명 : " + oriFn);
		System.out.println("파일크기 : " + size);
		System.out.println("Type : " + contentType);
		
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\")
		.append(oriFn);
		System.out.println("path : " + path);
		
		File f = new File(path.toString());
		System.out.println(f.exists());
		
		cvo.setC_img(oriFn);
		
		classdao.createClass(cvo); 	// 프로시저 사용
		
		try {
			mfile.transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cvo", cvo);
		mav.setViewName("showclasslist?page=1");
		
		return mav;	
	}
	// 강의 읽기(Read)부분 ----------------------------------------------------------------------
	
		// 강의 전체 목록 뿌리기 + 페이징 처리 -> class_list.jsp?page=1로 이동
	@RequestMapping(value="/showclasslist", method=RequestMethod.GET)
	public ModelAndView list(
			int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 9; //한 페이지에 나오는 리스트 갯수
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
		int totalRows = classdao.getTotalCount(svo);
		System.out.println("totalRows : "+totalRows);
		
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
		
		/*ClassVO cvo = new ClassVO();*/
		/*SearchVO svo = new SearchVO();
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);*/
		
		// ---------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("class_list");

		// Map을 Dao에 주입
		List<ClassVO> list = classdao.readClass2(svo);
		
		//페이지와 리스트 값을 ModelAndView를 사용해서 값 전달
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		mav.addObject("list",list);
				
		return mav;
	}
	
	// 강사명, 서비스분야, 지역에 따라 분기하여 검색 결과를 출력
	@RequestMapping(value = "/selectSearchClass")
	public ModelAndView selectSearch(
			@RequestParam int page, @RequestParam String searchType,
			@RequestParam String searchValue) {
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
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);

		// 전체 레코드 수
		int totalRows = classdao.getTotalCount(svo);
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
		mav.setViewName("class_list");

		List<ClassVO> list = classdao.readClassSearch(svo);

		// 페이지와 리스트 값을 ModelAndView를 사용해서 값 전달
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		mav.addObject("list", list);
		// list에 zcount 의 값 0/1을 담아서 다른 값들과 같이 넘기기

		return mav;
	}
	
	@RequestMapping(value="selectoneclassc1", method=RequestMethod.GET)
	public ModelAndView selectoneclass(
			@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		List<ClassVO> cvo = classdao.readoneClassC1(num);
		mav.setViewName("class_listOne2");
		mav.addObject("cvo", cvo);
		return mav;
	}
	
	@RequestMapping(value="updateview",method=RequestMethod.GET)
	public String updateview(int num,HttpServletRequest req, HttpServletResponse resp) {
		ClassVO cvo = classdao.readoneClass(num);
		
		req.setAttribute("cvo", cvo);
		return "class_update_Form"; //페이지 이동 활용하기
	}
	
	// 강좌수정
	@RequestMapping(value="updateclass")
	public String updateoneclass(ClassVO vo) {
		int num = vo.getC_num();
		
		classdao.updateClass2(vo);
		/* 
		ClassVO cvo = classdao.readoneClass(c_num);
		req.setAttribute("cvo", cvo);
		*/
		return "redirect:/selectoneclassc1?num="+num;
	}
	
	@RequestMapping(value="deleteclass",method=RequestMethod.GET)
	public ModelAndView deleteclass(
			int num,HttpServletRequest req, HttpServletResponse resp,
			int page, String searchType, String searchValue) {
		classdao.deleteClass(num);
		dto.PageVO pageInfo = new dto.PageVO();
		int rowsPerPage = 5; // 한 페이지당 보여줄 목록 수 
		int pagesPerBlock = 5; // 한 블록당 보여줄 페이지 수
	
		int currentPage = page;
		int currentBlock = 0;
		if(currentPage % pagesPerBlock == 0) {
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;
		dto.SearchVO svo = new dto.SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);
		// 전체 레코드 수
		int totalRows = classdao.getTotalCount(svo);
		System.out.println("totalRows: "+totalRows);
		int totalPages = 0;
		// 전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		// 전체 블록을 구하는 공식
		int totalBlocks = 0;
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// PageVo에 setter로 값을 주입
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
		
		// ---------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("class_list");
//		mav.setViewName("index");
		// Map을 Dao에 주입
		//List<ClassVO> list = classdao.readClass2(svo);
		
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		//mav.addObject("list",list); 	// 여기에 담아서 보냄
		return mav;
	}
	
	// 수정되었음 (박준호)
	// 수정되었음 (박준호)
	@RequestMapping(value="createc1_review")
	public String createc1_review(HttpServletRequest req, 
			HttpServletResponse resp, 
			C1_reviewVO c1vo) {
		resp.setContentType("text/html;charset=euc-kr");
		//SimpleDateFormat sf = new SimpleDateFormat("yy-MM-dd");
		//String c1_date = sf.format(new Date());
		
		int c_num = Integer.parseInt(req.getParameter("c_num"));
		int num = Integer.parseInt(req.getParameter("num"));
		int c1_stars = Integer.parseInt(req.getParameter("c1_stars"));
		c1vo.setC1_num(c_num);	
		c1vo.setC1_stars(c1_stars);
		//c1vo.setC1_date(c1_date);
		c1dao.createreview(c1vo);
		
		ClassVO cvo = classdao.readoneClass(c_num);
		List<C1_reviewVO> c1list = c1dao.readC1_Review(c_num);
		req.setAttribute("cvo", cvo);
		req.setAttribute("c1list", c1list);
		return "redirect:/selectoneclassc1?c_num="+c_num+"&num="+num;
	}
	// 수정되었음 (박준호)
	// 수정되었음 (박준호)
	
	
	@RequestMapping(value="delclassandc1",method=RequestMethod.GET)
	public ModelAndView delclassandc1(int num,int page,
			String searchType, String searchValue )
					throws Exception {
		classserviceinter.deleteClass(num); 	// 삭제 트랜잭션 처리
		
		dto.PageVO pageInfo = new dto.PageVO();
		int rowsPerPage = 5; // 한 페이지당 보여줄 목록 수 
		int pagesPerBlock = 5; // 한 블록당 보여줄 페이지 수
	
		int currentPage = page;
		int currentBlock = 0;
		if(currentPage % pagesPerBlock == 0) {
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;
		dto.SearchVO svo = new dto.SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);
		// 전체 레코드 수
		int totalRows = classdao.getTotalCount(svo);
		System.out.println("totalRows: "+totalRows);
		int totalPages = 0;
		// 전체 페이지를 구하는 공식
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		// 전체 블록을 구하는 공식
		int totalBlocks = 0;
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// PageVo에 setter로 값을 주입
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
		
		// ---------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("class_list");
//		mav.setViewName("index");
		// Map을 Dao에 주입
		//List<ClassVO> list = classdao.readClass2(svo);
		
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		//mav.addObject("list",list); 	// 여기에 담아서 보냄
		return mav;
	}
	
	@RequestMapping(value="updatec1_review", method=RequestMethod.POST)
	public String updatec1_review(
			int c1_num,int c_num, String c1_reply, 
			int c1_stars, int class_num,
			HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		resp.setContentType("text/html;charset=euc-kr");
		req.setCharacterEncoding("euc-kr");
		System.out.println("class_num : " + class_num);
		System.out.println("c1_num : " + c1_num);
		System.out.println("c_num : " + c_num);
		System.out.println("c1_reply : "+c1_reply);
		System.out.println("c1_stars : " + c1_stars);
		
		C1_reviewVO c1vo = new C1_reviewVO();
		SimpleDateFormat sf = new SimpleDateFormat();
		String c1_date = sf.format(new Date());
		
		System.out.println("c1_date : " + c1_date);
		c1vo.setC1_num(c1_num);
		c1vo.setC_num(c_num);
		c1vo.setC1_date(c1_date);
		c1vo.setC1_reply(c1_reply);
		c1vo.setC1_stars(c1_stars);
		
		c1dao.updateview(c1vo);
		
		ClassVO cvo = classdao.readoneClass(c_num);
		List<C1_reviewVO> c1list = c1dao.readC1_Review(c_num);
		req.setAttribute("cvo", cvo);
		req.setAttribute("c1list", c1list);
		
		return "redirect:selectoneclassc1?num="+class_num;
	}
	
	
	// 수정되었음 (박준호)
	// 수정되었음 (박준호)
	// 수정되었음 (박준호)
	@RequestMapping(value="deletec1_review")
	public String deletec1_review(
			@RequestParam int c_num, 
			@RequestParam int c1_num,
			HttpServletRequest req, HttpServletResponse resp) {
		//int c_num = Integer.parseInt(req.getParameter("c_num"));
		//int c1_num = Integer.parseInt(req.getParameter("c1_num"));
		System.out.println("c1_num : " + c1_num);
		System.out.println("c_num : " + c_num);
		c1dao.deletereview(c1_num);
		ClassVO cvo = classdao.readoneClass(c_num);
		List<C1_reviewVO> c1list = c1dao.readC1_Review(c_num);
		req.setAttribute("cvo", cvo);
		req.setAttribute("c1list", c1list);
		return "redirect:selectoneclassc1?num="+c_num;
	}
	// 수정되었음 (박준호)
	// 수정되었음 (박준호)
	// 수정되었음 (박준호)
	

	   // 상세페이지에서 담기버튼 클릭시 class List insert
	   @RequestMapping(value="insertClassList")
	   public String insertClassList(HttpServletRequest req,HttpSession session,int buynum,String title) {
	      String ms_id = (String) session.getAttribute("ms_id");
	      System.out.println("학생 아이디가 뭔가?  "+ ms_id);
	      int sc_buy = Integer.parseInt(req.getParameter("buynum"));
	      System.out.println("구매 분기 번호 => " + sc_buy);
	      String c_title = (String) req.getParameter("title");
	      System.out.println("선택한 강좌 이름 ? "+ c_title);
	      Sc_listVO scvo = new Sc_listVO();
	      scvo.setC_title(c_title);
	      scvo.setMs_id(ms_id);
	      scvo.setSc_buy(sc_buy);
	      classdao.insertClassList(scvo);
	      return "redirect:/shopbag";
	   }
	   

	//상세페이지에서 바로 강좌 구매 class List insert
	@RequestMapping(value="insertClassonebuy")
	public String insertClassOneBuy(HttpServletRequest req,HttpSession session,int buynum,String title,int price) {
		System.out.println("컨트롤 옴");
		// 세션으로 id값 받기
		String ms_id = (String) session.getAttribute("ms_id");
		// 내포인트 알아오기
		S_mileageVO getsmvo = msDao.selectOneS_mileage(ms_id);
		int my_point = getsmvo.getSm_point(); 
		
		// 구매하려는 강좌 가격,이름,list의 분기버노 알아오기
		int c_price = Integer.parseInt(req.getParameter("price"));
		String c_title = (String) req.getParameter("title");
		int sc_buy = Integer.parseInt(req.getParameter("buynum"));
		
		System.out.println("컨트롤러 ==>>> "+c_price);
		System.out.println("컨트롤러 ==>>> "+c_title);
		System.out.println("컨트롤러 ==>>> "+sc_buy);
		
		bps.classOnebuyPoint(ms_id, my_point, sc_buy, c_title, c_price);
		
		System.out.println("컨트롤 끄읏");
		return "redirect:/mypage_class_study_list" ;
	}
	
	
	
	// 장바구니에서 강좌 구매시 class List update
	@RequestMapping(value="updateClass_list")
	public String updateClass_List(HttpSession session,HttpServletRequest req, int num,int buynum,int price) throws Exception {
		// 세션으로 id값 받기
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println(ms_id+"ID");
		// 내포인트 알아오기
		S_mileageVO getsmvo = msDao.selectOneS_mileage(ms_id);
		System.out.println(getsmvo.getSm_point()+"Point");
		int my_point = getsmvo.getSm_point(); 
		
		// 구매하려는 강좌 가격,list의 번호,분기버노 알아오기
		int c_price = Integer.parseInt(req.getParameter("price")); 
		int sc_num = Integer.parseInt(req.getParameter("num")); 
		int sc_buy = Integer.parseInt(req.getParameter("buynum")); 
		
		bps.classBuyPoint(sc_num,sc_buy,c_price,my_point,ms_id);
		return "redirect:/mypage_class_study_list";
	}
	
	// 장바구니에서 강좌 삭제 시 class List delete
	@RequestMapping(value="deleteClass_list")
	public String deleteClass_List(HttpServletRequest req,int num) {
		System.out.println("리스트에서 삭제제제젲제");
		int sc_num = Integer.parseInt(req.getParameter("num"));
		classdao.deleteclass_list(sc_num);
		return "redirect:/shopbag";
	}
	
}


//@RequestMapping(value="selectoneclassc1",method=RequestMethod.GET)
//public String selectoneclassc1(int num,HttpServletRequest req, HttpServletResponse resp) {
//	List<ClassVO> cvo = classdao.readoneClassC1(num);
////	ClassVO cvo = classdao.readoneClass(num);
////	System.out.println("값 길이 확인: "+ cvo);
////	try {
////		Object obj = cvo;
////		for(Field field: obj.getClass().getDeclaredFields()) {
////			field.setAccessible(true);
////			Object value = field.get(obj);
////			System.out.println("컬럼 명: "+field.getName());
////			System.out.println("컬럼 값: "+value);
////		}
////	} catch (Exception e) {
////		e.printStackTrace();
////	}		
//	req.setAttribute("cvo", cvo);
//	return "class_listOnetest";
//} 2018/12/14 함정윤