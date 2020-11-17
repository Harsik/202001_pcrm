package softdb.monitor.web;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.EgovMessageSource;
import softdb.common.web.BaseController;
import softdb.monitor.service.MonitoringService;

@Controller
public class ExcelController extends BaseController {

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
	@Resource(name = "monitoringService")
	private MonitoringService monitoringService;
	
	private XSSFSheet hssfSheet;
	private XSSFRow hssfRow;
	private XSSFCell hssfCell;
	private XSSFDataFormat hssfFormat;
	
	private XSSFFont styleTitleFont;				// 타이틀폰트
	private XSSFFont styleHeaderFont;				// 헤더폰트
	private XSSFFont styleCommonFont;				// 일반 폰트
	private XSSFCellStyle styleTitle;				// 타이틀 셀 스타일
	private XSSFCellStyle styleHeader;			// 헤더 셀 스타일
	private XSSFCellStyle styleCommonCenter;		// 일반 셀 스타일 - align center
	private XSSFCellStyle styleCommonLeft;		// 일반 셀 스타일 - align left
	
	@RequestMapping(value = "/monitor/excelDownload.do")
	private void excelDownload(Model model, XSSFWorkbook workbook, @RequestParam Map params,HttpServletRequest req, HttpServletResponse res) throws Exception {
		/*
		 * 파라미터 Json -> Object
		 */
		ObjectMapper mapper = new ObjectMapper();
		String json = (String) params.get("excelDown");
		Map<String, String> pMap = mapper.readValue(json, Map.class);

		String excelFileName = URLEncoder.encode((String) (pMap.get("title")), "utf-8"); // 실제파일이름
		String title = URLDecoder.decode(excelFileName, "utf-8"); // 코드에서 사용하기 위한 파일이름

		// 데이터
		ArrayList<?> data = (ArrayList<?>) monitoringService.selectExcelList(pMap);

		if (title == null || title.equals("") || pMap == null)
			return;

		// 스타일 셋팅
		this.setStyle(workbook);
		// 엑셀파일 생성
		this.createExcel(workbook, pMap, data);
		// 파일 다운로드
		this.fileDownload(workbook, res, excelFileName);
	}
	
	@SuppressWarnings("static-access")
	private void setStyle(Workbook workbook) {
		// Font Style - title
		styleTitleFont = (XSSFFont) workbook.createFont();
		styleTitleFont.setFontHeightInPoints((short) 20);
		styleTitleFont.setFontName("맑은 고딕");

		// Font Style - header
		styleHeaderFont = (XSSFFont) workbook.createFont();
		styleHeaderFont.setFontHeightInPoints((short) 11);
		styleHeaderFont.setBoldweight((short) styleTitleFont.BOLDWEIGHT_BOLD);
		styleHeaderFont.setFontName("맑은 고딕");

		// Font Style - common
		styleCommonFont = (XSSFFont) workbook.createFont();
		styleCommonFont.setFontHeightInPoints((short) 11);
		styleCommonFont.setFontName("맑은 고딕");

		// Cell Style - title
		styleTitle = (XSSFCellStyle) workbook.createCellStyle();
		styleTitle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		styleTitle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		styleTitle.setFont(styleTitleFont);

		// Cell Style - header
		styleHeader = (XSSFCellStyle)workbook.createCellStyle();
		styleHeader.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		styleHeader.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		styleHeader.setBorderTop(XSSFCellStyle.BORDER_THIN);
		styleHeader.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		styleHeader.setBorderRight(XSSFCellStyle.BORDER_THIN);
		styleHeader.setBorderBottom(XSSFCellStyle.BORDER_DOUBLE);
		styleHeader.setFillPattern((short) 1);
		styleHeader.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
		styleHeader.setFont(styleHeaderFont);

		// Cell Style - common center
		styleCommonCenter = (XSSFCellStyle)workbook.createCellStyle();
		styleCommonCenter.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		styleCommonCenter.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		styleCommonCenter.setBorderTop(XSSFCellStyle.BORDER_THIN);
		styleCommonCenter.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		styleCommonCenter.setBorderRight(XSSFCellStyle.BORDER_THIN);
		styleCommonCenter.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		styleCommonCenter.setFont(styleCommonFont);
		
		// Cell Type - 천단위로 콤마찍기
		hssfFormat = (XSSFDataFormat) workbook.createDataFormat();
		styleCommonCenter.setDataFormat(hssfFormat.getFormat("#,##0"));
		
		// Cell Style - common left
		styleCommonLeft = (XSSFCellStyle) workbook.createCellStyle();
		styleCommonLeft.setAlignment(XSSFCellStyle.ALIGN_LEFT);
		styleCommonLeft.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		styleCommonLeft.setFont(styleCommonFont);
	}
	
