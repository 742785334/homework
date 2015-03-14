package edu.homework.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.homework.exceldao.DatabaseExportExcel;
import edu.homework.model.Department;
import edu.homework.service.DepartmentService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value = "/*")
public class DepartmentAction extends ActionSupport implements
		ModelDriven<Department> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Department department;
	private File upload;
	private String uploadFileName;
	@Autowired
	private DepartmentService departmentService;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	HttpServletRequest request = ServletActionContext.getRequest();

	public Department getModel() {

		return department;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Action(value = "departmentadd", results = { @Result(name = "success", location = "/department.jsp") })
	public String add() throws Exception {

		int nextDepartNumber = departmentService.getCurrentDepartNumber() + 1;
		department.setDepartNumber(nextDepartNumber);
		departmentService.add(department);
		return loadAll();
	}

	@Action(value = "departmentloadall", results = { @Result(name = "success", location = "/department.jsp") })
	public String loadAll() throws Exception {

		List<Department> listDepartment = departmentService.loadAll();
		Set<Department> setDepartments = new TreeSet<Department>();
		setDepartments.addAll(listDepartment);
		request.setAttribute("setDepartments", setDepartments);
		return SUCCESS;

	}

	@Action(value = "departmentupdate", results = { @Result(name = "success", location = "/department.jsp") })
	public String update() throws Exception {
		departmentService.update(department);
		return loadAll();

	}

	@Action(value = "departmentdelete", results = { @Result(name = "success", location = "/department.jsp") })
	public String delete() throws Exception {

		departmentService.delete(department);
		return loadAll();

	}

	@Action(value = "databasetoexcel")
	public String databaseToExcel() throws Exception {
 
		HttpServletResponse response = ServletActionContext.getResponse();
		List<Department> listDepartments = departmentService.loadAll();
		DatabaseExportExcel<Department> databaseExportExcel = new DatabaseExportExcel<Department>(
				listDepartments);
		String excelTitle = "部门管理";
		String[] columnName = { "部门编码", "部门名称", "部门助记符", "部门负责人", "部门属性" };
		HSSFWorkbook wb = databaseExportExcel.toExcel(excelTitle, columnName);
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition",
				"attachment;filename=department.xls");
		response.setCharacterEncoding("UTF-8");
		
		OutputStream outputStream = response.getOutputStream();
		wb.write(outputStream);
		outputStream.close();
		
		return null;
	}

	@Action(value = "importdatabase",results={@Result(name="error",location="/department.jsp"),@Result(name="success",type="redirect",location="departmentloadall")})
	public String importdatabase() throws Exception {
        if(uploadFileName==null)
        	return ERROR;
		
	    if(uploadFileName.indexOf(".xls")==-1){
	    	
	       HttpServletRequest request=ServletActionContext.getRequest();
	       request.setAttribute("infoPrompt", "上传的文件的格式为.xls");
	       return ERROR;
	    }
	    InputStream inputStream=new FileInputStream(upload);
	    DatabaseExportExcel<Department> databaseExportExcel=new DatabaseExportExcel<Department>();
	    databaseExportExcel.FromExcel(inputStream,departmentService);
	    inputStream.close();
	    return SUCCESS;
	}

	@Action(value="manageusers",results={@Result(name="success",location="/manageusers.jsp")})
	public String manageUsers() throws Exception{
		
		HttpServletRequest request=ServletActionContext.getRequest();
		List<Department> listDepartments=departmentService.loadAll();
		request.setAttribute("listDepartments",listDepartments);
		
		return SUCCESS;
	}
	
}
