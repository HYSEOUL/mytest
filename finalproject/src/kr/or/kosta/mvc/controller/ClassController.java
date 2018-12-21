package kr.or.kosta.mvc.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// DAO ����
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
	
// ���� ����(Create)�κ�	------------------------------------------------------------------
	
	// ���� ������ �̵� -> class_form.jsp
	@RequestMapping(value="createclass")
	public String movecreateclass() {
		return "class_Form";
	}
	
	// ���� ���� -> class_list.jsp�� �̵�
	@RequestMapping(value="classcreate",method=RequestMethod.POST)
	public String createclassOpenAop(ClassVO vo, HttpSession session) {	
		System.out.println(session.getAttribute("mt_id")+" : �α��� �� ���̵�");
		classdao.createClass(vo); 	// ���ν��� ��� 
		return "redirect:/showclasslist?page=1";		
	}

// ���� �б�(Read)�κ� ----------------------------------------------------------------------
	
	// ���� ��ü ��� �Ѹ��� + ����¡ ó�� -> class_list.jsp?page=1�� �̵� 
	@RequestMapping(value="/showclasslist",method=RequestMethod.GET)
	public ModelAndView list(int page, String searchType, String searchValue) {
		PageVO pageInfo = new PageVO();
		
		int rowsPerPage = 9; //�� �������� ������ ����Ʈ ����
		int pagesPerBlock = 5; 	// ������ �ϴ� ��Ÿ�� �ε��� ����
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
		
		int totalRows = classdao.getTotalCount(svo);		
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
		mav.setViewName("class_list");
		
		List<ClassVO> list = classdao.readClass2(svo);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType",searchType);
		mav.addObject("searchValue",searchValue);
		mav.addObject("list",list);
				
		return mav;
	}
	
	// ���� �� ���� �Ѹ��� -> class_listOne2.jsp?num=c_num ���� �̵�
	@RequestMapping(value="selectoneclassc1", method=RequestMethod.GET)
	public ModelAndView selectoneclass(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		List<ClassVO> cvo = classdao.readoneClassC1(num);
		mav.setViewName("class_listOne2");
		mav.addObject("cvo", cvo);
		mav.addObject("num",num); 	// 18/12/18�߰� ����
		return mav;
	}

	
// ���� �����ϱ�(Update) �κ� ----------------------------------------------------------------------	
	
	// ���� ���� ������ �̵� -> class_update_Form?num=�� ��ĥ �� ������ ��Ƽ� �̵�
	@RequestMapping(value="updateview",method=RequestMethod.GET)
	public String updateview(int num,HttpServletRequest req, HttpServletResponse resp) {
		ClassVO cvo = classdao.readoneClass(num);
		req.setAttribute("cvo", cvo);
		return "class_update_Form"; //������ �̵� Ȱ���ϱ�
	}
	
	// ���� ���� �� ������ �޼��� -> class_listOne2.jsp?num=�۹�ȣ�� �̵�
	@RequestMapping(value="updateclass")
	public String updateoneclass(HttpServletRequest req, HttpServletResponse resp,ClassVO vo) {
		int num = Integer.parseInt(req.getParameter("c_num")); 	// ����¡ ó�� ������ �޴� ����
		System.out.println("����: "+num);		
		classdao.updateClass2(vo);
		ClassVO cvo = classdao.readoneClass(num);
		req.setAttribute("cvo", cvo);
		return "redirect:/selectoneclassc1?num="+num;
	}

// ���� �����ϱ�(Delete) �κ� ----------------------------------------------------------------------	
	
	// ���� �����ϱ� �κ� + Ʈ�����ó�� -> class_list.jsp?page=1�� �̵�
	@RequestMapping(value="delclassandc1")
	public String delclassandc1(int num) throws Exception {		
		classserviceinter.deleteClass(num); 	// ���� Ʈ����� ó��
		return "redirect:/showclasslist?page=1";
	}
	
// 	���� ��� �κ� ---------------------------------------------------------------------------------
	
	// ���� ��� ����(create) �κ� -> �ٽ� ���ۿ��� 2018/1221
	@RequestMapping(value="createc1_review")
	public String createc1_review(HttpServletRequest req, HttpServletResponse resp,C1_reviewVO c1vo) {
		resp.setContentType("text/html;charset=euc-kr");
		int c_num = Integer.parseInt(req.getParameter("c_num"));
		c1vo.setC1_num(c_num);	
		c1dao.createreview(c1vo);
		ClassVO cvo = classdao.readoneClass(c_num);
		List<C1_reviewVO> c1list = c1dao.readC1_Review(c_num);
		req.setAttribute("cvo", cvo);
		req.setAttribute("c1list", c1list);
		return "class_listOne";
	}
	
	
	// ���� ��� ����(update) �κ� -> �ٽ� ���ۿ��� 2018/1221
	@RequestMapping(value="updatec1_review")
	public String updatec1_review(int c1_num,int c_num, String c1_reply, int c1_stars,
			HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		resp.setContentType("text/html;charset=euc-kr");
		req.setCharacterEncoding("euc-kr");
		C1_reviewVO c1vo = new C1_reviewVO();
		c1vo.setC1_num(c1_num);
		c1vo.setC_num(c_num);
		c1vo.setC1_reply(c1_reply);
		c1vo.setC1_stars(c1_stars);
		c1dao.updateview(c1vo);
		ClassVO cvo = classdao.readoneClass(c_num);
		List<C1_reviewVO> c1list = c1dao.readC1_Review(c_num);
		req.setAttribute("cvo", cvo);
		req.setAttribute("c1list", c1list);
		return "class_listOne";
	}

	// ���� ��� ����(delete) �κ� -> �ٽ� ���ۿ��� 2018/1221
	@RequestMapping(value="deletec1_review")
	public String deletec1_review(int c1_num,int c_num,HttpServletRequest req, HttpServletResponse resp) {
		c1dao.deletereview(c1_num);
		ClassVO cvo = classdao.readoneClass(c_num);
		List<C1_reviewVO> c1list = c1dao.readC1_Review(c_num);
		req.setAttribute("cvo", cvo);
		req.setAttribute("c1list", c1list);
		return "class_listOne";
	}

