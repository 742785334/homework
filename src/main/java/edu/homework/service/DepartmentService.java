package edu.homework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homework.dao.DepartmentDao;
import edu.homework.model.Department;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;

	public List<Department> loadAll() {

		return departmentDao.loadAll();

	}

	public int getCurrentDepartNumber() {

		List<Department> listDepartment = loadAll();
		int max = 0;

		if (listDepartment != null) {

			for (Department depart : listDepartment) {
				if (max < depart.getDepartNumber())
					max = depart.getDepartNumber();

			}

		}
		return max;

	}
	
	public void add(Department department){
		
		departmentDao.save(department);
		
	}
	
	public void delete(Department department){
		
		departmentDao.delete(department);
	}
	
	public void update(Department department){
		
		departmentDao.update(department);
		
	}
	
	public void saveAndUpdate(Department department){
		
		departmentDao.saveOrUpdate(department);
	}

}
