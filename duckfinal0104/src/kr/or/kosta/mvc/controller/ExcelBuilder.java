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
public class ExcelBuilder extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, 
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<ClassVO> clist = (List<ClassVO>) model.get("classlist");
		
		HSSFSheet sheet = workbook.createSheet("강좌 보기"); 	// 엑셀 시트이름 지정
		sheet.setDefaultColumnWidth(30); 	// 시트 가로 길이 지정
		CellStyle style = workbook.createCellStyle(); 	// 셀 스타일 변수 지정
		Font font = workbook.createFont(); 	// 폰트 변수 지정 
		font.setFontName("Arial"); 	// 폰트 이름 지정
		style.setFillForegroundColor(HSSFColor.BLUE.index); 	// 인덱스 색 지정
		style.setFillPattern(CellStyle.SOLID_FOREGROUND); 	// 셀 안에 채울 패턴 지정
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 	// 글자 굵기 지정
		font.setColor(HSSFColor.WHITE.index); 	// 인덱스 글자 색깔 지정
		style.setFont(font); 	// 폰트에 저장한 값 스타일에 적용
		HSSFRow header = sheet.createRow(0); 	// 헤더를 0번째 줄에 만들기로 지정
	
		// 엑셀의 셀 타이틀
		String[] str = {"c_num","c_title","c_name","c_date1","c_date2","c_pnum","c_loc1","c_loc2","c_img","c_comment","c_category","c_price","c_count","c_point"};
		
		for(int i=0; i< str.length;i++) {
			header.createCell(i).setCellValue(str[i]); 	// 배열의 값으로 인덱스를 생성하고
			header.getCell(i).setCellStyle(style); 	// 각각의 셀에 스타일을 입힌다.
		}
		int rowCount = 1;		
		for(ClassVO cvo : clist) {
			HSSFRow aRow = sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(cvo.getC_num());
			aRow.createCell(1).setCellValue(cvo.getC_title());
			aRow.createCell(2).setCellValue(cvo.getC_name());
			aRow.createCell(3).setCellValue(cvo.getC_date1());
			aRow.createCell(4).setCellValue(cvo.getC_date2());
			aRow.createCell(5).setCellValue(cvo.getC_pnum());
			aRow.createCell(6).setCellValue(cvo.getC_loc1());
			aRow.createCell(7).setCellValue(cvo.getC_loc2());
			aRow.createCell(8).setCellValue(cvo.getC_img());
			aRow.createCell(9).setCellValue(cvo.getC_comment());
			aRow.createCell(10).setCellValue(cvo.getC_category());
			aRow.createCell(11).setCellValue(cvo.getC_price());
			aRow.createCell(12).setCellValue(cvo.getC_count());
			aRow.createCell(13).setCellValue(cvo.getC_point());
		}
		
//		String filename = "classlist_exce.xls";
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", 	// 2018/12/20 fix 파일 이름이 고정이 안되고
				"attachment; filename=classlist_exce.xls"); 	// 컨트롤러가 받는 메서드 이름이 됨 무조건;
	}	
}