// ���� �˻�(Search) �κ� -------------------------------------------------------------------
	// �����, ���񽺺о�, ������ ���� �б��Ͽ� �˻� ����� ���
	@RequestMapping(value = "/selectSearchClass")
	public ModelAndView selectSearch(@RequestParam int page, @RequestParam String searchType,
			@RequestParam String searchValue) {
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
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);

		// ��ü ���ڵ� ��
		int totalRows = classdao.getTotalCount(svo);
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
		mav.setViewName("class_list");

		List<ClassVO> list = classdao.readClassSearch(svo);

		// �������� ����Ʈ ���� ModelAndView�� ����ؼ� �� ����
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		mav.addObject("list", list);
		// list�� zcount �� �� 0/1�� ��Ƽ� �ٸ� ����� ���� �ѱ��

		return mav;
	}	
		
	/*���� �κ�*/
	
	   // ������������ ����ư Ŭ���� class List insert
	   @RequestMapping(value="insertClassList")
	   public String insertClassList(HttpServletRequest req,HttpSession session,int buynum,String title) {
	      System.out.println("*********������������ ���Ź�ư Ŭ��*********");
		  String ms_id = (String) session.getAttribute("ms_id");
	      System.out.println("�л� ���̵� ����?  "+ ms_id);
	      int sc_buy = Integer.parseInt(req.getParameter("buynum"));
	      System.out.println("���� �б� ��ȣ => " + sc_buy);
	      String c_title = (String) req.getParameter("title");
	      System.out.println("������ ���� �̸� ? "+ c_title);
	      
	      Sc_listVO scvo = new Sc_listVO();
	      scvo.setC_title(c_title);
	      scvo.setMs_id(ms_id);
	      scvo.setSc_buy(sc_buy);
	      classdao.insertClassList(scvo);
	      return "redirect:/";
	   }
	   /*
	   // ��ٱ��Ͽ��� ���Ź�ư Ŭ���� class List insert
	   @RequestMapping(value="insertClassList")
	   public String insertClassList(HttpServletRequest req,HttpSession session,int buynum,String title) {
	      String ms_id = (String) session.getAttribute("ms_id");
	      System.out.println("�л� ���̵� ����?  "+ ms_id);
	      int sc_buy = Integer.parseInt(req.getParameter("buynum"));
	      System.out.println("���� �б� ��ȣ => " + sc_buy);
	      String c_title = (String) req.getParameter("title");
	      System.out.println("������ ���� �̸� ? "+ c_title);
	      Sc_listVO scvo = new Sc_listVO();
	      scvo.setC_title(c_title);
	      scvo.setMs_id(ms_id);
	      scvo.setSc_buy(sc_buy);
	      classdao.insertClassList(scvo);
	      return "redirect:/";
	   }
	   */

	//������������ �ٷ� ���� ���� class List insert
	@RequestMapping(value="insertClassonebuy")
	public String insertClassOneBuy(HttpServletRequest req,HttpSession session,int buynum,String title,int price) {
		System.out.println("�󼼿��� �ٷ� �����ϴ� ��Ʈ�� ��");
		// �������� id�� �ޱ�
		String ms_id = (String) session.getAttribute("ms_id");
		// ������Ʈ �˾ƿ���
		S_mileageVO getsmvo = msDao.selectOneS_mileage(ms_id);
		int my_point = getsmvo.getSm_point(); 
		
		// �����Ϸ��� ���� ����,�̸�,list�� �б���� �˾ƿ���
		int c_price = Integer.parseInt(req.getParameter("price"));
		System.out.println("���ܰܰܰܰܰܰ�"+c_price);
		String c_title = (String) req.getParameter("title");
		int sc_buy = Integer.parseInt(req.getParameter("buynum"));
		
		bps.classOnebuyPoint(ms_id, my_point, sc_buy, c_title, c_price);
		System.out.println("��Ʈ�� ����");
		return "redirect:/";
	}
	
		
	//class List update
	@RequestMapping(value="updateClass_list")
	public String updateClass_List(HttpSession session,HttpServletRequest req, int num,int buynum,int price) throws Exception {
		// �������� id�� �ޱ�
		String ms_id = (String) session.getAttribute("ms_id");
		System.out.println(ms_id+"ID");
		// ������Ʈ �˾ƿ���
		S_mileageVO getsmvo = msDao.selectOneS_mileage(ms_id);
		System.out.println(getsmvo.getSm_point()+"Point");
		int my_point = getsmvo.getSm_point(); 
		
		// �����Ϸ��� ���� ����,list�� ��ȣ,�б���� �˾ƿ���
		int c_price = Integer.parseInt(req.getParameter("price")); 
		int sc_num = Integer.parseInt(req.getParameter("num")); 
		int sc_buy = Integer.parseInt(req.getParameter("buynum")); 
		
		bps.classBuyPoint(sc_num,sc_buy,c_price,my_point,ms_id);
		return "redirect:/";
	}
	
	//class List delete
	@RequestMapping(value="deleteClass_list")
	public String deleteClass_List(HttpServletRequest req,int num) {
		System.out.println("����Ʈ���� ������������");
		int sc_num = Integer.parseInt(req.getParameter("num"));
		classdao.deleteclass_list(sc_num);
		return "redirect:/";
	}
	
	/*�����κЅ�*/	
}