package lionsclubs.com.cmm.excel;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lionsclubs.com.cmm.common.CommonUtil;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractExcelView;

@Service
public class JxlsExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		XLSTransformer transformer = new XLSTransformer();
		String templateFileName = (String) model.get("templateFileName");;
		String destFileName = (String) model.get("destFileName");
		FileInputStream is = new FileInputStream(templateFileName);
		transformer.registerRowProcessor(new CustomRowProcessor());
		Workbook resultWorkbook = transformer.transformXLS(is, model);


		StringBuffer contentDisposition = new StringBuffer();
		contentDisposition.append("attachment;fileName=\"");
		contentDisposition.append(CommonUtil.getFileName(request, destFileName));
		contentDisposition.append("\";");

		response.setHeader("Content-Disposition", contentDisposition.toString());
		response.setContentType("application/x-msexcel");
		resultWorkbook.write(response.getOutputStream());
	}
}
