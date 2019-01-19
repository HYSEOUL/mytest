package kr.or.kosta.mvc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import dto.ClassVO;

@SuppressWarnings("deprecation")
public class ExcelBuilder extends AbstractExcelView {

	/**
	 * @author jhpar
	 * @exception Exception
	 * @param model
	 * @param workbook
	 * @param request
	 * @param response
	 * 
	 *                 <pre>
	 * 엑셀 파일을 생성해주는 메소드입니다.
	 *                 </pre>
	 */
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<ClassVO> clist = (List<ClassVO>) model.get("classlist");
		System.out.println("buildExcelDocument - 1");
		// HSSF : Microsoft의 엑셀파일을 읽고 쓸수 있도록 지원하는 컴퍼넌트
		// 워크시트를 생성
		HSSFSheet sheet = workbook.createSheet("강의보기"); // sheet의 이름 생성
		sheet.setDefaultColumnWidth(20); // 엑셀의 column(열) 간격 조정
		System.out.println("buildExcelDocument - 2");
		
		// 셀에 사용할 스타일 생성
		CellStyle style = workbook.createCellStyle();
		style.setAlignment(CellStyle.ALIGN_CENTER); // 가운데 정렬
		style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		System.out.println("buildExcelDocument - 3");

		// 셀에 사용할 폰트 생성
		Font font = workbook.createFont();
		font.setFontName("NanumSquare");
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);
		System.out.println("buildExcelDocument - 4");

		// 열(row)을 하나 생성
		HSSFRow header = sheet.createRow(0);
		System.out.println("buildExcelDocument - 5");
		
		/*
		 * String[] str = {"c_num","c_title","c_name","c_date1","c_date2","c_pnum",
		 * "c_loc1","c_loc2","c_img","c_comment","c_category","c_price","c_count",
		 * "c_point"};
		 */

		String[] headerRow = { "번호", "강의명", "강사명", "강의시작일", "강의종료일", "수강인원", "시/도주소", "상세주소", "이미지", "강의소개", "강의분야",
				"강의참가비", "주강의횟수", "마일리지사용" };

		for (int i = 0; i < headerRow.length; i++) {
			header.createCell(i).setCellValue(headerRow[i]); // 출력할 cell을 생성
			header.getCell(i).setCellStyle(style); // 적용한 CellStyle을 setter 메소드로 삽입
		}
		System.out.println("buildExcelDocument - 6");
		
		int rowCount = 1;
		for (ClassVO cvo : clist) {
			HSSFRow hssfRow = sheet.createRow(rowCount++);
			hssfRow.createCell(0).setCellValue(cvo.getC_num());
			hssfRow.createCell(1).setCellValue(cvo.getC_title());
			hssfRow.createCell(2).setCellValue(cvo.getC_name());
			hssfRow.createCell(3).setCellValue(cvo.getC_date1());
			hssfRow.createCell(4).setCellValue(cvo.getC_date2());
			hssfRow.createCell(5).setCellValue(cvo.getC_pnum());
			hssfRow.createCell(6).setCellValue(cvo.getC_loc1());
			hssfRow.createCell(7).setCellValue(cvo.getC_loc2());
			hssfRow.createCell(8).setCellValue(cvo.getC_img());
			hssfRow.createCell(9).setCellValue(cvo.getC_comment());
			hssfRow.createCell(10).setCellValue(cvo.getC_category());
			hssfRow.createCell(11).setCellValue(cvo.getC_price());
			hssfRow.createCell(12).setCellValue(cvo.getC_count());
			hssfRow.createCell(13).setCellValue(cvo.getC_point());
		}
		System.out.println("buildExcelDocument - 7");
		
//		String filename = "classlist_exce.xls";
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "attachment; filename=classlist_exce.xls");
	}
}
