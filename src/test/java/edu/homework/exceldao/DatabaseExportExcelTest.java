package edu.homework.exceldao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.homework.model.Department;
import edu.homework.service.DepartmentService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class DatabaseExportExcelTest {

	@Autowired
	private DepartmentService departmentService;
	
	@Test
	public void test() {

		List<Department> dataList=departmentService.loadAll();
        DatabaseExportExcel<Department> databaseExportExcel=new DatabaseExportExcel<Department>(dataList);
        String excelTitle="���Ź���";
        String []columnName={"���ű��","��������","����������","���Ÿ�����","��������"};
        databaseExportExcel.toExcel(excelTitle, columnName);
        HSSFWorkbook  wb=databaseExportExcel.toExcel(excelTitle, columnName);
	    FileOutputStream outputStream=null;
        try {
		 outputStream=new FileOutputStream(new File("C:"+File.separator+"8901.xls"));
			wb.write(outputStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			
	        try {
	        	if(outputStream!=null){
				outputStream.flush();
				outputStream.close();
	        	}
			} catch (IOException e) {
			    e.printStackTrace();
			}
			
		}
		
	}

}
