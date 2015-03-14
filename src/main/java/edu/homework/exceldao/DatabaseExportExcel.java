package edu.homework.exceldao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.NonUniqueObjectException;

import edu.homework.model.Department;
import edu.homework.service.DepartmentService;
import edu.homework.utils.ExcelUtil;

public class DatabaseExportExcel<T> {

	private List<T> dataList;
	public DatabaseExportExcel(List<T> dataList) {

		this.dataList = dataList;

	}

	public DatabaseExportExcel() {

	}

	public HSSFWorkbook toExcel(String excelTitle, String[] columnName) {

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet(excelTitle);
		Object[][] value = new Object[dataList.size() + 1][columnName.length];

		for (int i = 0; i < columnName.length; i++)
			value[0][i] = columnName[i];

		for (int i = 0; i < dataList.size(); i++) {
			T t = (T) dataList.get(i);

			Field[] field = t.getClass().getDeclaredFields();

			for (int j = 0; j < field.length; j++) {
				String name = field[j].getName();
				String getName = "get" + name.substring(0, 1).toUpperCase()
						+ name.substring(1);
				Method m;
				Object getValue;
				try {
					m = t.getClass().getMethod(getName);
					getValue = m.invoke(t);
					if (getValue != null)
						value[i + 1][j] = getValue;
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}

			}

		}

		ExcelUtil.writeArrayToExcel(wb, sheet, dataList.size() + 1,
				columnName.length, value);
		return wb;

	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public void FromExcel(InputStream inputStream,DepartmentService departmentService) {

	
		try {
			// 创建对Excel工作簿文件的引用
			HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
			// 创建对工作表的引用。
			// HSSFSheet sheet = workbook.getSheet("Sheet1");
			HSSFSheet sheet = workbook.getSheetAt(0);

			int j = 1;// 从第2行开始堵数据
			// 第在excel中读取一条数据就将其插入到数据库中
			Department department=null;
			System.out.println(sheet.getPhysicalNumberOfRows());
			while (j < sheet.getPhysicalNumberOfRows()) {
				HSSFRow row = sheet.getRow(j);
				 department= new Department();

				for (int i = 0; i <= 4; i++) {
					HSSFCell cell =row.getCell(i);
                    if(cell==null)
                    	continue;
				   
                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					if (i == 0) {
					    String numberStr=cell.getStringCellValue().trim();
					    int number=(int)Double.parseDouble(numberStr);
						department.setDepartNumber(number);
					} else if (i == 1)
						department.setDepartName(cell.getStringCellValue());
					else if (i == 2)
						department.setDepartMnemonic(cell.getStringCellValue());

					else if (i == 3)
						department.setDepartLeading(cell.getStringCellValue());
					else if (i == 4)
						department.setDepartProperty(cell.getStringCellValue());
				}

				j++;
				departmentService.saveAndUpdate(department);

			}

		} catch (FileNotFoundException e2) {
			System.out.println("notfound");
			e2.printStackTrace();
		} catch (IOException e3) {
			System.out.println(e3.toString());
			e3.printStackTrace();
		} catch (NonUniqueObjectException e4) {
			System.out.println(e4.toString());

		}

	}

}
