package kr.or.kosta.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.PageVO;
import dto.S1_reviewVO;
import dto.SearchVO;
import dto.StudyVO;
import kr.or.kosta.mvc.dao.S1_reviewDAO;
import kr.or.kosta.mvc.dao.StudyDAOInter;
import kr.or.kosta.mvc.service.StudyServiceInter;

@Controller
public class StudyController {
		
	// Dao�� ����
	@Autowired
	private StudyDAOInter studyDAOInter;
	@Autowired
	private S1_reviewDAO s1dao;
//	@Autowired
//	private Ms_mileageDAO msDao;
//	@Autowired
//	private BuyPointService bps;
	
	@Autowired
	private StudyServiceInter studyserviceinter;
	
	// ���͵� ���� ������ �̵�
	@GetMapping("/create_study")
	public String studyCreate() {
		return "study_Form";
	}

	@PostMapping("/createStudy")
	public ModelAndView create_StudyOpenAop(
			@ModelAttribute("svo") StudyVO svo,
			HttpSession session , 
			HttpServletRequest request) {
		String ms_id = (String) session.getAttribute("ms_id");
		String img_path ="resources\\images";
		System.out.println("img_path"+img_path);
		String r_path = request.getRealPath("/");
		
		MultipartFile mfile = svo.getMf_img();
		System.out.println(mfile);
		
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
		
		/*SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		s_date1= sf.format(new Date());
		s_date2= sf.format(new Date());*/
		
		// �̹����� �̸��� ���� Database�� �����ϱ� ���ؼ�
		svo.setS_img(oriFn);
		System.out.println(ms_id);
		svo.setMs_id(ms_id);/*
		svo.setS_date1(s_date1);
		svo.setS_date2(s_date2);*/
		
		studyDAOInter.createStudy(svo);
		
		try {
			mfile.transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
			
		System.out.println(ms_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("svo", svo);
		mav.setViewName("redirect:/selectListStudy?page=1");
		return mav;//"redirect:create_study";
	}
	
	// ���͵� ��ü ��� �Ѹ��� + ����¡ ó��
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
		int totalRows = studyDAOInter.getTotalCount(svo);
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
		
		List<StudyVO> list = studyDAOInter.readListStudy(svo);
		
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
		int totalRows = studyDAOInter.getTotalCount(svo);
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
		
		List<StudyVO> list = studyDAOInter.readStudySearch(svo);
		
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
		List<StudyVO> svo = studyDAOInter.readoneStudyS1(s_num);
		mav.setViewName("study_listOne");
		mav.addObject("svo", svo);
		return mav;
	}
	
	
	//����������
	@RequestMapping(value="/updateStudyForm")
	public String updateStudyForm(Model m, 
			@RequestParam int s_num) {
		System.out.println("s_num : " + s_num);
		StudyVO svo = studyDAOInter.readOneStudy(s_num);
		m.addAttribute("svo",svo);
		return "study_update_Form";
	}
	
	
	
	//���͵� �����ϱ�
	@PostMapping("/update_Study")
	public String updateStudy(
			@ModelAttribute("svo") StudyVO svo,
			@RequestParam int s_num,
			@RequestParam String s_title, @RequestParam String s_category, @RequestParam String s_loc1,
			@RequestParam String s_loc2, @RequestParam String s_date1, @RequestParam String s_date2,
			@RequestParam int s_count, @RequestParam int s_pnum, @RequestParam String s_comment,
			@RequestParam int s_price,
			HttpSession session , 
			HttpServletRequest request,
			Model m) {
		System.out.println("���͵� ���� ��Ʈ�� �Լ�");
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
		/*
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		s_date1 = date.format(new Date());
		s_date2 = date.format(new Date());
		*/
		svo.setS_num(s_num);
		svo.setS_title(s_title);
		svo.setS_category(s_category);
		svo.setS_loc1(s_loc1);
		svo.setS_loc2(s_loc2);
		svo.setS_date1(s_date1);
		svo.setS_date2(s_date2);
		svo.setS_count(s_count);
		svo.setS_pnum(s_pnum);
		svo.setS_comment(s_comment);
		svo.setS_price(s_price);
		
		studyDAOInter.updateStudy(svo);
		/*try {
			mfile.transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		svo = studyDAOInter.readOneStudy(s_num);*/
		m.addAttribute("svo", svo);
		System.out.println("���͵� �����Ϸ�");
		return "redirect:/"; //����������
	}
	
	
	//�����ϱ�
	@RequestMapping(value="/deleteStudy", method=RequestMethod.GET)
	public ModelAndView deleteStudy(
			int num, HttpServletRequest req, 
			HttpServletResponse resp,
			int page, String searchType, String searchValue) {
		studyDAOInter.deleteStudy(num);
		
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 5; // �� �������� ������ ��� �� 
		int pagesPerBlock = 5; // �� ��ϴ� ������ ������ ��
	
		int currentPage = page;
		int currentBlock = 0;
		if(currentPage % pagesPerBlock == 0) {
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
		
		// ��ü ���ڵ� ��
		int totalRows = studyDAOInter.getTotalCount(svo);
		System.out.println("totalRows: "+totalRows);
		
		int totalPages = 0;
		// ��ü �������� ���ϴ� ����
		if(totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		// ��ü ����� ���ϴ� ����
		int totalBlocks = 0;
		if(totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// PageVo�� setter�� ���� ����
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
		mav.setViewName("study_list");
//		mav.setViewName("index");
		// Map�� Dao�� ����
		//List<ClassVO> list = classdao.readClass2(svo);
		
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		//mav.addObject("list",list); 	// ���⿡ ��Ƽ� ����
		return mav;
	}
	
		// �����Ǿ��� (����ȣ)
		// ��� �ۼ�
	@RequestMapping(value="creates1_review")
	public String creates1_review(HttpServletRequest req,HttpSession session,
			int s_num) {
		System.out.println("����Է� ��Ʈ�� �Լ�");
		
		// �� ���̵� ��������(���ǿ���)
		String s1_id = (String) session.getAttribute("ms_id");
		System.out.println("���̵�====>"+s1_id);
		// s_num �޾ƿ���
		int num = Integer.parseInt(req.getParameter("s_num"));
		System.out.println("���͵� ��ȣ====>"+s_num);
		// ��� �ؽ�Ʈ �޾ƿ���
		String s1_text = req.getParameter("s1_text");
		// ������ ���̵� �޾ƿ���
		String ms_id = req.getParameter("ms_id");
		S1_reviewVO s1vo = new S1_reviewVO();
		s1vo.setS_num(num);
		s1vo.setS1_id(s1_id);
		s1vo.setS1_text(s1_text);
		s1vo.setMs_id(ms_id);
		
		System.out.println("������ �߳�??????  "+s1vo.getS1_text());
		s1dao.s1_reviewInsert(s1vo);
		
		StudyVO svo = studyDAOInter.readOneStudy(s_num);
		List<S1_reviewVO> s1list = s1dao.readS1_Review(s_num);
		req.setAttribute("svo", svo);
		req.setAttribute("s1list", s1list);
		return "redirect:/selectOneStudy?s_num="+s_num+"&num="+num;
		//return "redirect:/selectOneStudy";
	}
		// �����Ǿ��� (����ȣ)
		// �����Ǿ��� (����ȣ)
		
		@RequestMapping(value="delstudyands1",method=RequestMethod.GET)
		public ModelAndView delstudyands1(int num, 
				int page, String searchType, String searchValue )
						throws Exception {
			studyserviceinter.deleteStudy(num); 	// ���� Ʈ����� ó��
			
			dto.PageVO pageInfo = new dto.PageVO();
			int rowsPerPage = 5; // �� �������� ������ ��� �� 
			int pagesPerBlock = 5; // �� ��ϴ� ������ ������ ��
		
			int currentPage = page;
			int currentBlock = 0;
			if(currentPage % pagesPerBlock == 0) {
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
			// ��ü ���ڵ� ��
			int totalRows = studyDAOInter.getTotalCount(svo);
			System.out.println("totalRows: "+totalRows);
			int totalPages = 0;
			// ��ü �������� ���ϴ� ����
			if(totalRows % rowsPerPage == 0) {
				totalPages = totalRows / rowsPerPage;
			} else {
				totalPages = totalRows / rowsPerPage + 1;
			}
			// ��ü ����� ���ϴ� ����
			int totalBlocks = 0;
			if(totalPages % pagesPerBlock == 0) {
				totalBlocks = totalPages / pagesPerBlock;
			} else {
				totalBlocks = totalPages / pagesPerBlock + 1;
			}
			// PageVo�� setter�� ���� ����
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
			mav.setViewName("study_list");
//			mav.setViewName("index");
			// Map�� Dao�� ����
			//List<ClassVO> list = classdao.readClass2(svo);
			
			mav.addObject("pageInfo",pageInfo);
			mav.addObject("searchType",searchType);
			mav.addObject("searchValue",searchValue);
			//mav.addObject("list",list); 	// ���⿡ ��Ƽ� ����
			return mav;
		}
		
		// ���͵� ��ۼ���
		@RequestMapping(value="updates1_review", method=RequestMethod.POST)
		public String updates1_review(int s1_num,int s_num,HttpServletRequest req, HttpServletResponse resp)
						throws UnsupportedEncodingException {
			resp.setContentType("text/html;charset=euc-kr");
			req.setCharacterEncoding("euc-kr");
			
			System.out.println("��ۼ��� ��Ʈ�ѷ� �Լ�");
			int snum = Integer.parseInt(req.getParameter("s_num"));
			int s1_numm = Integer.parseInt(req.getParameter("s1_num"));
			String s1_text = req.getParameter("s1_text");
			
			S1_reviewVO s1vo = new S1_reviewVO();
			s1vo.setS1_num(s1_numm);
			s1vo.setS1_text(s1_text);
			
			s1dao.updateview(s1vo);
			
//			StudyVO svo = studyDAOInter.readOneStudy(s_num);
//			List<S1_reviewVO> s1list = s1dao.readS1_Review(s_num);
//			req.setAttribute("svo", svo);
//			req.setAttribute("s1list", s1list);
			
			return "redirect:selectOneStudy?s_num="+snum;
		}
		
		// �����Ǿ��� (����ȣ)
		// �׻ͻ�
		@RequestMapping(value="deletes1_review")
		public String deletes1_review(@RequestParam int s_num, @RequestParam int s1_num,
				HttpServletRequest req, HttpServletResponse resp) {
			System.out.println("s1_num : " + s1_num);
			System.out.println("s_num : " + s_num);
			s1dao.s1_reviewDelete(s1_num);
			
//			StudyVO svo = studyDAOInter.readOneStudy(s_num);
//			List<S1_reviewVO> s1list = s1dao.readS1_Review(s_num);
//			req.setAttribute("svo", svo);
//			req.setAttribute("s1list", s1list);
			return "redirect:selectOneStudy?s_num="+s_num;
		}
		// �����Ǿ��� (����ȣ)
			
}
	
