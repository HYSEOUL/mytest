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
		
		HSSFSheet sheet = workbook.createSheet("���� ����"); 	// ���� ��Ʈ�̸� ����
		sheet.setDefaultColumnWidth(30); 	// ��Ʈ ���� ���� ����
		CellStyle style = workbook.createCellStyle(); 	// �� ��Ÿ�� ���� ����
		Font font = workbook.createFont(); 	// ��Ʈ ���� ���� 
		font.setFontName("Arial"); 	// ��Ʈ �̸� ����
		style.setFillForegroundColor(HSSFColor.BLUE.index); 	// �ε��� �� ����
		style.setFillPattern(CellStyle.SOLID_FOREGROUND); 	// �� �ȿ� ä�� ���� ����
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 	// ���� ���� ����
		font.setColor(HSSFColor.WHITE.index); 	// �ε��� ���� ���� ����
		style.setFont(font); 	// ��Ʈ�� ������ �� ��Ÿ�Ͽ� ����
		HSSFRow header = sheet.createRow(0); 	// ����� 0��° �ٿ� ������ ����
	
		// ������ �� Ÿ��Ʋ
		String[] str = {"c_num","c_title","c_name","c_date1","c_date2","c_pnum","c_loc1","c_loc2","c_img","c_comment","c_category","c_price","c_count","c_point"};
		
		for(int i=0; i< str.length;i++) {
			header.createCell(i).setCellValue(str[i]); 	// �迭�� ������ �ε����� �����ϰ�
			header.getCell(i).setCellStyle(style); 	// ������ ���� ��Ÿ���� ������.
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
		response.setHeader("Content-Disposition", 	// 2018/12/20 fix ���� �̸��� ������ �ȵǰ�
				"attachment; filename=classlist_exce.xls"); 	// ��Ʈ�ѷ��� �޴� �޼��� �̸��� �� ������;
	}	
}