	@SuppressWarnings("unchecked")
	private void createExcel(Workbook workbook,@RequestParam Map param,ArrayList<?> data) throws UnsupportedEncodingException {
		hssfSheet = null;
		hssfRow = null;
		hssfCell = null;
		int rowNum = 0;
		
		ArrayList<String> headerMap = (ArrayList<String>)param.get("colHeader");
        ArrayList<String> colMap = (ArrayList<String>)param.get("colName");
        String title = URLDecoder.decode(URLEncoder.encode((String)(param.get("title")), "utf-8"), "utf-8");
        String sheetTitle = title.substring(0,title.indexOf("("));
        
        //시트 생성
        hssfSheet = (XSSFSheet) workbook.createSheet(title); 
        
        // title row 생성
        hssfRow = hssfSheet.createRow(++rowNum);
        hssfRow.setHeight((short)700);
        
		// title 셀 병합 범위 설정
        hssfSheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, 0, headerMap.size()-1));
        
		// title 셀생성
		hssfCell = hssfRow.createCell(0);
		hssfCell.setCellStyle(styleTitle);
		hssfCell.setCellValue(new XSSFRichTextString(sheetTitle));
		
		for(int i = 1; i < headerMap.size(); i++)
			hssfCell = hssfRow.createCell(i);
		
		// title과 본문 사이 빈 row 생성
		hssfRow = hssfSheet.createRow(++rowNum);
		
		hssfRow = hssfSheet.createRow(++rowNum);
		hssfCell = hssfRow.createCell(0);
		hssfCell.setCellStyle(styleCommonLeft);
		hssfCell.setCellValue("기간 : " + param.get("startDt") + "~" + param.get("endDt"));
		
		// header 생성
		hssfRow = hssfSheet.createRow(++rowNum);
		hssfRow.setHeight((short)500);
		
		for(int i = 0; i < headerMap.size(); i++)
		{
			hssfCell = hssfRow.createCell(i);
			hssfCell.setCellStyle(styleHeader);
			hssfCell.setCellValue(new XSSFRichTextString(headerMap.get(i)));
		}
		
		// data 생성
		for(int i = 0; i < data.size(); i++)
		{
			hssfRow = hssfSheet.createRow(++rowNum);
			hssfRow.setHeight((short)400);
			
			HashMap<String, Object> rowData = (HashMap<String, Object>)data.get(i);
			
			for(int j = 0; j < colMap.size(); j++)
			{
				String tmp = String.valueOf(rowData.get(colMap.get(j)));
				
				if (tmp == "null") {
				    tmp = "";
				}
				
				hssfCell = hssfRow.createCell(j);
				hssfCell.setCellStyle(styleCommonCenter);
				
				if(StringUtils.isNumeric(tmp) && StringUtils.isNotBlank(tmp)) {
					hssfCell.setCellType(Cell.CELL_TYPE_NUMERIC);
					hssfCell.setCellValue(Integer.parseInt(tmp));
				} else {
					hssfCell.setCellValue(new XSSFRichTextString(tmp));
				}
			}
		}
	}
	
	private void fileDownload(Workbook workbook, HttpServletResponse response, String ps_file) throws IOException {
		OutputStream out = null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = simpleDateFormat.format(new Date());
		try {
			response.setContentType("Application/Msexcel");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + ps_file + "_" + date + ".xlsx\";");
			response.setContentType("application/vnd.ms-excel");
			out = new BufferedOutputStream(response.getOutputStream());
	        workbook.write(out);
	        out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
            if(out != null) out.close();
        }
	}
	
}
